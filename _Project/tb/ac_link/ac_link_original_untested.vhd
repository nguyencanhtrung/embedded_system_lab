------------------------------------------------------
-- Embedded System Lab (preparation)
-- Filename: ac_link.vhd
-- Functionality: Sends data to AC'97 Codec via AC-Link
-- Author: Jhon Jimenez
-- Created: 27.10.15
-- Group 06
-- Programmer: Trung C. Nguyen
-- Last modified: 08.02.2016
------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lt16soc_peripherals.all;

entity ac_link is
	generic(
		PCM_BW : natural := 16
	);
	port(
		rst         : in  std_ulogic;  -- rst_int avoid working when COLD reset
		
		pcm_valid   : in  std_logic;
		pcm_i_left  : in  std_logic_vector(PCM_BW-1 downto 0);
		pcm_i_right : in  std_logic_vector(PCM_BW-1 downto 0);

		inst_addr   : in  inst_addr_type; -- 8 bits
		inst_data   : in  inst_data_type; -- 16 bits
		inst_valid  : in  std_logic;

		ac97_bitclk : in  std_ulogic;   -- 12.288 MHz; testing cho 100 MHz
		ac97_sdi    : in  std_logic;	-- dont'care
		ac97_sdo    : out std_logic;
		ac97_sync   : out std_logic;
		ac97_rst    : out std_ulogic
	);
end entity ac_link;

architecture Behavioral of ac_link is
	-- An Array of 12 elements, each is std_logic_vector(19 downto 0) 
	type slots_t is array (0 to 11) of slot_type; 
	signal slots    : slots_t := (others => (others => '0'));
	signal tag      : tag_type := (others => '0'); -- std_logic_vector(15 downto 0)
	-- Add more signals if needed

begin

	-- Your code here
	ac97_sync_controller: process(ac97_bitclk, rst)
	variable sync_cnt	: unsigned(7 downto 0);
	begin
	if rst = '1' then					-- COLD reset is occuring	     
		sync_cnt   := (others => '0');
		ac97_sync <= '0';
	elsif rising_edge(ac97_bitclk) then
		-- [1] Behaviour of ac97_sync
		-- no need to reset the variable "sync_cnt" to 0 when reaching 255; 
		-- since 255 also is limitation of an usigned(7 downto 0) number;
		-- It will automatically loop back to zero after the addition of 255 + 1;
		if sync_cnt > 15 then
			ac97_sync <= '0';	-- 16 	-> 255   (240 cycles)
		else 					-- 0 	-> 15    (16 cycles)
			ac97_sync <= '1'; 
		end if;	 
		-- [1] End of ac97_sync
		-- [2] UPDATE new tag and slots -- Look at the DATA SHEET and ONENOTE
		if sync_cnt = 255 then   -- check can than truong hop nay vi co the no se bo qua RESET state
			-- Tag phase 
			tag <= b"1111_1000_0000_0000";   	-- Primary mode
			-- Slot 1 - 12
			slots(0) <= inst_addr & "000000000000"; 	-- write mode / SLOT 1
			slots(1) <= inst_data & "0000";		-- SLOT 2/ Data want to write to register of codec
			slots(2) <= pcm_i_left & "0000";	-- SLOT 3/ LEFT Channel
			slots(3) <=  pcm_i_right & "0000";	-- SLOT 4/ RIGHT Channel
			slots(4) <= (others => '0');		-- SLOT 5/ Reserved
			slots(5) <= (others => '0');		-- SLOT 6/ unused
			slots(6) <= (others => '0');		-- SLOT 7/ unused
			slots(7) <= (others => '0');		-- SLOT 8/ unused
			slots(8) <= (others => '0');		-- SLOT 9/ unused
			slots(9) <= (others => '0');		-- SLOT 10/ Reserved
			slots(10) <= (others => '0');		-- SLOT 11/ Reserved
			slots(11) <= (others => '0');		-- SLOT 12/ Reserved
		end if;
		-- [2] End of update
		-- [3] SENDING AC97-Link Output Frame
		if (sync_cnt >= 0 and sync_cnt <=  15) then -- Tag phase
			-- waiting for 1 clock cycle to start sending tag
			ac97_sdo <= tag(15 - to_integer(sync_cnt)); -- sending MSbit first
		elsif (sync_cnt >= 16 and sync_cnt <= 35) then-- slot 1 <= inst_addr
			if inst_valid = '1' then  -- writing
				ac97_sdo <= slots(0)(35-to_integer(sync_cnt));
			else
				ac97_sdo <= '0';
			end if;
		elsif (sync_cnt >= 36 and sync_cnt <= 55) then -- slot 2 <= inst_data
			if inst_valid = '1' then  -- writing
				ac97_sdo <= slots(1)(55-to_integer(sync_cnt));
			else
				ac97_sdo <= '0';
			end if;
		elsif (sync_cnt >= 56 and sync_cnt <= 75) then -- slot 3 <= LEFT channel
			if pcm_valid = '1' then  -- writing pcm data to the LEFT channel
				ac97_sdo <= slots(2)(75-to_integer(sync_cnt));
			else
				ac97_sdo <= '0';
			end if;
		elsif (sync_cnt >= 76    and sync_cnt <= 95) then -- slot 4 <= RIGHT channel
			if pcm_valid = '1' then  -- writing pcm data to the RIGHT channel
				ac97_sdo <= slots(3)(95-to_integer(sync_cnt));
			else
				ac97_sdo <= '0';
			end if;
		else ac97_sdo <= '0';
--		elsif (sync_cnt <= 96    and sync_cnt >= 115) then -- slot 5
--		elsif (sync_cnt <= 116   and sync_cnt >= 135) then -- slot 6
--		elsif (sync_cnt <= 136   and sync_cnt >= 155) then -- slot 7
--		elsif (sync_cnt <= 156   and sync_cnt >= 175) then -- slot 8
--		elsif (sync_cnt <= 176   and sync_cnt >= 195) then -- slot 9
--		elsif (sync_cnt <= 196   and sync_cnt >= 215) then -- slot 10
--		elsif (sync_cnt <= 216   and sync_cnt >= 235) then -- slot 11
--		elsif (sync_cnt <= 236   and sync_cnt >= 255) then -- slot 12
		end if;
		sync_cnt := sync_cnt + 1;
	end if;
	end process ac97_sync_controller;	
	-- Behaviour of ac97_rst
	ac97_rst <= not rst; -- COLD RESET of ac97 is active low	
	-- End of ac97_rst
	-- End of code
end Behavioral;
