----------------------------------------------------------------------------------
-- TU Kaiserslautern
-- Student: Trung C. Nguyen
-- 
-- Module Name:    	switches - Behavioral 
-- Project Name: 		Warm-up assignment 2
-- Target Devices: 	Digilen 
-- Tool versions: 	Xilinx ISE 14.7
-- Description: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.lt16x32_global.all;
use work.wishbone.all;
use work.config.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

entity wb_switch is
	 Generic(
				memaddr		:	generic_addr_type; --:= CFG_BADR_SW;
				addrmask		:	generic_mask_type --:= CFG_MADR_SW;
	 );
    Port ( 	clk 			: 	in  STD_LOGIC;
				rst 			: 	in  STD_LOGIC;
				sw 			: 	in  STD_LOGIC_VECTOR (7 downto 0);
				btn 			: 	in  STD_LOGIC_VECTOR (6 downto 0);
				wslvi			:	in		wb_slv_in_type;
				wslvo			:	out	wb_slv_out_type);
end wb_switch;

architecture Behavioral of wb_switch is
	signal ack				: std_logic;
	signal data_buffer	: std_logic_vector(31 downto 0);
begin

	process(clk)
	--variable data_buffer	: std_logic_vector(31 downto 0);
	variable sw_buffer 	: std_logic_vector(7 downto 0);
	variable btn_buffer 	: std_logic_vector(7 downto 0);
	begin
		if clk'event and clk='1' then
			if rst = '1' then
				ack				<= 	'0';
				btn_buffer		:= 	(others => '0');
				sw_buffer		:= 	(others => '0');
				data_buffer		<=   	(others => '-');
			else
				if wslvi.stb = '1' and wslvi.cyc = '1' then
					if wslvi.we='0' then
						btn_buffer		:=		'0' & btn;
						sw_buffer		:=		sw;
							
							-- Register point of view (LSB is LSB and MSB is MSB)
						data_buffer		<=   	x"0000" & btn_buffer & sw_buffer;
						ack				<= 	'1';
					end if;
				else
					ack 					<= 	'0';
					data_buffer 		<=   	(others=>'-');
				end if;
			end if;
		end if;
	end process;
	
	-- Before sending to memory or putting on Wishbone bus need to rearrange as Big Endian Format
	-- 1st way
		-- FOR BOTH SW and BTN, access size = 1 byte => in software using load 8 bit is possible
		--     enc_wb_dat (byte addr,ACCESS_SIZE,DATA_IN_REG)
		-- sw is the LSB => its address in register = "00"
		-- (don't care about big or little now).  
		-- then putting it in encode funct, the funct will auto
		-- rearrange it to the highest address before sending
		--wslvo.dat<= enc_wb_dat("00","00",data_buffer) 
		--		OR enc_wb_dat("01","00",data_buffer);
		-- btn is the second LSB => its address = "01".
		-- after encoding, it is arranged to the second highest 
		-- address before sending
		
		-- That means before sending data will be arranged in form of
		--      SW & BTN & x"0000"
		
	-- 2nd way
		-- Now if the access size = 2 bytes => ACCESS_SIZE = "01"
		-- Byte address is "00" or "01" since btn and sw are LSB
		--     enc_wb_dat (byte addr,ACCESS_SIZE,DATA_IN_REG)
	wslvo.dat	<= enc_wb_dat("00","01",data_buffer); 
			
		-- That means before sending data will be arranged in form of
		--      BTN & SW & x"0000"
		-- Look at the difference btw 2 ways => Conclusion in onenote
	wslvo.ack					<= 	ack;
	wslvo.wbcfg					<= 	wb_membar(memaddr, addrmask);

end Behavioral;

