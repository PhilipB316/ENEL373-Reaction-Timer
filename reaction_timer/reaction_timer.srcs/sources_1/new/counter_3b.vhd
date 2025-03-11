----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2025 14:29:14
-- Design Name: 
-- Module Name: counter_3b - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--  Define module IO
entity counter_3b is
    Port ( CLK_IN : in STD_LOGIC;
           COUNT_OUT : out STD_LOGIC_VECTOR (2 downto 0));
end counter_3b;

architecture Behavioral of counter_3b is
--  Define local values
    signal count : std_logic_vector (2 downto 0) := (others => '0');

begin
    process (CLK_IN)
    begin
        if rising_edge (CLK_IN) then
--          Increment count on clock signal
            count <= std_logic_vector(unsigned(count) + 1);
        end if;
    end process;
    
    COUNT_OUT <= count;

end Behavioral;
