----------------------------------------------------------------------------------
-- Engineers: Boston Black, Philip Brand, Michael Brown

-- Create Date: 03/27/2025 04:39:34 PM
-- Module Name: random_number_generator - Behavioral
-- Project Name: Reaction Timer

-- Description: 
-- LFSR for pseudo-random number generation
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lfsr is
    Port ( CLK_IN : in STD_LOGIC;
           RAND_OUT : out STD_LOGIC_VECTOR (7 downto 0));
end lfsr;

architecture Behavioral of lfsr is
    signal current_rand : std_logic_vector (7 downto 0) := "11111111";
begin
    process (CLK_IN)
    begin
        if rising_edge(CLK_IN) then
            -- shift the bits
            current_rand(6 downto 0) <= current_rand(7 downto 1);
            -- new bit it from taps at 0, 4, 5, and 6
            current_rand(7) <= current_rand(0) XOR current_rand(4) XOR current_rand(5) XOR current_rand(6);
        end if;
    end process;
    RAND_OUT <= current_rand;
end Behavioral;

