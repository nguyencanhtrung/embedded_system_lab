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
		rst 	: in 	std_logic;
		clk 	: in	std_logic;
		sw	: in	std_logic_vector(7 downto 0);
		btn	: in	std_logic_vector(6 downto 0);
		wslvi	: in	wb_slv_in_type;
		wslvo	: out	wb_slv_out_type
		);
END wb_switches;

ARCHITECTURE behavior of wb_switches is
-- signal declaration
signal data_buffer 	: 	std_logic_vector(31 downto 0);
signal sw_buffer	:	std_logic_vector(7 downto 0);
signal btn_buffer	:	std_logic_vector(7 downto 0);
signal msb_16bits	: 	std_logic_vector(15 downto 0);
signal ack			: 	std_logic;
signal flag			: 	std_logic;
-- main program
begin
	--sw_buffer <= sw;
	--btn_buffer <= '0' & btn;
	--msb_16bits <= (OTHERS => '0');
	process(clk)
	begin


	sw_buffer <= sw;
	btn_buffer <= '0' & btn;
	msb_16bits <= (OTHERS => '0');


		if clk'event and clk='1' then
			if rst = '1' then
				ack		<= '0';
				data_buffer	<= x"00000000";
				flag <= '0';
			else
				if wslvi.stb = '1' and wslvi.cyc = '1' then
					if (ack = '0' and flag = '1') then
						ack	<= '1';
						flag <= '0';
					else
						ack	<= '0';
						flag <= '0';
					end if;
					
					if wslvi.we='0' then
						data_buffer	<=   sw_buffer & btn_buffer  & msb_16bits;
						flag <= '1';
					
					end if;
				else
					ack <= '0';
					flag <= '0';
					data_buffer <= (OTHERS => '0');
					
				end if;
			end if;
		end if;
	end process;

	wslvo.dat(31 downto 0)	<= data_buffer;
	wslvo.ack	<= ack;
	wslvo.wbcfg	<= wb_membar(memaddr, addrmask);

END ARCHITECTURE;