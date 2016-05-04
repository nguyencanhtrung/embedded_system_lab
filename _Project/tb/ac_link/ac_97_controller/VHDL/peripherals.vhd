-- See the file "LICENSE" for the full license governing this code. --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library work;

package lt16soc_peripherals is

	subtype tag_type is std_logic_vector(15 downto 0);
	subtype inst_addr_type is std_logic_vector(7 downto 0);
	subtype inst_data_type is std_logic_vector(15 downto 0);
	subtype slot_type is std_logic_vector(19 downto 0);

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

end lt16soc_peripherals;

package body lt16soc_peripherals is

	--insert function bodies

end lt16soc_peripherals;

