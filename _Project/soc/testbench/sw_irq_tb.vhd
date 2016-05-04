--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:50:39 11/23/2015
-- Design Name:   
-- Module Name:   /import/lab/esylab/esylab_06/ise/assgn_1_b/sw_irq_tb.vhd
-- Project Name:  assgn_1_b
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: wb_switches
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY work;
USE work.lt16soc_peripherals.ALL;
USE work.wishbone.ALL;
USE work.wb_tp.ALL;
USE work.config.ALL;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sw_irq_tb IS
END sw_irq_tb;
 
ARCHITECTURE behavior OF sw_irq_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT wb_switches
	 generic(
		memaddr		:	generic_addr_type := CFG_BADR_FOO;
		addrmask	:	generic_mask_type := CFG_MADR_FOO
		);
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         sw : IN  std_logic_vector(7 downto 0);
         btn : IN  std_logic_vector(6 downto 0);
         wslvi : IN  wb_slv_in_type;
         wslvo : OUT  wb_slv_out_type;
         irq_line : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal sw : std_logic_vector(7 downto 0) := (others => '0');
   signal btn : std_logic_vector(6 downto 0) := (others => '0');
   signal wslvi : wb_slv_in_type;

 	--Outputs
   signal wslvo : wb_slv_out_type;
   signal irq_line : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: wb_switches PORT MAP (
          rst => rst,
          clk => clk,
          sw => sw,
          btn => btn,
          wslvi => wslvi,
          wslvo => wslvo,
          irq_line => irq_line
        );

   -- Clock process definitions
		clk <= not clk after clk_period / 2;
 
	--	Reset for 2 clock cycle
		rst <= '1', '0' after clk_period * 2;
	-- Enable/ disable interrupt using masks
		wslvi.adr	<= b"000000000000000000000000000000";
		wslvi.sel	<= b"1111";
		wslvi.stb <= '0', '1' after clk_period * 2, '0' after clk_period * 4, '1' after clk_period * 20, '0' after clk_period * 22, '1' after clk_period * 28, '0' after clk_period * 30;
		wslvi.cyc <= '0', '1' after clk_period * 2, '0' after clk_period * 4, '1' after clk_period * 20, '0' after clk_period * 22, '1' after clk_period * 28, '0' after clk_period * 30;
		wslvi.we	<=  '0', '1' after clk_period * 2, '0' after clk_period * 4;--, '1' after clk_period * 20, '0' after clk_period * 22, '1' after clk_period * 28, '0' after clk_period * 30;
		wslvi.dat <= x"00000000", x"00080000" after clk_period * 2, x"00000000" after clk_period * 4,  x"00080000" after clk_period * 28, x"00000000" after clk_period * 30;
		
		sw		<= "00000000", x"01" after clk_period * 6, x"03" after clk_period * 26;
		btn	<= "0000000", "1000000" after clk_period * 34, "0000000" after clk_period * 40 ;
END;
