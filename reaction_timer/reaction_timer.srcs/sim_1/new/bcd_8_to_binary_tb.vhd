----------------------------------------------------------------------------------
-- Engineer: 
-- Create Date: 25.04.2025 08:30:50
-- Module Name: bcd_8_to_binary_tb - Behavioral
-- Project Name: 
-- Description: 
-- Additional Comments:
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_8_to_binary_tb is
--  Port ( );
end bcd_8_to_binary_tb;

architecture Behavioral of bcd_8_to_binary_tb is
    component bcd_8_to_binary is
        Port ( BCD_BUS_IN : in STD_LOGIC_VECTOR (39 downto 0);
               BINARY_OUT : out STD_LOGIC_VECTOR (27 downto 0));
    end component bcd_8_to_binary;
    
    signal binary_result : std_logic_vector (27 downto 0) := (others => '0');
    signal bcd_input : std_logic_vector (39 downto 0) := (others => '0');
    signal readable_input : std_logic_vector (31 downto 0) := (others => '0');
    
begin
    
    readable_input(3 downto 0) <= X"2";
    readable_input(7 downto 4) <= X"5";
    readable_input(11 downto 8) <= X"9";
    readable_input(15 downto 12) <= X"1";
    
    bcd_input(3 downto 0) <= readable_input(3 downto 0);
    bcd_input(8 downto 5) <= readable_input(7 downto 4);
    bcd_input(13 downto 10) <= readable_input(11 downto 8);
    bcd_input(18 downto 15) <= readable_input(15 downto 12);

    
    ffo: component bcd_8_to_binary port map(BCD_BUS_IN => bcd_input,
                                       BINARY_OUT => binary_result);

end Behavioral;
