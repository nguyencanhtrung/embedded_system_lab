LIBRARY ieee;
	use ieee.std_logic_1164.ALL;
	use ieee.numeric_std.ALL;
 -- use work.lt16x32_global.all;
	use work.wishbone.all;
	use work.config.all;
 -- library work;
	use work.wishbone.all;
	use work.wb_tp.all;
--USE ieee.numeric_std.ALL;
 
ENTITY switch_tb IS
END switch_tb;
 
ARCHITECTURE behavior OF switch_tb IS 
 
 -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT wb_switches
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         btn : IN  std_logic_vector(6 downto 0);
         sw : IN  std_logic_vector(7 downto 0);
         wslvi : IN wb_slv_in_type;
         wslvo : OUT wb_slv_out_type
        );
    END COMPONENT;
 
 --Signal declaration
   signal clk 		: std_logic := '0';
   signal rst 		: std_logic := '0';
   signal btn 		: std_logic_vector(6 downto 0) := (others => '0');
   signal sw 		: std_logic_vector(7 downto 0) := (others => '0');
   signal wslvi 	: wb_slv_in_type;
  -- signal x1 		: std_logic_vector(31 downto 0):=x"1111_1111";
   signal wslvo 	: wb_slv_out_type;
	--signal readdata: std_logic_vector(WB_PORT_SIZE -1 downto 0);

 -- Clock period definitions
   constant CLK_PERIOD : time := 10 ns;
	--constant adr_offset : integer := 0;
	--constant size			: std_logic_vector(WB_ADR_BOUND -1 downto 0) := "10"; -- size 00 = byte, 01 = halfword, 10 = word
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: wb_switches PORT MAP (
          clk => clk,
          rst => rst,
          btn => btn,
          sw => sw,
          wslvi => wslvi,
          wslvo => wslvo
        );

   -- Clock process definitions
	clk <= not clk after CLK_PERIOD/2;

   --Stimulus process
			rst	<= '0' after CLK_PERIOD;
			
			wslvi.stb <= '1' after CLK_PERIOD * 3/2, '0' after CLK_PERIOD * 7/2, '1' after CLK_PERIOD * 9/2 ,'0' after CLK_PERIOD * 13/2,'1' after CLK_PERIOD * 15/2;
			wslvi.cyc <= '1' after CLK_PERIOD * 3/2 , '0' after CLK_PERIOD * 7/2, '1' after CLK_PERIOD * 9/2,'0' after CLK_PERIOD * 13/2,'1' after CLK_PERIOD * 15/2;
			wslvi.we <= '0' after CLK_PERIOD * 3/2 , '1' after CLK_PERIOD * 7/2, '0' after CLK_PERIOD * 9/2 ,'1' after CLK_PERIOD * 13/2,'0' after CLK_PERIOD * 15/2;
			
			sw <= x"BF" after CLK_PERIOD * 3/2, x"FB" after CLK_PERIOD * 9/2 ,x"34" after CLK_PERIOD * 13/2, x"56" after CLK_PERIOD * 15/2;
			btn <= "0110111" after CLK_PERIOD * 3/2, "1001000" after CLK_PERIOD * 9/2 ,"1011000" after CLK_PERIOD * 13/2, "1001011" after CLK_PERIOD * 15/2;
			
			wslvi.sel <= b"0001" ; --after CLK_PERIOD * 3/2, b"0011" after CLK_PERIOD * 9/2, b"1111" after CLK_PERIOD * 15/2;
			wslvi.adr <= x"1234";
			wslvi.dat <= x"2561";
				

  END;
