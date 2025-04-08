library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity binary_to_bcd_8 is
    Port ( BINARY_IN : in STD_LOGIC_VECTOR (9 downto 0);
           BCD_BUS_OUT : out STD_LOGIC_VECTOR (39 downto 0));
end binary_to_bcd_8;

architecture Behavioral of binary_to_bcd_8 is

begin
    process (BINARY_IN)
        variable bcd_bus_out : unsigned (39 downto 0);
    begin
        bcd_bus_out := X"0000000000";
        bcd_bus_out(39 downto 35) := unsigned(BINARY_IN) mod 10**7;
        bcd_bus_out(34 downto 30) := unsigned(BINARY_IN) mod 10**6;
        bcd_bus_out(29 downto 25) := unsigned(BINARY_IN) mod 10**5;
        bcd_bus_out(24 downto 20) := unsigned(BINARY_IN) mod 10**4;
        bcd_bus_out(19 downto 15) := unsigned(BINARY_IN) mod 10**3;
        bcd_bus_out(14 downto 10) := unsigned(BINARY_IN) mod 10**2;
        bcd_bus_out(9 downto 5) := unsigned(BINARY_IN) mod 10**1;
        bcd_bus_out(4 downto 0) := unsigned(BINARY_IN) mod 10**0;
    end process;
end Behavioral;