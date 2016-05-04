--------------------------------------------------------------------------------
-- COURSE: Embedded System Lab WS 2015-2016
-- Student: Trung C. Nguyen - ID: 395176
--
-- Create Date:   18:59:58 01/08/2016
-- Design Name:   
-- Module Name:   /import/lab/esylab/esylab_06/Trung/project/ac_link/ac_97_controller/tb_ac_97_controller.vhd
-- Project Name:  ac_97_controller
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ac97_controller
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_ac_97_controller IS
END tb_ac_97_controller;
 
ARCHITECTURE behavior OF tb_ac_97_controller IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ac97_controller
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         pcm_sync : OUT  std_logic;
         pcm_valid : IN  std_logic;
         pcm_i_left : IN  std_logic_vector(15 downto 0);
         pcm_i_right : IN  std_logic_vector(15 downto 0);
         ac97_bitclk : IN  std_logic;
         ac97_sdi : IN  std_logic;
         ac97_sdo : OUT  std_logic;
         ac97_sync : OUT  std_logic;
         ac97_rst : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal pcm_valid : std_logic := '0';
   signal pcm_i_left : std_logic_vector(15 downto 0) := (others => '0');
   signal pcm_i_right : std_logic_vector(15 downto 0) := (others => '0');
   signal ac97_bitclk : std_logic := '0';
   signal ac97_sdi : std_logic := '0';

 	--Outputs
   signal pcm_sync : std_logic;
   signal ac97_sdo : std_logic;
   signal ac97_sync : std_logic;
   signal ac97_rst : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns; -- 100 MHz
   constant ac97_bitclk_period : time := 81 ns; -- 12.288 MHz
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ac97_controller PORT MAP (
          clk => clk,
          rst => rst,
          pcm_sync => pcm_sync,
          pcm_valid => pcm_valid,
          pcm_i_left => pcm_i_left,
          pcm_i_right => pcm_i_right,
          ac97_bitclk => ac97_bitclk,
          ac97_sdi => ac97_sdi,
          ac97_sdo => ac97_sdo,
          ac97_sync => ac97_sync,
          ac97_rst => ac97_rst
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   ac97_bitclk_process :process
   begin
		ac97_bitclk <= '0';
		wait for ac97_bitclk_period/2;
		ac97_bitclk <= '1';
		wait for ac97_bitclk_period/2;
   end process;
	
	rst <= '1', '0' after clk_period;
	
	pcm_i_left <= x"ABCD" after 1 us;
	pcm_i_right <= x"BCEF" after 1 us;
	pcm_valid <= '1' after 1 us;

END;
