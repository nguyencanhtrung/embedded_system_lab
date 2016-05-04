------------------------------------------------------
-- Embedded System Lab (preparation)
-- Filename: ac97_controller.vhd
-- Functionality: Transfers commands and sends PCM data to/from AC'97 Codec via AC-Link
-- Author: Jhon Jimenez
-- Created: 27.10.15
-- Last modified: 08.01.16 By Trung C. Nguyen
-- 7:14 PM : tested
------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lt16soc_peripherals.all;

entity ac97_controller is
	generic(
		PCM_BW : natural := 16
	);
	port(
		clk         : in  std_ulogic;
		rst         : in  std_ulogic;

		pcm_sync    : out std_logic;
		pcm_valid   : in  std_logic;
		pcm_i_left  : in  std_logic_vector(PCM_BW-1 downto 0);
		pcm_i_right : in  std_logic_vector(PCM_BW-1 downto 0);

		ac97_bitclk : in  std_ulogic;
		ac97_sdi    : in  std_logic;
		ac97_sdo    : out std_logic;
		ac97_sync   : out std_logic;
		ac97_rst    : out std_ulogic
	);
end entity ac97_controller;

architecture Behavioral of ac97_controller is

	type state_type is (RESET, SET_VOL_HP, SET_VOL_PCM, LISTEN);
	signal state      : state_type;
	signal data_sync  : std_logic;
	signal inst_addr  : inst_addr_type;
	signal inst_data  : inst_data_type;
	signal inst_valid : std_logic;
	signal reset_int  : std_logic;			-- reset_int = 1 => COLD_reset is happening
	signal rst_cnt    : unsigned(7 downto 0);
	signal sync_cnt   : unsigned(7 downto 0);

begin

	-- 48KHz synchronization signal for the PCM data
	pcm_sync <= data_sync;
	cold_reset : process(clk)			-- clk = 100MHz
	begin
	if rising_edge(clk) then
		if rst = '1' then
			reset_int <= '1';
			rst_cnt   <= (others => '0');
		end if;
		
		if reset_int = '1' then
			rst_cnt <= rst_cnt + 1;
			if rst_cnt = x"63" then 	-- 1us delay = (0X"63" + 1) x  1/100 MHz , 
				reset_int <= '0';		-- according to specification of AC-97 codec
			end if;
		end if;
	end if;
	end process cold_reset;


	process(ac97_bitclk, reset_int)
	-- variable sync_cnt   : unsigned(7 downto 0);   -- Preferable
	begin
	if reset_int = '1' then			    -- COLD reset 
		state      <= RESET;
		inst_addr  <= (others => '0');
		inst_data  <= (others => '0');
		inst_valid <= '0';
		sync_cnt   <= (others => '0');
	elsif rising_edge(ac97_bitclk) then -- END of COLD reset
		sync_cnt <= sync_cnt + 1; 		  			-- Note: It's better if sync_cnt is variable;
		
		if sync_cnt > 128 and not(sync_cnt = 255) then
			data_sync <= '1';   		-- frequency of data_sync (48KHz)
		else							-- = frequency of ac97_bitclk / 256
			data_sync <= '0';
		end if;
	
		case state is
			when RESET =>				-- The first 256-cycle 
				sync_cnt   <= (others => '0');
				inst_addr  <= x"04"; 	-- SET VOLUME(ATTENUATION) FOR HP-OUT
				inst_data  <= x"0000";
				inst_valid <= '1';
				state      <= SET_VOL_HP;

			when SET_VOL_HP =>			-- The second 256-cycle  
				if sync_cnt = 255 then	
					state     <= SET_VOL_PCM;
					inst_addr <= x"18"; 	-- PCM OUT
					inst_data <= x"0000";
					inst_valid <= '1';
				end if;

			when SET_VOL_PCM =>			-- The third 256-cycle  
				if sync_cnt = 255 then
					state     <= LISTEN;
					inst_addr <= x"02"; 	-- Master volume 
					inst_data <= x"0000";
					inst_valid <= '1';
				end if;

			when LISTEN =>				-- The last 256-cycle, from now on sending pcm-data only 
				if sync_cnt = 255 then
					--inst_valid <= '0';
				end if;

		end case;
	end if;
	end process;


	ac_link_inst : ac_link
		generic map(
			PCM_BW => PCM_BW
		)
		port map(
			rst         => reset_int,

			pcm_valid   => pcm_valid,
			pcm_i_left  => pcm_i_left,
			pcm_i_right => pcm_i_right,

			inst_addr   => inst_addr,
			inst_data   => inst_data,
			inst_valid  => inst_valid,

			ac97_bitclk => ac97_bitclk,
			ac97_sdi    => ac97_sdi,
			ac97_sdo    => ac97_sdo,
			ac97_sync   => ac97_sync,
			ac97_rst    => ac97_rst
		);
end Behavioral;

