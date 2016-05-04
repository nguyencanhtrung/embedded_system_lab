-- See the file "LICENSE" for the full license governing this code. --
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY test_bench_2 IS
END ENTITY;

ARCHITECTURE sim OF test_bench_2 IS

	constant CLK_PERIOD : time := 10 ns;

	signal clk 	: std_logic := '0';
	signal rst	: std_logic;

	signal led	: std_logic_vector(7 downto 0);
	signal sw	: std_logic_vector(7 downto 0);
	signal btn	: std_logic_vector(6 downto 0);

	COMPONENT lt16soc_top IS
		generic(
			programfilename : string := "../../programs/assignment2code.ram"
		);
		port(
			clk		: in  std_logic;
			rst		: in std_logic;
			led		: out std_logic_vector(7 downto 0);
			sw		: in  std_logic_vector(7 downto 0);
			btn		: in std_logic_vector(6 downto 0)
		);
	END COMPONENT;

BEGIN

	dut: lt16soc_top port map(
		clk=>clk,
		rst=>rst,
		led=>led,
		sw=>sw,
		btn=>btn
	);


	clk	<= not clk after CLK_PERIOD/2;
	rst	<= '1' after CLK_PERIOD, '0' after 2*CLK_PERIOD, '1' after 4*CLK_PERIOD; --'0' after 6*CLK_PERIOD ;
	

--	switch_input: process
--	begin
--		sw	<= x"01";
--		wait for 20000*CLK_PERIOD;
--		sw	<= x"02";
--		wait for 20000*CLK_PERIOD;
--		sw	<= x"07";
--		wait for 20000*CLK_PERIOD;
--	end process switch_input;
	sw	<= x"00", x"02" after 200*CLK_PERIOD, x"04" after 400*CLK_PERIOD ;
	--x"02" after 400*CLK_PERIOD, x"07" after 600*CLK_PERIOD;
	btn	<= b"0100111";
		--wait for 20000*CLK_PERIOD;
		--sw	<= x"01";	

END ARCHITECTURE;
