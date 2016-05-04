------------------------------------------------------
-- Embedded System Lab
-- Filename: audio.vhd [testing version]
-- Functionality: tone selection, tone generation (square waveform), ROM behavior
-- Author: Trung C. Nguyen
-- Created: 07.01.16
-- Last modified: 
------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.lt16x32_global.all;
use work.wishbone.all;
use work.config.all;
use work.lt16soc_peripherals.all;

entity audio is
	generic(
		MEMADDR     : generic_addr_type; --:= CFG_BADR_AUDIO;
		ADDRMASK    : generic_mask_type; --:= CFG_MADR_AUDIO;
		DATA_BW     : natural := 16;
		TONE_SEL_BW : natural := 8
	);  
	port(
		clk         : in  std_logic;
		rst         : in  std_logic;

		ac97_bitclk : in  std_logic;
		ac97_sdi    : in  std_logic;
		ac97_sdo    : out std_logic;
		ac97_sync   : out std_logic;
		ac97_rst    : out std_logic;

		wslvi       : in  wb_slv_in_type;
		wslvo       : out wb_slv_out_type
	);
end entity;

architecture Behavioral of audio is
	
	signal pcm_sync : std_logic := '0';
	signal ce       : std_logic := '0';
	signal rst_ac97 : std_logic := '0';
	signal pcm     	: 	std_logic_vector(DATA_BW-1 downto 0);
	signal tone_sel : std_logic_vector(TONE_SEL_BW-1 downto 0);
	signal new_tone : std_logic := '0';
	
	constant ROM_SIZE: integer := 16;
	type mem is array ( 0 to ROM_SIZE - 1) of std_logic_vector(7 downto 0);
	constant rom : mem := (
	    0  => x"B7", -- 183
	    1  => x"AD", -- 173
	    2  => x"A4", -- 164
	    3  => x"9A", -- 154
	    4  => x"92", -- 146
	    5  => x"8A", -- 138
	    6  => x"82", -- 130
	    7  => x"7A", -- 122
	    8  => x"74", -- 116
	    9  => x"6D", -- 109
	    10 => x"67", -- 103
	    11 => x"61", -- 97
	    12 => x"5C", -- 92
	    13 => x"57", -- 87
	    14 => x"52", -- 82
	    15 => x"4D"  -- 77
	    );

--#Key Name	#sample	HEX	BINARY
--40	  C4	183		B7	10110111
--41	  C#4	173		AD	10101101
--42	  D4	164		A4	10100100
--43	  D#4	154		9A	10011010
--44	  E4	146		92	10010010
--45	  F4	138		8A	10001010
--46	  F#4	130		82	10000010
--47	  G4	122		7A	1111010
--48	  G#4	116		74	1110100
--49	  A4	109		6D	1101101
--50	  A#4	103		67	1100111
--51	  B4	97		   61	1100001
--52	  C5	92		   5C	1011100
--53	  C#5	87		   57	1010111
--54	  D5	82		   52	1010010
--55	  D#5	77		   4D	1001101
--0		MUTED
begin	
	bus_interface : process(clk)
	begin
	if rising_edge(clk) then
		if rst = '1' then
			ack  <= '0';
			data <= x"0F";
			new_tone <= '0';  -- changed
		else
			if wslvi.stb = '1' then
				if wslvi.we = '1' then  -- Data sent from Master to Slave 
					data <= dec_wb_dat(wslvi.sel,wslvi.dat)(7 downto 0);
					new_tone <= '1';  -- changed
				end if;
				ack <= wslvi.stb and wslvi.cyc;
			else
				ack <= '0';
				new_tone <= '0';  -- changed
			end if;
		end if;
	end if;
	end process bus_interface;


	wslvo.dat( 7 downto 0) <= data;
	wslvo.dat(31 downto 8) <= (others => '0');
	wslvo.ack              <= ack;
	wslvo.wbcfg            <= wb_membar(MEMADDR, ADDRMASK);


	tone_selection : process(new_tone)   -- pcm_sync: 48 KHz
	begin
	if rising_edge(new_tone) and data /= X"00" then  -- need to bouncing the range from 40 to 55
			tone_sel <= rom(to_integer(unsigned(data(7 downto 0))) - 40);
	end if;
	end process tone_selection;

	tone_gen : process(pcm_sync,rst) 	-- pcm_sync: 48 KHz <- sample frequency
	variable sample_counter: unsigned(7 downto 0);
	variable half_period: unsigned(7 downto 0);
	variable full_period: unsigned(7 downto 0);
	begin
	if rst = '1' then
		pcm  <= (others => '0');
		sample_counter := X"00";
		ce <= '0';
	elsif rising_edge(pcm_sync) then
		-- Your code for the tone generation
		full_period := unsigned(tone_sel);
		half_period := (unsigned(tone_sel) srl 1);
		if data = X"00" then				-- MUTED
			pcm <= (others => '0');
			ce <= '1';
		elsif (pcm_sync 'event) then		-- Square waveform
			if (sample_counter < half_period) then
				pcm <= (others => '1');
				ce <= '1';
				sample_counter  := sample_counter + 1;
			elsif (sample_counter < full_period) then 
				pcm <= (others => '0');
				ce <= '1';
				sample_counter  := sample_counter + 1;
			else 
				sample_counter := X"00";
				ce <= '0';
			end if;
		else null; 
		end if;
		-- End
	end if;
	end process tone_gen;

-- PORT MAP to ac97_controller
	ac_97 : ac97_controller
	generic map(
		PCM_BW => DATA_BW
	)
	port map(
		clk         => clk,
		rst         => rst,   		-- COLD reset

		pcm_sync    => pcm_sync,
		pcm_valid   => ce,
		pcm_i_left  => pcm,
		pcm_i_right => pcm,

		ac97_bitclk => ac97_bitclk,
		ac97_sdi    => ac97_sdi,
		ac97_sdo    => ac97_sdo,
		ac97_sync   => ac97_sync,
		ac97_rst    => rst_ac97
	);
		
	ac97_rst <= rst_ac97;

end architecture;
