----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2025 04:39:34 PM
-- Design Name: 
-- Module Name: random_number_generator - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity random_number_generator is
    Port ( CLK_IN : in STD_LOGIC;
           RAND_OUT : out STD_LOGIC_VECTOR (7 downto 0));
end random_number_generator;

architecture Behavioral of random_number_generator is

    signal current_rand : std_logic_vector (7 downto 0) := "11111111";
    
    begin
    
    -- here we make a random number generator
    
    process (CLK_IN)
    begin
        if rising_edge(CLK_IN) then
            current_rand(6 downto 0) <= current_rand(7 downto 1);
            current_rand(7) <= current_rand(0) XOR current_rand(4) XOR current_rand(5) XOR current_rand(6);
        end if;
    end process;

    RAND_OUT <= current_rand;

end Behavioral;
