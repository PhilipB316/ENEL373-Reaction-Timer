----------------------------------------------------------------------------------
-- Engineer: Philip Brand

-- Create Date: 25.04.2025 14:03:10
-- Module Name: debouncer - Behavioral
-- Project Name: Reaction Timer

-- Description: 
-- Debouncing for button input
-- This module was made with the assistance of generative AI
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debouncer is
    Port ( BUTTON_IN : in STD_LOGIC;
           CLK_IN : STD_LOGIC;
           DEBOUNCED_OUT : out STD_LOGIC);
end debouncer;

architecture Behavioral of debouncer is

begin
    process(BUTTON_IN, CLK_IN)
    variable debounce_counter : integer := 0;
    begin
        if rising_edge(CLK_IN) then
            if BUTTON_IN = '1' then
                debounce_counter := debounce_counter + 1;
                if debounce_counter > 100000 then
                    DEBOUNCED_OUT <= '1';
                end if;
            else
                debounce_counter := 0;
                DEBOUNCED_OUT <= '0';
            end if;
        end if;
    end process;

end Behavioral;
