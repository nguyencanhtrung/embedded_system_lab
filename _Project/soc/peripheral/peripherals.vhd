-- See the file "LICENSE" for the full license governing this code. --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library work;
use work.lt16x32_internal.all;
use work.lt16x32_global.all;
use work.wishbone.all;
use work.config.all;

package lt16soc_peripherals is

	component wb_led is
	generic(
		memaddr		:	generic_addr_type;-- := CFG_BADR_LED;
		addrmask	:	generic_mask_type-- := CFG_MADR_LED;
	);
	port(
		clk		: in  std_logic;
		rst		: in  std_logic;
		led		: out  std_logic_vector(7 downto 0);
		wslvi	:	in	wb_slv_in_type;
		wslvo	:	out	wb_slv_out_type
	);
	end component;

	component wb_switches is
	generic(
		memaddr		:	generic_addr_type; --:= CFG_BADR_FOO;
		addrmask	:	generic_mask_type --:= CFG_MADR_FOO;
	);
	port(
		--global signals
		clk		: 	in  std_logic;
		rst		: 	in  std_logic;

		--wihsbone signals
		wslvi		:	in	wb_slv_in_type;
		wslvo		:	out	wb_slv_out_type;

		--non wishbone signals
		sw	 	:	in	std_logic_vector(7 downto 0);
		btn 		:	in	std_logic_vector(6 downto 0);
		irq_line		:	out 	std_logic					-- interrupt line for sw_btn
	);
	end component;

	component wb_lcd is
	generic(
		memaddr		:	generic_addr_type; --:= CFG_BADR_LCD;
		addrmask	:	generic_mask_type --:= CFG_MADR_LCD;
	);
	port(
		--global signals
		clk		: 	in  std_logic;
		rst		: 	in  std_logic;

		--wihsbone signals
		wslvi		:	in	wb_slv_in_type;
		wslvo		:	out	wb_slv_out_type;

		--non wishbone signals

		dataLCD		: INOUT std_logic_vector(7 downto 0);
		enableLCD	: OUT std_logic;
		rsLCD		: OUT std_logic;
		rwLCD		: OUT std_logic
	);
	end component;	
	
-- BEGIN AUDIO Components -----------------------------------------------
	constant DATA_BW     : natural := 16;
	constant TONE_SEL_BW : natural := 8;

	component audio
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
	end component;

	subtype tag_type is std_logic_vector(15 downto 0);			-- for AC97 Link frame
	subtype inst_addr_type is std_logic_vector(7 downto 0);
	subtype inst_data_type is std_logic_vector(15 downto 0);
	subtype slot_type is std_logic_vector(19 downto 0);			-- for AC97 Link frame

	component ac_link is
		generic(
			PCM_BW : natural := 16
		);
		port(
			rst         : in  std_ulogic;

			pcm_valid   : in  std_logic;
			pcm_i_left  : in  std_logic_vector(PCM_BW-1 downto 0);
			pcm_i_right : in  std_logic_vector(PCM_BW-1 downto 0);

			inst_addr   : in  inst_addr_type;
			inst_data   : in  inst_data_type;
			inst_valid  : in  std_logic;

			ac97_bitclk : in  std_ulogic;
			ac97_sdi    : in  std_logic;
			ac97_sdo    : out std_logic;
			ac97_sync   : out std_logic;
			ac97_rst    : out std_ulogic
		);
	end component;

	component ac97_controller is
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
	end component;
-- END AUDIO Components -----------------------------------------------

end lt16soc_peripherals;

package body lt16soc_peripherals is

	--insert function bodies

end lt16soc_peripherals;

