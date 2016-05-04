--------------------------------------------------------------------------------
-- COURSE: Embedded System Lab WS 2015-2016
-- Student: Trung C. Nguyen - ID: 395176
--
-- Create Date:   17:59:36 01/08/2016
-- Design Name:   
-- Module Name:   /import/lab/esylab/esylab_06/Trung/project/ac_link/ac_link/tb_ac_link.vhd
-- Project Name:  ac_link
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ac_link
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
 
ENTITY tb_ac_link IS
END tb_ac_link;
 
ARCHITECTURE behavior OF tb_ac_link IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ac_link
    PORT(
         rst : IN  std_logic;
         pcm_valid : IN  std_logic;
         pcm_i_left : IN  std_logic_vector(15 downto 0);
         pcm_i_right : IN  std_logic_vector(15 downto 0);
         inst_addr : IN  std_logic_vector(7 downto 0);
         inst_data : IN  std_logic_vector(15 downto 0);
         inst_valid : IN  std_logic;
         ac97_bitclk : IN  std_logic;
         ac97_sdi : IN  std_logic;
         ac97_sdo : OUT  std_logic;
         ac97_sync : OUT  std_logic;
         ac97_rst : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal pcm_valid : std_logic := '0';
   signal pcm_i_left : std_logic_vector(15 downto 0) := (others => '0');
   signal pcm_i_right : std_logic_vector(15 downto 0) := (others => '0');
   signal inst_addr : std_logic_vector(7 downto 0) := (others => '0');
   signal inst_data : std_logic_vector(15 downto 0) := (others => '0');
   signal inst_valid : std_logic := '0';
   signal ac97_bitclk : std_logic := '0';
   signal ac97_sdi : std_logic := '0';

 	--Outputs
   signal ac97_sdo : std_logic;
   signal ac97_sync : std_logic;
   signal ac97_rst : std_logic;

   -- Clock period definitions
   constant ac97_bitclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ac_link PORT MAP (
          rst => rst,
          pcm_valid => pcm_valid,
          pcm_i_left => pcm_i_left,
          pcm_i_right => pcm_i_right,
          inst_addr => inst_addr,
          inst_data => inst_data,
          inst_valid => inst_valid,
          ac97_bitclk => ac97_bitclk,
          ac97_sdi => ac97_sdi,
          ac97_sdo => ac97_sdo,
          ac97_sync => ac97_sync,
          ac97_rst => ac97_rst
        );

   -- Clock process definitions
   ac97_bitclk_process :process
   begin
		ac97_bitclk <= '0';
		wait for ac97_bitclk_period/2;
		ac97_bitclk <= '1';
		wait for ac97_bitclk_period/2;
   end process;
 
	rst <= '1', '0' after ac97_bitclk_period * 10;
	inst_addr <= x"04" after ac97_bitclk_period * 10;
	inst_data <= x"0000" after ac97_bitclk_period * 10;
	inst_valid <= '1' after ac97_bitclk_period * 10;
	
	pcm_i_left <= x"ABCD" after ac97_bitclk_period * 10;
	pcm_i_right <= x"BCEF" after ac97_bitclk_period * 10;
	pcm_valid <= '1' after ac97_bitclk_period * 10;

END;
