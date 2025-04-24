----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2025 08:30:50
-- Design Name: 
-- Module Name: bcd_8_to_binary_tb - Behavioral
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

entity bcd_8_to_binary_tb is
--  Port ( );
end bcd_8_to_binary_tb;

architecture Behavioral of bcd_8_to_binary_tb is
    component bcd_8_to_binary is
        Port ( BCD_BUS_IN : in STD_LOGIC_VECTOR (39 downto 0);
               BINARY_OUT : out STD_LOGIC_VECTOR (27 downto 0));
    end component bcd_8_to_binary;
    signal binary_result : std_logic_vector (27 downto 0);
    signal bcd_input : std_logic_vector (39 downto 0) := (others => '0');
begin
    bcd_input(3 downto 0) <= X"2";
    bcd_input(8 downto 5) <= X"5";
    bcd_input(13 downto 10) <= X"9";
    bcd_input(18 downto 15) <= X"1";
    
    ff0: bcd_8_to_binary port map(BCD_BUS_IN => bcd_input,
                                  BINARY_OUT => binary_result);


end Behavioral;
