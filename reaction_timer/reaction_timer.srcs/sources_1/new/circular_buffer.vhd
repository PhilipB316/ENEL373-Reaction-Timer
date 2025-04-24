----------------------------------------------------------------------------------
-- Engineers: Philip Brand, Michael Brown, Boston Black

-- Create Date: 03/20/2025 04:18:41 PM
-- Module Name: circular_buffer - Behavioral
-- Project Name: Reaction Timer

-- Description: 
-- 3 element circular buffer for storing reaction times
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity circular_buffer is
    Port ( NUMBER_IN : in STD_LOGIC_VECTOR (27 downto 0) := (others => '0');
           NUMBER_1_OUT, NUMBER_2_OUT, NUMBER_3_OUT : out STD_LOGIC_VECTOR (27 downto 0) := (others => '0');
           BUFFER_SIZE_OUT : out STD_LOGIC_VECTOR (1 downto 0);
           RESET_IN, WRITE_TRIGGER_IN : in STD_LOGIC);
end circular_buffer;

architecture Behavioral of circular_buffer is
    signal write_index : std_logic_vector (1 downto 0) := "00";
    signal buffer_size : std_logic_vector (1 downto 0) := "00";
begin
    process (RESET_IN, WRITE_TRIGGER_IN)
    begin
        if (RESET_IN = '1') then
            write_index <= "00";
            buffer_size <= "00";
            NUMBER_1_OUT <= X"0000000";
            NUMBER_2_OUT <= X"0000000";
            NUMBER_3_OUT <= X"0000000";
        elsif rising_edge(WRITE_TRIGGER_IN) then
            case (write_index) is 
                when "00" => NUMBER_1_OUT <= NUMBER_IN;
                when "01" => NUMBER_2_OUT <= NUMBER_IN;
                when "10" => NUMBER_3_OUT <= NUMBER_IN;
                when others => NULL;
            end case;
            
--          Increment the write index until max then set to 0
            if (write_index = "10") then
                write_index <= "00";
            else
                write_index <= std_logic_vector(unsigned(write_index) + 1);
            end if;
            
--          Increment buffer size until max
            if (buffer_size < "11") then
                buffer_size <= std_logic_vector(unsigned(buffer_size) + 1);
            end if;
        end if;
    end process;
    BUFFER_SIZE_OUT <= buffer_size;
end Behavioral;
