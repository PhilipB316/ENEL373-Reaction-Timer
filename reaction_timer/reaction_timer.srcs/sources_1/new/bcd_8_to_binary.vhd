library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bcd_8_to_binary is
    Port ( BCD_BUS_IN : in STD_LOGIC_VECTOR (39 downto 0);
           BINARY_OUT : out STD_LOGIC_VECTOR (9 downto 0));
end bcd_8_to_binary;

architecture Behavioral of bcd_8_to_binary is
    
begin
    process (BCD_BUS_IN)
        variable bcd_sum : unsigned (9 downto 0);
    begin
        bcd_sum := "0000000000";
        bcd_sum := bcd_sum + unsigned(BCD_BUS_IN(39 downto 35)) * (10 ** 7);
        bcd_sum := bcd_sum + unsigned(BCD_BUS_IN(34 downto 30)) * (10 ** 6);
        bcd_sum := bcd_sum + unsigned(BCD_BUS_IN(29 downto 25)) * (10 ** 5);
        bcd_sum := bcd_sum + unsigned(BCD_BUS_IN(24 downto 20)) * (10 ** 4);
        bcd_sum := bcd_sum + unsigned(BCD_BUS_IN(19 downto 15)) * (10 ** 3);
        bcd_sum := bcd_sum + unsigned(BCD_BUS_IN(14 downto 10)) * (10 ** 2);
        bcd_sum := bcd_sum + unsigned(BCD_BUS_IN(9 downto 5)) * (10 ** 1);
        bcd_sum := bcd_sum + unsigned(BCD_BUS_IN(4 downto 0)) * (10 ** 0);
        BINARY_OUT <= std_logic_vector(bcd_sum);
    end process;
end Behavioral;

