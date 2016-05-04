--------------------------------------------------------------------------------
-- COURSE; Embedded System Lab WS15-16 
-- Student: Trung C. Nguyen
--
-- Create Date:   20:44:34 01/08/2016
-- Design Name:   
-- Module Name:   /import/lab/esylab/esylab_06/Trung/project/ac_link/audio_controller/audio/tb_audio_only.vhd
-- Project Name:  audio
-- Target Device:  
-- Tool versions:  
-- Description:   
-- Working as expected
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
 
ENTITY tb_audio_only IS
END tb_audio_only;
 
ARCHITECTURE behavior OF tb_audio_only IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT audio
    PORT(
         rst : IN  std_logic;
         pcm_sync : IN  std_logic;
         data : IN  std_logic_vector(7 downto 0);
         new_tone : IN  std_logic;
         pcm : OUT  std_logic_vector(15 downto 0);
         ce : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal pcm_sync : std_logic := '0';
   signal data : std_logic_vector(7 downto 0) := (others => '0');
   signal new_tone : std_logic := '0';

 	--Outputs
   signal pcm : std_logic_vector(15 downto 0);
   signal ce : std_logic;
 
   constant pcm_sync_period : time := 10 ns; -- theoretically 48 KHz but for testing choose 100 MHz
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: audio PORT MAP (
          rst => rst,
          pcm_sync => pcm_sync,
          data => data,
          new_tone => new_tone,
          pcm => pcm,
          ce => ce
        );

   -- Clock process definitions
   pcm_sync_process :process
   begin
		pcm_sync <= '0';
		wait for pcm_sync_period/2;
		pcm_sync <= '1';
		wait for pcm_sync_period/2;
   end process;
   
	rst <= '1', '0' after 100 ns;
	data <= x"28" after 100 ns, x"00" after 100 ms, x"29" after 200 ms;
	new_tone <= '1' after 100 ns, '0' after 110 ns, '1' after 100 ms, '0' after 100 ms + 10 ns, '1' after 200 ms, '0' after 200 ms + 10 ns;

END;
