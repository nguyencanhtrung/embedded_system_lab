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

-- STATE DECLARATIOM--
type state is (init, IFS, ONOFF, CLEAR, ENTRY, INITDONE)
signal pr_state, nx_state : state;

		--CONSTANT DECLARATION --
	constant delay40ms		: integer :=4000000;	--from 4_000_000
	constant delay37us		: integer:=4000;	--from 4000
	constant delay1us		: integer:=100;	--from 100
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
	signal counter_152		: integer:=0;

--flags

signal flag_40		:std_logic;		
signal flag_37		:std_logic;
signal flag_152		:std_logic;
signal flag_1		:std_logic;

signal init_flag	:	std_logic;
BEGIN

	process(clk,rst)
	begin
		if clk'event and clk='1' then
			if rst = '1' then
				ack			<= '0';
				lcd_reg		<= (others => '0');
				data_buf <= x"00";
				inst_data <= "0000";
			else	
				pr_state <= nx_state;
				if wslvi.stb = '1' and wslvi.cyc = '1' then

					if wslvi.we = '0' then
						
						if init_flag='0' or pr_state <> WND then
							lcd_reg	<= "11111111111";
						else 
							lcd_reg	<= "00000000000";
						end if;
						
					end if;

					if wslvi.we = '1'  then		--edited part
						lcd_reg	<= dec_wb_dat(wslvi.sel,wslvi.dat)(10 downto 0);
						
						if lcd_reg(10) ='1' and lcd_reg(9) ='1' and lcd_reg(8) ='1' then

							inst_data <= lcd_reg (3 downto 0);		--commands

						else					

							inst_data <= "0101"; 				--gp data
							data_buf <=lcd_reg (7 downto 0);

						end if;
						
					end if;



					if ack = '0' then
						ack		<= '1';
					else
						ack		<= '0';
					end if;
				else
					ack			<= '0';
				end if;
			end if;
			
		end if;
		
	
	end process;

	wslvo.dat(10 downto 0)	<= lcd_reg when wslvi.adr(2) = '0'
		else "000" & dataLCD when wslvi.adr(2) = '1' and lcd_reg(8) = '1'
		else (others => '0');

	wslvo.dat(31 downto 11)	<= (others=>'0');
	wslvo.wbcfg				<= wb_membar(memaddr, addrmask);
	wslvo.ack				<= ack;

		--edited part

update:	process(pr_state, inst_data)

	begin
			case state is
			when init =>
				init_flag <= '0';
				if (inst_data = 0x701) then
					nx_state <= IFS;
				else null;
				end if; 
		
			when IFS =>	--IFS (inst_data=1)
				if counter_40 < delay40ms and flag_40='0' then
					enableLCD	<= '1';
					rsLCD		<= '0';
					rwLCD		<= '0';
					dataLCD		<= x"38";
					counter_40 <= counter_40+1;	
			
				elsif counter_40 = delay40ms and flag_40='0' then
					enableLCD	<= '1';
					rsLCD		<= '0';
					rwLCD		<= '0';
					dataLCD		<= x"38";

					flag_40 <= '1';
				else null;

				end if;	--if counter_40
					
				if counter_37 < delay37us and flag_40 = '1' and flag_37='0' then
						
						enableLCD	<= '1';
						rsLCD		<= '0';
						rwLCD		<= '0';
						dataLCD		<= x"38";
						counter_37 <= counter_37 +1;
			
				elsif counter_37=delay37us and flag_40 = '1' and flag_37='0' then
			
						enableLCD	<= '0';
						rsLCD		<= '0';
						rwLCD		<= '0';
						dataLCD		<= x"38";

						flag_37 <= '1';
				else null;

				end if;
			
				if counter_1 < delay1us and flag_37 ='1' and flag_40 ='1' then
			
							enableLCD	<= '0';
							rsLCD		<= '0';
							rwLCD		<= '0';
							dataLCD		<= x"38";
							counter_1 <= counter_1 +1;
			
				elsif counter_1 = delay1us and flag_37 ='1' and flag_40 ='1' then
							counter_40 <= 0;
							counter_37 <= 0;
							counter_1 <= 0;
							flag_40 <='0';
							flag_37 <='0';
							nx_state <= ONOFF;	
				else null;
				end if;

		
			when ONOFF =>		--on off command (inst_data=2)
				if counter_37 < delay37us and flag_37='0' then
					
					enableLCD	<= '1';
					rsLCD		<= '0';
					rwLCD		<= '0';
					dataLCD		<= x"0F";
					counter_37 <= counter_37 +1;
		
				elsif counter_37=delay37us  and flag_37='0' then
		
					enableLCD	<= '0';
					rsLCD		<= '0';
					rwLCD		<= '0';
					dataLCD		<= x"0F";
					
					flag_37 <='1';

				else null;
				end if;

		
				if counter_1 < delay1us and flag_37='1'   then
		
						enableLCD	<= '0';
						rsLCD		<= '0';
						rwLCD		<= '0';
						dataLCD		<= x"0F";
						counter_1 <= counter_1 +1;
		
				elsif counter_1 = delay1us and flag_37='1' then
						counter_40 <= 0;
						counter_37 <= 0;
						counter_1 <= 0;
						flag_37 <='0';
						nx_state <= CLEAR;	
				else null;

				end if;
		
		
	--edited part starts here			
		
			when CLEAR =>	--display clear command (inst_data=3)
		

		
				if counter_37 < delay37us and flag_37='0' then	
					enableLCD	<= '1';
					rsLCD		<= '0';
					rwLCD		<= '0';
					dataLCD		<= x"01";
					counter_37 <= counter_37 +1;
		
				elsif counter_37=delay37us  and flag_37='0' then
		
					enableLCD	<= '0';
					rsLCD		<= '0';
					rwLCD		<= '0';
					dataLCD		<= x"01";

					flag_37 <='1';
				else null;
				end if;
		
				if counter_1 < delay1us and flag_37='1' then
		
						enableLCD	<= '0';
						rsLCD		<= '0';
						rwLCD		<= '0';
						dataLCD		<= x"01";
						counter_1 <= counter_1 +1;
		
				elsif counter_1= delay1us and flag_37='1' then
						counter_40 <= 0;
						counter_37 <= 0;
						counter_1 <= 0;
						flag_37 <='0';
						nx_state <= ENTRY;	
				else null;
				end if;
		
		
					
			when ENTRY =>	--entry mode set command (inst_data=4)
		
				if counter_152< delay1_5ms   and flag_152='0' then
	
					enableLCD	<= '1';
					rsLCD		<= '0';
					rwLCD		<= '0';
					dataLCD		<= x"06";
					counter_152 <= counter_152 +1;
		
				elsif counter_152=delay1_5ms and flag_152='0' then
		
					enableLCD	<= '0';
					rsLCD		<= '0';
					rwLCD		<= '0';
					dataLCD		<= x"06";
				
				flag_152 <='1';
				
				else null;
				end if;
		
				if counter_1< delay1us and flag_152='1' then
		
						enableLCD	<= '0';
						rsLCD		<= '0';
						rwLCD		<= '0';
						dataLCD		<= x"06";
						counter_1 <= counter_1 +1;
		
				elsif counter_1 = delay1us and flag_152='1' then	
						counter_40 <= 0;
						counter_37 <= 0;
						counter_1 <= 0;
						counter_152 <=0;
						flag_152 <= '0';
						nx_state <= INITDONE;
				else null;
		
				end if;	--if counter_1

			when INITDONE =>
						init_flag <= '1';
						nx_state
		-----------------------------------------------------------------------
		---------------------- INITIALISATION DONE!!!!!!-----------------------			

			when "0101" =>	--gp data for lcd (inst_data=5)
	
				busy <= '1';
		
				if counter_37_x < delay37us and flag_37='0' then
		
					enableLCD	<= '1';
					rsLCD		<= '1';
					rwLCD		<= '0';
					dataLCD		<= data_buf;	--edited from <= x"41";
					counter_37_x <= counter_37_x +1;
		
				elsif counter_37_x=delay37us and flag_37='0' then
		
					enableLCD	<= '0';
					rsLCD		<= '1';
					rwLCD		<= '0';
					dataLCD		<= data_buf;	--edited from <= x"41";

					flag_37 <='1';

				else null;
				end if;
		
					if counter_1_x < delay1us and flag_37 = '1' then
		
						enableLCD	<= '0';
						rsLCD		<= '1';
						rwLCD		<= '0';
						dataLCD	<= data_buf;	--edited from <= x"41";
						counter_1_x <= counter_1_x +1;
		
					elsif counter_1_x = delay1us and flag_37 = '1' then
		
						busy <= '0';			--clear flag
--						counter_40 <= 0;
						counter_37_x <= 0;
--						counter_1 <= 0;
--						counter_152 <=0;

					flag_37 <= '0';
		
					else null;
					end if;
		


	--edited part ends here
					
			when others	    =>
		
				null;

			end case;

		end if;
	end if;
	
	end process update;


	--edited part ends here


--	enableLCD	<= lcd_reg(10);
--	rsLCD		<= lcd_reg(9);
--	rwLCD		<= lcd_reg(8);
--	dataLCD		<= lcd_reg(7 downto 0) when lcd_reg(8) = '0' else "ZZZZZZZZ";

END ARCHITECTURE;
