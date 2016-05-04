---- See the file "LICENSE" for the full license governing this code. --
--
--LIBRARY ieee;
--USE ieee.std_logic_1164.all;
--USE ieee.numeric_std.all;
--USE work.lt16x32_global.all;
--USE work.wishbone.all;
--USE work.config.all;
--
--ENTITY wb_lcd IS
--	generic(
--		memaddr		: generic_addr_type;
--		addrmask	: generic_mask_type
--	);
--	port(
--		clk			: IN std_logic;
--		rst			: IN std_logic;
--
--		dataLCD		: INOUT std_logic_vector(7 downto 0);
--		enableLCD	: OUT std_logic;
--		rsLCD		: OUT std_logic;
--		rwLCD		: OUT std_logic;
--
--		wslvi		: IN wb_slv_in_type;
--		wslvo		: OUT wb_slv_out_type
--	);
--END ENTITY;
--
--ARCHITECTURE behav OF wb_lcd IS
--
--
--
--		--CONSTANT DECLARATION --
--	constant delay40ms		: integer :=4000000;	--from 4_000_000
--	constant delay37us		: integer:=4000;		--from 4000
--	constant delay1us		: integer:=100000;		--from 100
--	constant delay1_5ms 		: integer:=152000;	--from 152000
--
--
--	signal lcd_reg		: std_logic_vector(10 downto 0);
--	signal ack			: std_logic;
--	signal inst_data	: std_logic_vector(3 downto 0);
--	signal data_buf	: std_logic_vector (7 downto 0); 
--	signal busy			: std_logic;
----	signal clear_inst_data		: std_logic:
--
----COUNTERS
--	signal counter_40		: integer:=0;
--	signal counter_37		: integer:=0;
--	signal counter_1		: integer:=0;
--	signal counter_152	: integer:=0;
--	
----edited part
--	signal init_done 		: std_logic;
--
--
--BEGIN
--
--	process(clk)
--	begin
--		if clk'event and clk='1' then
--			if rst = '1' then
--				ack			<= '0';
--				lcd_reg		<= (others => '0');
--				data_buf <= x"00";
--				inst_data <= "0000";
--			else
--				if wslvi.stb = '1' and wslvi.cyc = '1' then
--
--					if wslvi.we = '0' then
--						
--						if busy='0' and init_done ='1' then	--edited part
--							lcd_reg	<= "00000000000";			--edited part
--						else 
--							lcd_reg	<= "11111111111";			--edited part
--						end if;
--						
--					end if;
--
--					if wslvi.we = '1' then		--edited part
--						lcd_reg	<= dec_wb_dat(wslvi.sel,wslvi.dat)(10 downto 0);
--						
--						if lcd_reg(10) ='1' and lcd_reg(9) ='1' and lcd_reg(8) ='1' then
--
--							inst_data <= lcd_reg (3 downto 0);		--commands
--
--						else					
--
--							inst_data <= "0101"; 				--gp data
--							data_buf <=lcd_reg (7 downto 0);
--
--						end if;
--						
--					end if;
--
--
--
--					if ack = '0' then
--						ack		<= '1';
--					else
--						ack		<= '0';
--					end if;
--				else
--					ack			<= '0';
--				end if;
--			end if;
--		end if;
--	end process;
--
--	wslvo.dat(10 downto 0)	<= lcd_reg when wslvi.adr(2) = '0'
--		else "000" & dataLCD when wslvi.adr(2) = '1' and lcd_reg(8) = '1'
--		else (others => '0');
--
--	wslvo.dat(31 downto 11)	<= (others=>'0');
--	wslvo.wbcfg				<= wb_membar(memaddr, addrmask);
--	wslvo.ack				<= ack;
--
--		--edited part
--
--update:	process(clk, inst_data)
--
--	begin
--
--	if clk'event and clk='1' then
--
--		if rst = '1' then
--			busy <= '0';
--		elsif init_done = '1' then
--
--			case inst_data is
--
--			when "0010" =>		--on off command (inst_data=2)
--		
--				busy <= '1';
--		
--				if counter_37 < delay37us then
--		
--					enableLCD	<= '1';
--					rsLCD		<= '0';
--					rwLCD		<= '0';
--					dataLCD		<= x"0F";
--					counter_37 <= counter_37 +1;
--		
--				elsif counter_37=delay37us then
--		
--					enableLCD	<= '0';
--					rsLCD		<= '0';
--					rwLCD		<= '0';
--					dataLCD		<= x"0F";
--		
--					if counter_1 < delay1us then
--		
--						enableLCD	<= '0';
--						rsLCD		<= '0';
--						rwLCD		<= '0';
--						dataLCD		<= x"0F";
--						counter_1 <= counter_1 +1;
--		
--					elsif counter_1 = delay1us then
--		
--						busy <= '0';			--clear flag
--						counter_40 <= 0;
--						counter_37 <= 0;
--						counter_1 <= 0;
--		
--					else null;
--		
--					end if;	--if counter_1
--		
--				else null;
--				
--				end if;	--if counter_37 <		
--		
--	--edited part starts here			
--		
--			when "0011" =>	--display clear command (inst_data=3)
--		
--				busy <= '1';
--		
--				if counter_37 < delay37us then
--		
--					enableLCD	<= '1';
--					rsLCD		<= '0';
--					rwLCD		<= '0';
--					dataLCD		<= x"01";
--					counter_37 <= counter_37 +1;
--		
--				elsif counter_37=delay37us then
--		
--					enableLCD	<= '0';
--					rsLCD		<= '0';
--					rwLCD		<= '0';
--					dataLCD		<= x"01";
--		
--					if counter_1 < delay1us then
--		
--						enableLCD	<= '0';
--						rsLCD		<= '0';
--						rwLCD		<= '0';
--						dataLCD		<= x"01";
--						counter_1 <= counter_1 +1;
--		
--					elsif counter_1 = delay1us then
--		
--						busy <= '0';			--clear flag
--						counter_40 <= 0;
--						counter_37 <= 0;
--						counter_1 <= 0;
--		
--					else null;
--		
--					end if;	--if counter_1
--		
--				else null;
--				
--				end if;	--if counter_37 <		
--		
--					
--			when "0100" =>	--entry mode set command (inst_data=4)
--
--		
--				busy <= '1';
--		
--				if counter_152< delay1_5ms then
--		
--					enableLCD	<= '1';
--					rsLCD		<= '0';
--					rwLCD		<= '0';
--					dataLCD		<= x"06";
--					counter_152 <= counter_152 +1;
--		
--				elsif counter_152=delay1_5ms then
--		
--					enableLCD	<= '0';
--					rsLCD		<= '0';
--					rwLCD		<= '0';
--					dataLCD		<= x"06";
--		
--					if counter_1 < delay1us then
--		
--						enableLCD	<= '0';
--						rsLCD		<= '0';
--						rwLCD		<= '0';
--						dataLCD		<= x"06";
--						counter_1 <= counter_1 +1;
--		
--					elsif counter_1 = delay1us then
--		
--						busy <= '0';			--clear flag
--						counter_40 <= 0;
--						counter_37 <= 0;
--						counter_1 <= 0;
--						counter_152 <=0;
--
--		
--					else null;
--		
--					end if;	--if counter_1
--		
--				else null;
--				
--				end if;	--if counter_37 <		
--		
--					
--
--			when "0101" =>	--gp data for lcd (inst_data=5)
--	
--				busy <= '1';
--		
--				if counter_37 < delay37us then
--		
--					enableLCD	<= '1';
--					rsLCD		<= '1';
--					rwLCD		<= '0';
--					dataLCD		<= data_buf;	--edited from <= x"41";
--					counter_37 <= counter_37 +1;
--		
--				elsif counter_37=delay37us then
--		
--					enableLCD	<= '0';
--					rsLCD		<= '1';
--					rwLCD		<= '0';
--					dataLCD		<= data_buf;	--edited from <= x"41";
--		
--					if counter_1 < delay1us then
--		
--						enableLCD	<= '0';
--						rsLCD		<= '1';
--						rwLCD		<= '0';
--						dataLCD	<= data_buf;	--edited from <= x"41";
--						counter_1 <= counter_1 +1;
--		
--					elsif counter_1 = delay1us then
--		
--						busy <= '0';			--clear flag
--						counter_40 <= 0;
--						counter_37 <= 0;
--						counter_1 <= 0;
--						counter_152 <=0;
--		
--					else null;
--		
--					end if;	--if counter_1
--		
--				else null;
--				
--				end if;	--if counter_37 <		
--
--
--	--edited part ends here
--					
--			when others	    =>
--		
--				null;
--
--			end case;
----------------edited new----------------
--		elsif init_done ='0' then
--						busy <='1';
--			
--				if counter_40 < delay40ms then
--			
--					enableLCD	<= '1';
--					rsLCD		<= '0';
--					rwLCD		<= '0';
--					dataLCD		<= x"38";
--					counter_40 <= counter_40+1;	
--			
--				elsif counter_40 = delay40ms then
--			
--					enableLCD	<= '1';
--					rsLCD		<= '0';
--					rwLCD		<= '0';
--					dataLCD		<= x"38";
--					
--					if counter_37 < delay37us then
--			
--						enableLCD	<= '1';
--						rsLCD		<= '0';
--						rwLCD		<= '0';
--						dataLCD		<= x"38";
--						counter_37 <= counter_37 +1;
--			
--					elsif counter_37=delay37us then
--			
--						enableLCD	<= '0';
--						rsLCD		<= '0';
--						rwLCD		<= '0';
--						dataLCD		<= x"38";
--			
--						if counter_1 < delay1us then
--			
--							enableLCD	<= '0';
--							rsLCD		<= '0';
--							rwLCD		<= '0';
--							dataLCD		<= x"38";
--							counter_1 <= counter_1 +1;
--			
--						elsif counter_1 = delay1us then
--			
--							busy <= '0';			--clear flag
--							counter_40 <= 0;
--							counter_37 <= 0;
--							counter_1 <= 0;
--							init_done <='1';		--make init_1=1;
--			
--						else null;
--			
--						end if;	--if counter_1
--			
--					else null;
--					
--					end if;	--if counter_37 <		
--			
--				else null;
--			
--				end if;	--	if counter_40
--		
--		
--		else null;
----------------edited new ends here---------------------
--		end if;
--	end if;
--	
--	end process update;
--
--
--
--
--	--edited part ends here
--
--
----	enableLCD	<= lcd_reg(10);
----	rsLCD		<= lcd_reg(9);
----	rwLCD		<= lcd_reg(8);
----	dataLCD		<= lcd_reg(7 downto 0) when lcd_reg(8) = '0' else "ZZZZZZZZ";
--
--END ARCHITECTURE;




---------------------------------------------------------------------------------new*4 code
-- See the file "LICENSE" for the full license governing this code. --

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.lt16x32_global.all;
USE work.wishbone.all;
USE work.config.all;
use work.lt16soc_peripherals.all;

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

	signal lcd_reg		: std_logic_vector(10 downto 0);
	signal ack			: std_logic;
	signal inst_data	: std_logic_vector(3 downto 0);
	signal data_buf	: std_logic_vector (7 downto 0); 
	signal busy			: std_logic;

	
--edited part
	signal init_done 		: std_logic;
	signal new_data 		: std_logic;

--internal signals for counter
		--CONSTANT DECLARATION --
	constant delay40ms		: integer :=4000000;	--from 4000000
	constant delay37us		: integer:=4000;		--from 4000
	constant delay1us		: integer:=100000;		--from 100000
	constant delay1_5ms 		: integer:=152000;	--from 152000


	signal counter_done	:  std_logic;
	signal counter_start	: 	std_logic;

	signal counter_top	: integer:=0;
	signal count			: integer:=0;



--state machine signals
 type state_set is (start, funct_40m, funct_40m_done,funct_37u,funct_37u_done,funct_1u,
							onoff_prep,onoff_37u,onoff_37u_done,onoff_1u,
							instdata_prep,instdata_37u,instdata_37u_done,instdata_1u,
							mset_prep,mset_15m,mset_15m_done,mset_1u,
							char1_prep,char1_37u,char1_37u_done,char1_1u,
							char2_prep,char2_37u,char2_37u_done,char2_1u,
							char3_prep,char3_37u,char3_37u_done,char3_1u,
							ending);
							
	signal state, current_state : state_set;

BEGIN



	process(clk)
	begin
		if clk'event and clk='1' then
			if rst = '1' then
				ack			<= '0';
				lcd_reg		<= (others => '0');
				data_buf <= x"00";
				inst_data <= "0000";
				new_data <='0';
				state <= start; 
			else
			
				state <= current_state;
					if state=ending then
						new_data <='0';
					end if;

				if wslvi.stb = '1' and wslvi.cyc = '1' then
				
					if wslvi.we = '0' then
						if busy='0' and init_done='1' then	--edited part		--careful with this please.....
							lcd_reg	<= "00000000000";			--edited part
						else 
							lcd_reg	<= "11111111111";			--edited part
						end if;
					end if;
					
					if wslvi.we = '1' then		--edited part
						lcd_reg	<= dec_wb_dat(wslvi.sel,wslvi.dat)(10 downto 0);
						data_buf <= lcd_reg (7 downto 0);
						new_data <='1';
					end if;
					
					if ack = '0' then
						ack		<= '1';
					else
						ack		<= '0';
					end if;
				else	--				if wslvi.stb = '1' and wslvi.cyc = '1' then
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

	counter:	process(clk)
	begin
	if clk'event and clk='1' then
		if counter_start='0' then
			count <=0;
			counter_done <='0';
		else 
			count <= count +1;
			if count =counter_top then
				counter_done <= '1';
			end if;		
		end if;
	end if;
	end process counter;


combinatorial:	process(clk)

	variable data_buf_1	: std_logic_vector (7 downto 0); 
	variable data_buf_2	: std_logic_vector (7 downto 0);
	variable data_buf_3	: std_logic_vector (7 downto 0);
	
	begin


if clk'event and clk='1' then	
	case current_state is
	
			when start =>		
			
				init_done <='0';
				enableLCD	<= '1';
				rsLCD		<= '0';
				rwLCD		<= '0';
				dataLCD		<= x"38";
				counter_top <=delay40ms;
				counter_start <='1';
				current_state <= funct_40m;
	
			when funct_40m =>
				
				if counter_done = '1' then
					counter_start <='0';
					counter_top <=0;
					current_state <= funct_40m_done;
				else
					current_state <= funct_40m;
				end if;
			
			when funct_40m_done =>

				counter_top <=delay37us;
				counter_start <='1';
				current_state <= funct_37u;
			
			when funct_37u =>
				
				if counter_done = '1' then
					counter_start <='0';
					counter_top <=0;
					current_state <= funct_37u_done;
				else
					current_state <= funct_37u;
				end if;	
			
			when funct_37u_done =>

				enableLCD	<= '0';
				counter_top <=delay1us;
				counter_start <='1';
				current_state <= funct_1u;
				
			when funct_1u =>

				if counter_done = '1' then
					counter_start <='0';
					counter_top <=0;
					current_state <= onoff_prep;
				else
					current_state <= funct_1u;
				end if;

			when onoff_prep =>
	
				enableLCD	<= '1';
				rsLCD		<= '0';
				rwLCD		<= '0';
				dataLCD		<= x"0F";
				counter_top <=delay37us;
				counter_start <='1';
				current_state <= onoff_37u;

			when onoff_37u =>

				if counter_done = '1' then
					counter_start <='0';
					counter_top <=0;
					current_state <= onoff_37u_done;
				else
					current_state <= onoff_37u;
				end if;

			when onoff_37u_done =>

				enableLCD	<= '0';
				counter_top <=delay1us;
				counter_start <='1';
				current_state <= onoff_1u;

			when onoff_1u =>

				if counter_done = '1' then
					counter_start <='0';
					counter_top <=0;
					current_state <= instdata_prep ;
				else
					current_state <= onoff_1u;
				end if;
			
			when instdata_prep =>
			
			init_done <='1';		--for first init...
			if new_data='1' then		--edited part
				busy <= '1';
				enableLCD	<= '1';
				rsLCD		<= '0';
				rwLCD		<= '0';
				dataLCD		<= x"01";							
				counter_top <=delay37us;
				counter_start <='1';
				current_state <= instdata_37u;
			else
				current_state <= instdata_prep;		
			end if;

			when instdata_37u =>

				if counter_done = '1' then
					counter_start <='0';
					counter_top <=0;
					current_state <= instdata_37u_done;
				else
					current_state <= instdata_37u;
				end if;

			when instdata_37u_done =>

				enableLCD	<= '0';
				counter_top <=delay1us;
				counter_start <='1';
				current_state <= instdata_1u;

			when instdata_1u =>

				if counter_done = '1' then
					counter_start <='0';
					counter_top <=0;
					current_state <= mset_prep ;
				else
					current_state <= instdata_1u;
				end if;

			when mset_prep =>
			
				enableLCD	<= '1';
				rsLCD		<= '0';
				rwLCD		<= '0';
				dataLCD		<= x"06";
				counter_top <=delay1_5ms;
				counter_start <='1';
				current_state <= mset_15m;

			when mset_15m =>

				if counter_done = '1' then
					counter_start <='0';
					counter_top <=0;
					current_state <=  mset_15m_done;
				else
					current_state <=  mset_15m ;
				end if;
			
			when mset_15m_done =>
			
				enableLCD	<= '0';
				counter_top <=delay1us;
				counter_start <='1';
				current_state <= mset_1u;

			when mset_1u =>

				if counter_done = '1' then
					counter_start <='0';
					counter_top <=0;
					current_state <= char1_prep ;		--edited
				else
					current_state <= mset_1u;
				end if;

			when char1_prep =>
	
				enableLCD	<= '1';
				rsLCD		<= '1';
				rwLCD		<= '0';
-------------------------
				case data_buf is
				 when x"28" =>	data_buf_1:=x"43";data_buf_2:=x"34";data_buf_3:=x"20";	--40
 				 when x"29" =>	data_buf_1:=x"43";data_buf_2:=x"23";data_buf_3:=x"34";	--41
 				 when x"2A" =>	data_buf_1:=x"44";data_buf_2:=x"34";data_buf_3:=x"20";	--42
 				 when x"2B" =>	data_buf_1:=x"44";data_buf_2:=x"23";data_buf_3:=x"34";	--43
 				 when x"2C" =>	data_buf_1:=x"45";data_buf_2:=x"34";data_buf_3:=x"20";	--44
				 when x"2D" =>	data_buf_1:=x"46";data_buf_2:=x"34";data_buf_3:=x"20";	--45
				 when x"2E" =>	data_buf_1:=x"46";data_buf_2:=x"23";data_buf_3:=x"34";	--46
				 when x"2F" =>	data_buf_1:=x"47";data_buf_2:=x"34";data_buf_3:=x"20";	--47				
 				 when x"30" =>	data_buf_1:=x"47";data_buf_2:=x"23";data_buf_3:=x"34";	--48
 				 when x"31" =>	data_buf_1:=x"41";data_buf_2:=x"34";data_buf_3:=x"20";	--49
				 when x"32" =>	data_buf_1:=x"41";data_buf_2:=x"23";data_buf_3:=x"34";	--50
				 when x"33" =>	data_buf_1:=x"42";data_buf_2:=x"34";data_buf_3:=x"20";	--51
				 when x"34" =>	data_buf_1:=x"43";data_buf_2:=x"35";data_buf_3:=x"20";	--52
 				 when x"35" =>	data_buf_1:=x"43";data_buf_2:=x"23";data_buf_3:=x"35";	--53
 				 when x"36" =>	data_buf_1:=x"44";data_buf_2:=x"35";data_buf_3:=x"20";	--54
				 when x"37" =>	data_buf_1:=x"44";data_buf_2:=x"23";data_buf_3:=x"35";	--55
				 when others => data_buf_1:=x"49";data_buf_2:=x"49";data_buf_3:=x"49";	
				end case;
---------------------------				
				dataLCD		<= data_buf_1;	--edited from <= x"41";				counter_top <=delay37us;
				counter_top <=delay37us;
				counter_start <='1';
				current_state <= char1_37u;

			when char1_37u =>

				if counter_done = '1' then
					counter_start <='0';
					counter_top <=0;
					current_state <= char1_37u_done;
				else
					current_state <= char1_37u;
				end if;

			when char1_37u_done =>

				enableLCD	<= '0';
				counter_top <=delay1us;
				counter_start <='1';
				current_state <= char1_1u;

			when char1_1u =>

				if counter_done = '1' then
					counter_start <='0';
					counter_top <=0;
					current_state <= char2_prep;		--edited
				else
					current_state <= char1_1u;
				end if;

			when char2_prep =>
	
				enableLCD	<= '1';
				rsLCD		<= '1';
				rwLCD		<= '0';
				dataLCD		<= data_buf_2;	--edited from <= x"41";				counter_top <=delay37us;
				counter_top <=delay37us;
				counter_start <='1';
				current_state <= char2_37u;

			when char2_37u =>

				if counter_done = '1' then
					counter_start <='0';
					counter_top <=0;
					current_state <= char2_37u_done;
				else
					current_state <= char2_37u;
				end if;

			when char2_37u_done =>

				enableLCD	<= '0';
				counter_top <=delay1us;
				counter_start <='1';
				current_state <= char2_1u;

			when char2_1u =>

				if counter_done = '1' then
					counter_start <='0';
					counter_top <=0;
					current_state <= char3_prep;		--edited
				else
					current_state <= char2_1u;
				end if;

			when char3_prep =>
	
				enableLCD	<= '1';
				rsLCD		<= '1';
				rwLCD		<= '0';		
				dataLCD		<= data_buf_3;	--edited from <= x"41";				counter_top <=delay37us;
				counter_top <=delay37us;
				counter_start <='1';
				current_state <= char3_37u;

			when char3_37u =>

				if counter_done = '1' then
					counter_start <='0';
					counter_top <=0;
					current_state <= char3_37u_done;
				else
					current_state <= char3_37u;
				end if;

			when char3_37u_done =>

				enableLCD	<= '0';
				counter_top <=delay1us;
				counter_start <='1';
				current_state <= char3_1u;

			when char3_1u =>

				if counter_done = '1' then
					counter_start <='0';
					counter_top <=0;
					current_state <= ending;		--edited
				else
					current_state <= char3_1u;
				end if;

			when ending =>

				if new_data = '1' then
					current_state <= ending;
				else 
					busy <='0';
					current_state <= instdata_prep;		--start
				end if;
				
			when others	    =>
		
				null;

			end case;
end if;
	end process combinatorial;

END ARCHITECTURE;






