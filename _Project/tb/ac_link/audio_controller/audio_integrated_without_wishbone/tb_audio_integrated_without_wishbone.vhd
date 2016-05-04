--------------------------------------------------------------------------------
-- COURSE; Embedded System Lab WS15-16 
-- Student: Trung C. Nguyen
--
-- Create Date:   21:51:52 01/08/2016
-- Design Name:   
-- Module Name:   /import/lab/esylab/esylab_06/Trung/project/ac_link/audio_controller/audio_integrated_without_wishbone/tb_audio_integrated_without_wishbone.vhd
-- Project Name:  audio_integrated_without_wishbone
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: audio
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
 
ENTITY tb_audio_integrated_without_wishbone IS
END tb_audio_integrated_without_wishbone;
 
ARCHITECTURE behavior OF tb_audio_integrated_without_wishbone IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT audio
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         data : IN  std_logic_vector(7 downto 0);
         new_tone : IN  std_logic;
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
   signal data : std_logic_vector(7 downto 0) := (others => '0');
   signal new_tone : std_logic := '0';
   signal ac97_bitclk : std_logic := '0';
   signal ac97_sdi : std_logic := '0';

 	--Outputs
   signal ac97_sdo : std_logic;
   signal ac97_sync : std_logic;
   signal ac97_rst : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;         -- 100 MHz
   constant ac97_bitclk_period : time := 81 ns; -- 12,288 MHz
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: audio PORT MAP (
          clk => clk,
          rst => rst,
          data => data,
          new_tone => new_tone,
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
	data <= x"28" after 100 ns, x"00" after 100 ms, x"29" after 200 ms;
	new_tone <= '1' after 100 ns, '0' after 110 ns, '1' after 100 ms, '0' after 100 ms + 10 ns, '1' after 200 ms, '0' after 200 ms + 10 ns;
END;
