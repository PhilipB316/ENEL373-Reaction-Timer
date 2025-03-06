----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2025 13:57:54
-- Design Name: 
-- Module Name: output_mux - Behavioral
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

entity output_mux is
    Port ( BCD_1_IN : in STD_LOGIC_VECTOR (3 downto 0);
           ANODE_1_IN : in STD_LOGIC_VECTOR (2 downto 0);
           BCD_2_IN : in STD_LOGIC_VECTOR (3 downto 0);
           ANODE_2_IN : in STD_LOGIC_VECTOR (2 downto 0);
           SELECT_IN : in STD_LOGIC;
           BCD_OUT : out STD_LOGIC_VECTOR (3 downto 0);
           ANODE_OUT : out STD_LOGIC_VECTOR (2 downto 0));
end output_mux;

architecture Behavioral of output_mux is

begin
    process
    begin
        if (SELECT_IN = '1') then
            BCD_OUT <= BCD_1_IN;
            ANODE_OUT <= ANODE_1_IN;
        else
            BCD_OUT <= BCD_2_IN;
            ANODE_OUT <= ANODE_2_IN;
        end if;
    end process;
end Behavioral;
