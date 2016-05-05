--------------------------------------------------------------------------------
-- TU Kaiserslautern
-- Student: Trung C. Nguyen
--  
-- Module Name:   /home/ctnguyen/Works/ESY/Assignment2/tb_switches.vhd
-- Project Name:  ise_project
-- Target Device: 
-- Tool versions: Xilinx ISE 14.7 
-- Description:   
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.wishbone.all;
USE work.wb_tp.all;
use work.lt16x32_global.all;
use work.config.all;
 
ENTITY tb_switches IS
END tb_switches;
 
ARCHITECTURE behavior OF tb_switches IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT wb_switch
	 Generic(
				memaddr		:	generic_addr_type := CFG_BADR_SW;
				addrmask		:	generic_mask_type := CFG_MADR_SW
	 );
    PORT(
				clk 			: 	in  	STD_LOGIC;
				rst 			: 	in  	STD_LOGIC;
				sw 			: 	in  	STD_LOGIC_VECTOR (7 downto 0);
				btn 			: 	in  	STD_LOGIC_VECTOR (6 downto 0);
				wslvi			:	in		wb_slv_in_type;
				wslvo			:	out	wb_slv_out_type);
    END COMPONENT;
    

   -- Switches
   signal clk 		: std_logic := '0';
   signal rst 		: std_logic := '1';
   signal sw 		: std_logic_vector(7 downto 0) := (others => '0');
   signal btn 		: std_logic_vector(6 downto 0) := (others => '0');
   signal wslvi 	: wb_slv_in_type;
   signal wslvo 	: wb_slv_out_type;
	
	-- generate_sync_wb_single_read block
	signal readdata:	std_logic_vector(31 downto 0);
	signal msto		:  wb_mst_out_type;  -- Slave input

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
	-- Generate sync wb single read block
	generate_sync_wb_single_read(msto, wslvo, clk, readdata);
	-- Feed output of Generate block to switches controller
	wslvi.adr		<=	msto.adr;
	wslvi.dat		<=	msto.dat;
	wslvi.we			<=	msto.we;
	wslvi.sel		<=	msto.sel;
	wslvi.stb		<=	msto.stb;
	wslvi.cyc		<=	msto.cyc;
	wslvi.cti		<=	msto.cti;
	wslvi.bte		<=	msto.bte;
 
	-- Instantiate the Unit Under Test (UUT)
   uut: wb_switch PORT MAP (
          clk 		=> clk,
          rst 		=> rst,
          sw 		=> sw,
          btn 		=> btn,
          wslvi 	=> wslvi,
          wslvo 	=> wslvo
        );
	
   -- Clock process definitions
   clk_process :process
   begin
		clk 			<= '0';
		wait for clk_period/2;
		clk 			<= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst			<= '1';
		wait for 100*clk_period;
		rst			<= '0';
		wait for 10 * clk_period;
		for i in 0 to 99 loop
			sw 		<= std_logic_vector(to_unsigned(i,8));
			btn 		<=	(others => '0');
			wait for 6 * clk_period;
		end loop;	 
		wait for 20000*clk_period;
		assert false report "Simulation terminated!" severity failure;
   end process;

END;
