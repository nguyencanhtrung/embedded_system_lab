-- See the file "LICENSE" for the full license governing this code. --

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.lt16x32_global.all;
USE work.wishbone.all;
USE work.config.all;

ENTITY wb_lcd IS
	generic(
		memaddr		: generic_addr_type;
		addrmask	: generic_mask_type
	);
	port(
		clk			: IN std_logic;
		rst			: IN std_logic;

		dataLCD		: INOUT std_logic_vector(7 downto 0);
		enableLCD	: OUT std_logic;
		rsLCD		: OUT std_logic;
		rwLCD		: OUT std_logic;

		wslvi		: IN wb_slv_in_type;
		wslvo		: OUT wb_slv_out_type
	);
END ENTITY;

ARCHITECTURE behav OF wb_lcd IS
BEGIN
----------------------------------
-- CONSTANT DECLARATION --
constant delay40ms	: integer 	:= 4_000_000;
constant delay37us	: integer	:= 3700;
constant delay500ns	: integer	:= 50;
constant delay700ns	: integer	:= 70;
constant delay1andhalfms 	: integer := 15;

-- STATE DECLARATION --
type state_enable_gen is (E, EH, EL)
signal pr_state_en, nx_state_en: state_enable_gen;

type state_displayFSM is (IFS, W1, FS1, W2, FS2, WND, RW, B)
signal pr_state_disp, nx_state_disp : state_displayFSM;

-- SIGNAL DECLARATION --
signal cycle_e	: std_logic;
signal count_e	: integer;
signal e_edge	: std_logic;
--signal count_e_buf: integer;
----------------------------------
process(clk, rst)
begin
if clk'event and clk = '1' then
	if rst = '1' then
		--count_e <= 0;
		pr_state_en <= E;
	else
		--count_e <= count_e_buf;
		pr_state_disp <= nx_state_disp;
		pr_state_en <= nx_state_en;
	end if;
end if;
end process;

-- Enable generator process --
process(pr_state_disp)
begin
case pr_state_disp
	when E =>			-- waiting for cycle enable (for writing or reading to DDRAM)
		e_edge <= '0'; -- e_edge = false, e_edge được sử dụng để báo cho display finite state machine biết data được write or not, vì data chỉ được write ở falling edge của enable, or e_edge = true tức là báo được ghi
		if cycle_e = false then
			count_e <= 0;			-- setup initial values
			enableLCD <= '0';  
			nx_state_disp <= E;		
		else			-- cycle enables => changing the enableLCD to "high"
			count_e <= count_e + 1; -- counter wait for 500 ns;
			enableLCD <= '1';		-- enableLCD được set High
			nx_state_disp <= EH;
	
	when EH =>			-- 
		if cycle_e = true and count_e < delay500ns then
			count_e <= count_e + 1; -- counter wait for 500 ns;
			enableCLD <= '1';		-- enable keeps high for 500ns
			e_edge <= '0'; 			-- e_edge = false
			nx_state_disp <= EH;
		elsif cycle_e = true and count_e = delay500ns then
			count_e <= 0;
			enableLCD <= '0';		-- enable được set LOW
			e_edge <= '1'; 			-- e_edge = true, ám chỉ rằng data được sample into the LCD; nó chỉ được hold true trong duy nhất 1 clock cycle
			nx_state_disp <= EL;
		else null;
		end if; 
		
	when EL =>
		if count_e < delay700ns then
			count_e <= count_e + 1; -- counter wait for 700 ns;
			enableCLD <= '0';		-- enable keeps low for 700ns
			e_edge <= '0';			-- e_edge = false
			nx_state_disp <= EL;
		elsif count_e = delay700ns then
			count_e <= 0;
			enableLCD <= '0';		-- enable được set LOW
			e_edge <= '0'; 			-- e_edge = true, ám chỉ rằng data được sample into the LCD; nó chỉ được hold true trong duy nhất 1 clock cycle
			nx_state_disp <= E;
		else null;
end case
end process;