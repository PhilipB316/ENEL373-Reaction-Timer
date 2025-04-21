----------------------------------------------------------------------------------
-- Engineer: Boston Black, Philip Brand, Michael Brown

-- Create Date: 20.03.2025 15:52:27
-- Module Name: alu - Behavioral
-- Project Name: Reaction Timer

-- Description: 
-- ALU for reaction timer.
-- Takes 3 data inputs and finds max, min, and average of those inputs.
-- Outputs the result based on the operation selected.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    Port ( NUM_1_IN, NUM_2_IN, NUM_3_IN : in STD_LOGIC_VECTOR (27 downto 0);
           BUFFER_SIZE_IN, OPERATION_SELECT_IN : in STD_LOGIC_VECTOR (1 downto 0);
           OUTPUT_OUT : out STD_LOGIC_VECTOR (27 downto 0));
end alu;

architecture Behavioral of alu is
    signal output_max : std_logic_vector (27 downto 0) := X"0000000";
    signal output_min : std_logic_vector (27 downto 0) := X"0000000";
    signal output_avg : std_logic_vector (27 downto 0) := X"0000000";
    signal temp_max : std_logic_vector (27 downto 0) := X"0000000";
    signal temp_min : std_logic_vector (27 downto 0) := X"0000000";
    signal temp_avg : std_logic_vector (27 downto 0) := X"0000000";
    signal sum : std_logic_vector (27 downto 0) := X"0000000";
    signal divisor : std_logic_vector (1 downto 0) := "01";
begin

--  Calculate maximum
    temp_max <= NUM_1_IN when NUM_1_IN > NUM_2_IN else NUM_2_IN;
    output_max <= temp_max when temp_max > NUM_3_IN else NUM_3_IN;
   
--  Calculate minimum 
    temp_min <= NUM_1_IN when NUM_1_IN < NUM_2_IN else NUM_2_IN;
    output_min <= temp_min when temp_max < NUM_3_IN else NUM_3_IN;
    
--  Calculate average
    sum <= std_logic_vector(unsigned(NUM_1_IN) + unsigned(NUM_2_IN) + unsigned(NUM_3_IN));   
    divisor <= "01" when BUFFER_SIZE_IN = "00" else 
               "10" when BUFFER_SIZE_IN = "01" else
               "11";
               
    output_avg <= std_logic_vector(unsigned(sum) / unsigned(divisor));
    
    process (OPERATION_SELECT_IN) is
    begin
        case OPERATION_SELECT_IN is 
            when "01" => OUTPUT_OUT(27 downto 0) <= output_max;
            when "10" => OUTPUT_OUT(27 downto 0) <= output_min;
            when "11" => OUTPUT_OUT(27 downto 0) <= avg;
            when others => OUTPUT_OUT(27 downto 0) <= X"0000000"; -- Handle unexpected cases
        end case;
    end process;

end Behavioral;
