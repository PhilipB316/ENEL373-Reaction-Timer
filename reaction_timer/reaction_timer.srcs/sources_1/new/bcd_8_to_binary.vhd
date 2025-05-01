----------------------------------------------------------------------------------
-- Engineers: Philip Brand, Michael Brown, Boston Black

-- Module Name: bcd_8_to_binary - Behavioral
-- Project Name: Reaction Timer

-- Description:
-- BCD to binary converter
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bcd_8_to_binary is
    Port ( BCD_BUS_IN : in STD_LOGIC_VECTOR (39 downto 0);
           BINARY_OUT : out STD_LOGIC_VECTOR (27 downto 0));
end bcd_8_to_binary;

architecture Behavioral of bcd_8_to_binary is
    signal binary_temp : STD_LOGIC_VECTOR (28 downto 0) := (others => '0');
begin
    process (BCD_BUS_IN)
    begin
        -- Each binary number represents another multiple of 10
        binary_temp(28 downto 0) <= (BCD_BUS_IN(4 downto 0) * "1") +
                                    (BCD_BUS_IN(9 downto 5) * "1010") + 
                                    (BCD_BUS_IN(14 downto 10) * "1100100") +
                                    (BCD_BUS_IN(19 downto 15) * "1111101000") +
                                    (BCD_BUS_IN(24 downto 20) * "10011100010000") +
                                    (BCD_BUS_IN(29 downto 25) * "11000011010100000") +
                                    (BCD_BUS_IN(34 downto 30) * "11110100001001000000") +
                                    (BCD_BUS_IN(39 downto 35) * "100110001001011010000000");
    end process;
    BINARY_OUT <= binary_temp(27 downto 0);
end Behavioral;

