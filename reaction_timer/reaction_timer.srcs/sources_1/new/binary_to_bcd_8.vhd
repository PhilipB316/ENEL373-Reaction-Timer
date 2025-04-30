----------------------------------------------------------------------------------
-- Engineers: Boston Black, Philip Brand, Michael Brown

-- Module Name: binary_to_bcd_8 - Behavioral 
-- Project Name: Reaction Timer

-- Description: 
-- Binary to BCD converter using the Double Dabble algorithm

-- Acknowledgements:
-- Majority of module code came from Invent Logics - All About FPGA
-- Adapted to support 5 BCD digits instead of 4
-- Written by Support Team
-- Can be found here: https://allaboutfpga.com/vhdl-code-for-binary-to-bcd-converter/
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity binary_to_bcd_8 is
    generic(N: positive := 28);
    Port ( CLK_IN : IN  std_logic;
           RESET_IN : IN  std_logic;
           BINARY_IN : IN  std_logic_vector(N-1 downto 0);
           BCD_8_DIGIT_OUT : OUT std_logic_vector (39 downto 0) := (others => '0'));
end binary_to_bcd_8 ;
 
architecture behaviour of binary_to_bcd_8 is
    type states is (start, shift, done);
    signal state, state_next: states;
    signal binary, binary_next: std_logic_vector(N-1 downto 0);
    signal bcds, bcds_reg, bcds_next: std_logic_vector(31 downto 0);
    -- output register keep output constant during conversion
    signal bcds_out_reg, bcds_out_reg_next: std_logic_vector(31 downto 0);
    -- need to keep track of shifts
    signal shift_counter, shift_counter_next: natural range 0 to N;
begin
    process(CLK_IN, RESET_IN)
    begin
        if RESET_IN = '1' then
            binary <= (others => '0');
            bcds <= (others => '0');
            state <= start;
            bcds_out_reg <= (others => '0');
            shift_counter <= 0;
        elsif falling_edge(CLK_IN) then
            binary <= binary_next;
            bcds <= bcds_next;
            state <= state_next;
            bcds_out_reg <= bcds_out_reg_next;
            shift_counter <= shift_counter_next;
        end if;
    end process;
 
    convert:
    process(state, binary, binary_in, bcds, bcds_reg, shift_counter)
    begin
        state_next <= state;
        bcds_next <= bcds;
        binary_next <= binary;
        shift_counter_next <= shift_counter;
 
        case state is
            when start =>
                state_next <= shift;
                binary_next <= binary_in;
                bcds_next <= (others => '0');
                shift_counter_next <= 0;
            when shift =>
                if shift_counter = N then
                    state_next <= done;
                else
                    binary_next <= binary(N-2 downto 0) & 'L';
                    bcds_next <= bcds_reg(30 downto 0) & binary(N-1);
                    shift_counter_next <= shift_counter + 1;
                end if;
            when done =>
                state_next <= start;
        end case;
    end process;
    
    bcds_reg(31 downto 28) <= bcds(31 downto 28) + 3 when bcds(31 downto 28) > 4 else
                              bcds(31 downto 28);
    bcds_reg(27 downto 24) <= bcds(27 downto 24) + 3 when bcds(27 downto 24) > 4 else
                              bcds(27 downto 24);
    bcds_reg(23 downto 20) <= bcds(23 downto 20) + 3 when bcds(23 downto 20) > 4 else
                              bcds(23 downto 20);
    bcds_reg(19 downto 16) <= bcds(19 downto 16) + 3 when bcds(19 downto 16) > 4 else
                              bcds(19 downto 16);
    bcds_reg(15 downto 12) <= bcds(15 downto 12) + 3 when bcds(15 downto 12) > 4 else
                              bcds(15 downto 12);
    bcds_reg(11 downto 8) <= bcds(11 downto 8) + 3 when bcds(11 downto 8) > 4 else
                             bcds(11 downto 8);
    bcds_reg(7 downto 4) <= bcds(7 downto 4) + 3 when bcds(7 downto 4) > 4 else
                            bcds(7 downto 4);
    bcds_reg(3 downto 0) <= bcds(3 downto 0) + 3 when bcds(3 downto 0) > 4 else
                            bcds(3 downto 0);
 
    bcds_out_reg_next <= bcds when state = done else
                         bcds_out_reg;
    
    BCD_8_DIGIT_OUT(38 downto 35) <= bcds_out_reg(31 downto 28);
    BCD_8_DIGIT_OUT(33 downto 30) <= bcds_out_reg(27 downto 24);
    BCD_8_DIGIT_OUT(28 downto 25) <= bcds_out_reg(23 downto 20);
    BCD_8_DIGIT_OUT(23 downto 20) <= bcds_out_reg(19 downto 16);
    BCD_8_DIGIT_OUT(18 downto 15) <= bcds_out_reg(15 downto 12);
    BCD_8_DIGIT_OUT(13 downto 10) <= bcds_out_reg(11 downto 8);
    BCD_8_DIGIT_OUT(8 downto 5) <= bcds_out_reg(7 downto 4);
    BCD_8_DIGIT_OUT(3 downto 0) <= bcds_out_reg(3 downto 0);
 
end behaviour;

