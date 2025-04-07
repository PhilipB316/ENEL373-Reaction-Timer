----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2025 04:18:41 PM
-- Design Name: 
-- Module Name: circular_buffer - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity circular_buffer is
    Port ( NUMBER_IN : in STD_LOGIC_VECTOR (9 downto 0);
           NUMBER_1_OUT : out STD_LOGIC_VECTOR (9 downto 0);
           NUMBER_2_OUT : out STD_LOGIC_VECTOR (9 downto 0);
           NUMBER_3_OUT : out STD_LOGIC_VECTOR (9 downto 0);
           RESET_IN : in STD_LOGIC;
           WRITE_TRIGGER_IN : in STD_LOGIC);
end circular_buffer;

architecture Behavioral of circular_buffer is
    signal write_index : std_logic_vector (1 downto 0);
begin
    process (RESET_IN)
    begin
        if (RESET_IN = '1') then
            write_index <= "0";
            NUMBER_1_OUT <= "000000000";
            NUMBER_2_OUT <= "000000000";
            NUMBER_3_OUT <= "000000000";
        end if;
    end process;
    
    process (WRITE_TRIGGER_IN)
    begin
        if rising_edge(WRITE_TRIGGER_IN) then
            case (write_index) is 
                when "00" => NUMBER_1_OUT <= NUMBER_IN;
                when "01" => NUMBER_1_OUT <= NUMBER_IN;
                when "10" => NUMBER_1_OUT <= NUMBER_IN;
            end case;
            write_index <= std_logic_vector(unsigned(write_index) + 1);
        end if;
        
        if falling_edge(WRITE_TRIGGER_IN) then
            if (write_index = "10") then
                write_index <= "00";
            end if;
        end if;
    end process; 
end Behavioral;
