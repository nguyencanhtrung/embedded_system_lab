-- See the file "LICENSE" for the full license governing this code. --

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.lt16x32_global.all;
--USE work.wishbone.all;
USE work.config.all;

ENTITY lcd_slave IS

	port(
		clk			: IN std_logic;
		rst			: IN std_logic;

		dataLCD		: INOUT std_logic_vector(7 downto 0);
		enableLCD	: OUT std_logic;
		rsLCD		: OUT std_logic;
		rwLCD		: OUT std_logic;

		--DMA device  signals
		DMA_data		: in std_logic_vector (10 downto 0);
		DMA_write_LCD 	: in std_logic;
		lcd_is_busy	: out std_logic;
		lcd_is_done	: out std_logic

	);
END ENTITY;

ARCHITECTURE behav OF lcd_slave IS



		--CONSTANT DECLARATION --
	constant delay40ms		: integer :=4000000;	--from 4_000_000
	constant delay37us		: integer:=4000;		--from 4000
	constant delay1us		: integer:=100000;		--from 100
	constant delay1_5ms 		: integer:=152000;	--from 152000


	signal lcd_reg		: std_logic_vector(10 downto 0);
	signal ack			: std_logic;
	signal inst_data	: std_logic_vector(3 downto 0);
	signal data_buf	: std_logic_vector (7 downto 0); 
	signal busy			: std_logic;
--	signal clear_inst_data		: std_logic:

--COUNTERS
	signal counter_40		: integer:=0;
	signal counter_37		: integer:=0;
	signal counter_1		: integer:=0;
	signal counter_152	: integer:=0;
	
--edited part
	signal init_done 		: std_logic;
	signal dummy			: std_logic;

BEGIN

	process(clk)
	begin

		if clk'event and clk='1' then
			if rst = '1' then
				ack			<= '0';
				lcd_reg		<= (others => '0');
				data_buf <= x"00";
				inst_data <= "0000";
			else
				if DMA_write_LCD= '1' then
						lcd_reg	<= DMA_data(10 downto 0);			
						if lcd_reg(10) ='1' and lcd_reg(9) ='1' and lcd_reg(8) ='1' then
							inst_data <= lcd_reg (3 downto 0);		--commands
						else					
							inst_data <= "0101"; 				--gp data
							data_buf <=lcd_reg (7 downto 0);
						end if;			
				end if;				
				if busy='0' and init_done ='1' then	--edited part
							lcd_is_busy	<= '0';			--edited part
						else 
							lcd_is_busy	<= '1';			--edited part
				end if;				
			end if;
		end if;			
	end process;

		--edited part

update:	process(clk, inst_data)

	begin

	if clk'event and clk='1' then

		if rst = '1' then
			busy <= '0';
			lcd_is_done <= '0';
			
		elsif init_done = '1' then

			case inst_data is

			when "0010" =>		--on off command (inst_data=2)
		
				busy <= '1';
				lcd_is_done <= '0';
		
				if counter_37 < delay37us then
		
					enableLCD	<= '1';
					rsLCD		<= '0';
					rwLCD		<= '0';
					dataLCD		<= x"0F";
					counter_37 <= counter_37 +1;
		
				elsif counter_37=delay37us then
		
					enableLCD	<= '0';
					rsLCD		<= '0';
					rwLCD		<= '0';
					dataLCD		<= x"0F";
		
					if counter_1 < delay1us then
		
						enableLCD	<= '0';
						rsLCD		<= '0';
						rwLCD		<= '0';
						dataLCD		<= x"0F";
						counter_1 <= counter_1 +1;
		
					elsif counter_1 = delay1us then
		
						busy <= '0';			--clear flag
						lcd_is_done <= '1';
						counter_40 <= 0;
						counter_37 <= 0;
						counter_1 <= 0;
		
					else null;
		
					end if;	--if counter_1
		
				else null;
				
				end if;	--if counter_37 <		
		
	--edited part starts here			
		
			when "0011" =>	--display clear command (inst_data=3)
		
				busy <= '1';
				lcd_is_done <= '0';
		
				if counter_37 < delay37us then
		
					enableLCD	<= '1';
					rsLCD		<= '0';
					rwLCD		<= '0';
					dataLCD		<= x"01";
					counter_37 <= counter_37 +1;
		
				elsif counter_37=delay37us then
		
					enableLCD	<= '0';
					rsLCD		<= '0';
					rwLCD		<= '0';
					dataLCD		<= x"01";
		
					if counter_1 < delay1us then
		
						enableLCD	<= '0';
						rsLCD		<= '0';
						rwLCD		<= '0';
						dataLCD		<= x"01";
						counter_1 <= counter_1 +1;
		
					elsif counter_1 = delay1us then
		
						busy <= '0';			--clear flag
						lcd_is_done <= '1';
						counter_40 <= 0;
						counter_37 <= 0;
						counter_1 <= 0;
		
					else null;
		
					end if;	--if counter_1
		
				else null;
				
				end if;	--if counter_37 <		
		
					
			when "0100" =>	--entry mode set command (inst_data=4)

		
				busy <= '1';
				lcd_is_done <= '0';
				if counter_152< delay1_5ms then
		
					enableLCD	<= '1';
					rsLCD		<= '0';
					rwLCD		<= '0';
					dataLCD		<= x"06";
					counter_152 <= counter_152 +1;
		
				elsif counter_152=delay1_5ms then
		
					enableLCD	<= '0';
					rsLCD		<= '0';
					rwLCD		<= '0';
					dataLCD		<= x"06";
		
					if counter_1 < delay1us then
		
						enableLCD	<= '0';
						rsLCD		<= '0';
						rwLCD		<= '0';
						dataLCD		<= x"06";
						counter_1 <= counter_1 +1;
		
					elsif counter_1 = delay1us then
		
						busy <= '0';			--clear flag

						lcd_is_done <= '1';
						counter_40 <= 0;
						counter_37 <= 0;
						counter_1 <= 0;
						counter_152 <=0;

		
					else null;
		
					end if;	--if counter_1
		
				else null;
				
				end if;	--if counter_37 <		
		
					

			when "0101" =>	--gp data for lcd (inst_data=5)
	
				busy <= '1';
				lcd_is_done <= '0';
				if counter_37 < delay37us then
		
					enableLCD	<= '1';
					rsLCD		<= '1';
					rwLCD		<= '0';
					dataLCD		<= data_buf;	--edited from <= x"41";
					counter_37 <= counter_37 +1;
		
				elsif counter_37=delay37us then
		
					enableLCD	<= '0';
					rsLCD		<= '1';
					rwLCD		<= '0';
					dataLCD		<= data_buf;	--edited from <= x"41";
		
					if counter_1 < delay1us then
		
						enableLCD	<= '0';
						rsLCD		<= '1';
						rwLCD		<= '0';
						dataLCD	<= data_buf;	--edited from <= x"41";
						counter_1 <= counter_1 +1;
		
					elsif counter_1 = delay1us then
		
						busy <= '0';			--clear flag
						lcd_is_done <= '1';
						counter_40 <= 0;
						counter_37 <= 0;
						counter_1 <= 0;
						counter_152 <=0;
		
					else null;
		
					end if;	--if counter_1
		
				else null;
				
				end if;	--if counter_37 <		


	--edited part ends here
			when "0111"		=>
			
			dummy <='1';
			
			when others	    =>
		
				null;

			end case;
--------------edited new----------------
		elsif init_done ='0' then
						busy <='1';
			
				if counter_40 < delay40ms then
			
					enableLCD	<= '1';
					rsLCD		<= '0';
					rwLCD		<= '0';
					dataLCD		<= x"38";
					counter_40 <= counter_40+1;	
			
				elsif counter_40 = delay40ms then
			
					enableLCD	<= '1';
					rsLCD		<= '0';
					rwLCD		<= '0';
					dataLCD		<= x"38";
					
					if counter_37 < delay37us then
			
						enableLCD	<= '1';
						rsLCD		<= '0';
						rwLCD		<= '0';
						dataLCD		<= x"38";
						counter_37 <= counter_37 +1;
			
					elsif counter_37=delay37us then
			
						enableLCD	<= '0';
						rsLCD		<= '0';
						rwLCD		<= '0';
						dataLCD		<= x"38";
			
						if counter_1 < delay1us then
			
							enableLCD	<= '0';
							rsLCD		<= '0';
							rwLCD		<= '0';
							dataLCD		<= x"38";
							counter_1 <= counter_1 +1;
			
						elsif counter_1 = delay1us then
			
							busy <= '0';			--clear flag
							counter_40 <= 0;
							counter_37 <= 0;
							counter_1 <= 0;
							init_done <='1';		--make init_1=1;
			
						else null;
			
						end if;	--if counter_1
			
					else null;
					
					end if;	--if counter_37 <		
			
				else null;
			
				end if;	--	if counter_40
		
		
		else null;
--------------edited new ends here---------------------
		end if;
	end if;
	
	end process update;




	--edited part ends here


--	enableLCD	<= lcd_reg(10);
--	rsLCD		<= lcd_reg(9);
--	rwLCD		<= lcd_reg(8);
--	dataLCD		<= lcd_reg(7 downto 0) when lcd_reg(8) = '0' else "ZZZZZZZZ";

END ARCHITECTURE;