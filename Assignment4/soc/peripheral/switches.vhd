LIBRARY ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
--	use work.lt16x32_global.all;
	use work.wishbone.all;
	use work.config.all;
	
ENTITY wb_switches is
	generic(
		memaddr		:	generic_addr_type := CFG_BADR_FOO;
		addrmask	:	generic_mask_type := CFG_MADR_FOO
		);
	port(
		rst 		: in 	std_logic;
		clk 		: in	std_logic;
		sw			: in	std_logic_vector(7 downto 0);
		btn			: in	std_logic_vector(6 downto 0);
		wslvi		: in	wb_slv_in_type;
		wslvo		: out	wb_slv_out_type;
		irq_line	: out 	std_logic					-- interrupt line for sw_btn
		);
END wb_switches;

ARCHITECTURE behavior of wb_switches is
-- signal declaration
signal data_buffer 	: 	std_logic_vector(31 downto 0);
--signal sw_buffer	:	std_logic_vector(7 downto 0);
signal btn_buffer	:	std_logic_vector(6 downto 0);
signal msb_16bits	: 	std_logic_vector(15 downto 0);
signal ack			: 	std_logic;
signal flag			: 	std_logic;
signal irq_command	:	std_logic_vector(15 downto 0);

-- MASK for interrupt lines
signal irq_mask		:	std_logic_vector(15 downto 0) := x"0008"; --x"00080000"

type state is (check, waiting);
signal pr_state: state;

-- Observation for tb
signal counter_buff : 	integer range 0 to 100_000_000;

-- main program
begin
	
process(clk)
	variable counter: 	integer range 0 to 100_000_000;
	variable irq_command_var	:	std_logic_vector(15 downto 0);-- := x"0008"; --x"00080000"; -- edited
	
	begin
		if clk'event and clk='1' then
			if rst = '1' then
				ack		<= '0';
				flag <= '0';				-- Enable 1 wait state for single READ
			--  Reset INTERMIDIATE SIGNALs
				--sw_buffer <= "00000000";
				btn_buffer <= "0000000";
				irq_command <= x"0008"; --x"00080000";
				counter := 0;
			-- 	Reset OUTPUTS	
				data_buffer	<= x"00000000";	-- data output for READ REQUEST from mst
				irq_line <= '0';			-- IRQ request
				pr_state <= check;
				
			else
				-- detect any change of switches or btn pressed or not (hàm ở dưới chỉ detect hành động ấn xuống)
			case pr_state is
			when check =>
				if irq_command = x"0008" and ((btn xor btn_buffer) and btn) /= b"0000000" then  -- improve by avoiding glitches 
												-- enable interrupt by software
												--  problem for button: we press btn longer than 1 clock cycle
						irq_line <= '1';		-- change in sw state detected					
						pr_state <= waiting;	-- interrupt line is asserted more than 1 clock cycle
				else
						irq_line <= '0';		-- sw state unchange or disable interrupt by software
						pr_state <= check;
				end if;
			when waiting =>
				if(counter < 60_000_000) then	-- wait for 600 ms
					pr_state <= waiting;
					counter := counter + 1;
					irq_line <= '0';
				else 
					counter := 0;
					pr_state <= check;
				end if;
			end case;
				
				
			-- interrupt lines have to be asserted for 1 clock cycle
			-- assert 1 wait state
				if wslvi.stb = '1' and wslvi.cyc = '1' then
					if (ack = '0' and flag = '1') then
						ack	<= '1';
						flag <= '0';
					else
						ack	<= '0';
						flag <= '0';
					end if;
					
					if wslvi.we='0' then	-- master want to read from slave
						data_buffer	<=    sw & '0' &  btn & msb_16bits;
						flag <= '1';
					elsif wslvi.we='1' then	-- enable and disable interrupt by software
						irq_command_var := dec_wb_dat(wslvi.sel,wslvi.dat) (15 downto 0); 	-- neu su dung truc tiep irq_command o day, khi chay chuong trinh assembly no bi stuck o cau lenh write to SW_BTN
						irq_command <= irq_command_var and irq_mask;				-- x"0008": enable; x"0000": disable
					else null;
					end if;
				else
					ack <= '0';
					flag <= '0';
					data_buffer <= (OTHERS => '0');
				end if;

--			sw_buffer <= sw;
			btn_buffer <= btn;
			msb_16bits <= (OTHERS => '0');
			counter_buff <= counter;
		end if;
	end if;	
end process;

	wslvo.dat(31 downto 0)	<= data_buffer;
	wslvo.ack	<= ack;
	wslvo.wbcfg	<= wb_membar(memaddr, addrmask);
END ARCHITECTURE;