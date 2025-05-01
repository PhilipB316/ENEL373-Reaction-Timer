----------------------------------------------------------------------------------
-- Engineers: 
-- Create Date: 10.04.2025 11:54:28
-- Module Name: converter_tb - Behavioral
-- Project Name: 
-- Description: 
-- Additional Comments: Out of date Non-functional
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity converter_tb is
--  Port ( );
end converter_tb;

architecture Behavioral of converter_tb is

    component bcd_8_to_binary is
        Port ( BCD_BUS_IN : in STD_LOGIC_VECTOR (39 downto 0);
               BINARY_OUT : out STD_LOGIC_VECTOR (9 downto 0));
    end component bcd_8_to_binary;
    
    component binary_to_bcd_8 is
        Port ( BINARY_IN : in STD_LOGIC_VECTOR (9 downto 0);
               BCD_BUS_OUT : out STD_LOGIC_VECTOR (39 downto 0));
    end component binary_to_bcd_8;
    
    signal input_bcd_bus : std_logic_vector (39 downto 0) := x"0123456789";
    signal output_bcd_bus : std_logic_vector (39 downto 0) := x"0000000000";
    signal binary_bus : std_logic_vector (9 downto 0) := "0000000000";

begin

    uu1: bcd_8_to_binary port map(BCD_BUS_IN => input_bcd_bus,
                                  BINARY_OUT => binary_bus);
                                  
    uu2: binary_to_bcd_8 port map(BINARY_IN => binary_bus,
                                  BCD_BUS_OUT => output_bcd_bus);

simulation : process
begin
    wait for 10ns;
    input_bcd_bus <= x"9876543210";
    wait for 10ns;
    input_bcd_bus <= x"0123456789";
end process;

end Behavioral;
