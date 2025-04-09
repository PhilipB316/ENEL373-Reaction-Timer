----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2025 11:03:20
-- Design Name: 
-- Module Name: selectable_override - Behavioral
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

entity selectable_override is
    Port ( SEG_SELECT_IN : in STD_LOGIC_VECTOR (2 downto 0);
           TEXT_SELECT_IN : in STD_LOGIC_VECTOR (2 downto 0);
           SEG_IN : in STD_LOGIC_VECTOR (4 downto 0);
           SEG_OUT : out STD_LOGIC_VECTOR (4 downto 0));
end selectable_override;

architecture Behavioral of selectable_override is

    signal override_text : std_logic_vector (9 downto 0);
    
--  Override text signals
--  These are only signals for the sake of code readability
    signal blank_text : std_logic_vector (9 downto 0) := "0101001010";
    signal delay_text : std_logic_vector (9 downto 0) := "0101101100"; -- dL
    signal max_text : std_logic_vector (9 downto 0) := "1000010001"; -- HI
    signal min_text : std_logic_vector (9 downto 0) := "0110010010"; -- LO
    signal avg_text : std_logic_vector (9 downto 0) := "0111101101"; -- Ag
    

begin
    process (TEXT_SELECT_IN, delay_text, blank_text)
    begin
        case(TEXT_SELECT_IN) is
            when "000" => override_text <= delay_text;
            when "001" => override_text <= max_text;
            when "010" => override_text <= min_text;
            when "011" => override_text <= avg_text;
            when others => override_text <= blank_text;
        end case;
    end process;
    
    process (SEG_SELECT_IN, override_text, SEG_IN)
    begin
        case(SEG_SELECT_IN) is 
            when "111" => SEG_OUT <= override_text(9 downto 5); -- display 7
            when "110" => SEG_OUT <= override_text(4 downto 0); -- display 6
            when others => SEG_OUT <= SEG_IN;
        end case;
    end process;


end Behavioral;
