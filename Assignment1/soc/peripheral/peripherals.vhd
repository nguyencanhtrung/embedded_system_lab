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
		addrmask		:	generic_mask_type-- := CFG_MADR_LED;
	);
	port(
		clk			: 	in  std_logic;
		rst			: 	in  std_logic;
		led			: 	out  std_logic_vector(7 downto 0);
		wslvi			:	in	wb_slv_in_type;
		wslvo			:	out	wb_slv_out_type
	);
	end component;
		-- assignment 2
	component wb_switch is
	 Generic(
				memaddr		:	generic_addr_type; --:= CFG_BADR_SW;
				addrmask		:	generic_mask_type --:= CFG_MADR_SW;
				);
    Port ( 	clk 			: 	in  STD_LOGIC;
				rst 			: 	in  STD_LOGIC;
				sw 			: 	in  STD_LOGIC_VECTOR (7 downto 0);
				btn 			: 	in  STD_LOGIC_VECTOR (6 downto 0);
				wslvi			:	in		wb_slv_in_type;
				wslvo			:	out	wb_slv_out_type);
	end component;
		-- end of assignment 2
end lt16soc_peripherals;

package body lt16soc_peripherals is

	--insert function bodies

end lt16soc_peripherals;

