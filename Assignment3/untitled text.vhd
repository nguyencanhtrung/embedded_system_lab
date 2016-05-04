-- See the file "LICENSE" for the full license governing this code. --

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.lt16x32_global.all;
USE work.wishbone.all;
USE work.config.all;

ENTITY wb_lcd IS
    generic(
        memaddr        : generic_addr_type;
        addrmask    : generic_mask_type
    );
    port(
        clk            : IN std_logic;
        rst            : IN std_logic;

        dataLCD        : INOUT std_logic_vector(7 downto 0);
        enableLCD    : OUT std_logic;
        rsLCD        : OUT std_logic;
        rwLCD        : OUT std_logic;

        wslvi        : IN wb_slv_in_type;
        wslvo        : OUT wb_slv_out_type
    );
END ENTITY;

ARCHITECTURE behav OF wb_lcd IS

    signal lcd_reg    : std_logic_vector(10 downto 0);
    signal ack        : std_logic;

--edited part
constant delay_1    : integer:=400000;    --40ms 4000000
constant delay_2    : integer:=370;    --37us 3700
constant delay_3    : integer:=370;    --37us 3700
constant delay_4    : integer:=15200;    --1.52ms 152000
constant delay_5    : integer:=370;    --37us 3700
constant delay_en_low    : integer:=7;    --general delay between data and fall of en (min 1200-500 ns)....71
constant delay_en_high    : integer:=5;    --general delay between data and fall of en (min 500 ns).... 51

signal counter_init :    integer:=0;
signal counter_en_high: integer:=0;
signal counter_en_low: integer:=0;

--flags

signal delay_1_done : std_logic;
signal delay_2_done : std_logic;
signal delay_3_done : std_logic;
signal delay_4_done : std_logic;
signal delay_5_done : std_logic;
signal en_high_done         : std_logic;



signal init_done    : std_logic;
--signal en        : std_logic;
--signal rw        : std_logic;
--signal rs        : std_logic;
--signal data        : std_logic_vector(7 downto 0);

signal count_for_ack        : std_logic;    
    
--edited part

BEGIN

-- edited part  => create buffer and than write to final LCD phy ports!!!


    process(clk)
    begin
        if clk'event and clk='1' then
            if rst = '1' then
                ack            <= '0';
                lcd_reg        <= (others => '0');
                init_done    <='0';
            else

                if init_done = '1' then
                    if wslvi.stb = '1' and wslvi.cyc = '1' then
    
                        if wslvi.we = '1' then
                            lcd_reg    <= dec_wb_dat(wslvi.sel,wslvi.dat)(10 downto 0);
                        end if;
    
                        if ack = '0' then
                            ack        <= '1';
                        else
                            ack        <= '0';
                        end if;
                    else
                        ack            <= '0';
                    end if;

                else        --init_done!=1 case
                    --counter_buf <= counter_buf + 1;
                    
                    if counter_init = delay_1 then
                    
                        lcd_reg(8)     <= '0' ; -- rw
                        lcd_reg(9)    <= '0' ; -- rs
                        lcd_reg(7 downto 0) <= "00111000"; --0x38
                        lcd_reg(10)  <= '1';                --maybe we need a delay here i.e. set enable than data...
                        
                        if counter_en_high=delay_en_high then
                            lcd_reg(10)  <= '0';
                            en_high_done <='1';
                        else 
                            counter_en_high <= counter_en_high + 1;
                        end if;
                        
                        if en_high_done ='1' and counter_en_low=delay_en_low then
                            --set for next if
                            delay_1_done <='1';
                            --clear counters and flags
                            counter_init <= 0;
                            counter_en_low <=0;
                            counter_en_high <=0;
                            en_high_done <='0';
                        elsif en_high_done ='1' and counter_en_low<delay_en_low then
                            counter_en_low<= counter_en_low + 1;
                        else null;
                        end if;
                    else
                        counter_init <= counter_init + 1;
                    end if;
                    
                    if delay_1_done='1' and counter_init=delay_2 then
                        lcd_reg(8)     <= '0' ; -- rw
                        lcd_reg(9)    <= '0' ; -- rs
                        lcd_reg(7 downto 0) <= "00001110"; --0x0E
                        lcd_reg(10)  <= '1';
                        
                        if counter_en_high=delay_en_high then
                            lcd_reg(10)  <= '0';
                            en_high_done <='1';
                        else 
                            counter_en_high <= counter_en_high + 1;
                        end if;
                        
                        if en_high_done ='1' and counter_en_low=delay_en_low then
                            --set for next if
                            delay_2_done <='1';
                            --clear counters and flags
                            counter_init <= 0;
                            counter_en_low <=0;
                            counter_en_high <=0;
                            en_high_done <='0';
                        elsif en_high_done ='1' then
                            counter_en_low<= counter_en_low + 1;
                        else null;
                        end if;
            
                    elsif delay_1_done='1' then
                        counter_init <= counter_init + 1;
                    else null;    
                    end if;
                    
                    if delay_2_done='1' and counter_init=delay_3 then
                        lcd_reg(8)     <= '0' ; -- rw
                        lcd_reg(9)    <= '0' ; -- rs
                        lcd_reg(7 downto 0) <= "00000001"; --0x01
                        
                        lcd_reg(10)  <= '1';
                        
                        if counter_en_high=delay_en_high then
                            lcd_reg(10)  <= '0';
                            en_high_done <='1';
                        else 
                            counter_en_high <= counter_en_high + 1;
                        end if;
                        
                        if en_high_done ='1' and counter_en_low=delay_en_low then
                            --set for next if
                            delay_3_done <='1';
                            --clear counters and flags
                            counter_init <= 0;
                            counter_en_low <=0;
                            counter_en_high <=0;
                            en_high_done <='0';
                        else 
                            counter_en_low<= counter_en_low + 1;
                        end if;
                
            
                    else
                        counter_init <= counter_init + 1;
                    end if;
            
                    if delay_3_done='1' and counter_init=delay_4 then
                        lcd_reg(8)     <= '0' ; -- rw
                        lcd_reg(9)    <= '0' ; -- rs
                        lcd_reg(7 downto 0) <= "00000110"; --0x06
                        
                        lcd_reg(10)  <= '1';
                        
                        if counter_en_high=delay_en_high then
                            lcd_reg(10)  <= '0';
                            en_high_done <='1';
                        else 
                            counter_en_high <= counter_en_high + 1;
                        end if;
                        
                        if en_high_done ='1' and counter_en_low=delay_en_low then
                            --set for next if
                            delay_4_done <='1';
                            --clear counters and flags
                            counter_init <= 0;
                            counter_en_low <=0;
                            counter_en_high <=0;
                            en_high_done <='0';
                        else 
                            counter_en_low<= counter_en_low + 1;
                        end if;
            
            
                    else
                        counter_init <= counter_init + 1;
                    end if;
            
                    if delay_4_done='1' and counter_init=delay_5 then
                        lcd_reg(8)     <= '0' ; -- rw
                        lcd_reg(9)    <= '0' ; -- rs
                        lcd_reg(7 downto 0) <= "00000110"; --0x38
                        
                        lcd_reg(10)  <= '1';
                        
                        if counter_en_high=delay_en_high then
                            lcd_reg(10)  <= '0';
                            en_high_done <='1';
                        else 
                            counter_en_high <= counter_en_high + 1;
                        end if;
                        
                        if en_high_done ='1' and counter_en_low=delay_en_low then
                            --set for next if
                            delay_5_done <='1';
                            --clear counters and flags
                            counter_init <= 0;
                            counter_en_low <=0;
                            counter_en_high <=0;
                            en_high_done <='0';
                        else 
                            counter_en_low<= counter_en_low + 1;
                        end if;
            
                    else
                        counter_init <= counter_init + 1;
                    end if;
                    
                    if delay_1_done = '1' and delay_2_done = '1' and delay_3_done = '1' and delay_4_done = '1' and delay_5_done = '1' then
                        init_done<='1';
                    end if;

                end if;    --if init_done = '1
            end if;        --if rst = '1    
        end if;            --if clk'event
    end process;




    wslvo.dat(10 downto 0)    <= lcd_reg when wslvi.adr(2) = '0'
        else "000" & dataLCD when wslvi.adr(2) = '1' and lcd_reg(8) = '1'
        else (others => '0');

    wslvo.dat(31 downto 11)    <= (others=>'0');
    wslvo.wbcfg                <= wb_membar(memaddr, addrmask);
    wslvo.ack                <= ack;

    enableLCD    <= lcd_reg(10);
    rsLCD        <= lcd_reg(9);
    rwLCD        <= lcd_reg(8);
    dataLCD        <= lcd_reg(7 downto 0) when lcd_reg(8) = '0' else "ZZZZZZZZ";

END ARCHITECTURE;