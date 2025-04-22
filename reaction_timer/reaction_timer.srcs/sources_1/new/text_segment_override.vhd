----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2025 19:24:39
-- Design Name: 
-- Module Name: text_segment_override - Behavioral
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

-- Define module IO
entity text_segment_override is
    Port ( SELECT_IN : in STD_LOGIC_VECTOR (2 downto 0);
           ENCODED_SEG_IN : in STD_LOGIC_VECTOR (3 downto 0);
           ENCODED_SEG_OUT : out STD_LOGIC_VECTOR (3 downto 0);
           OVERRIDE_TEXT_IN : in STD_LOGIC_VECTOR (7 downto 0));
end text_segment_override;

architecture Behavioral of text_segment_override is

begin
    process (SELECT_IN)
    begin
--      If current segment needs text on it then override it with the text
        if (unsigned(SELECT_IN) = 7) then
            ENCODED_SEG_OUT <= OVERRIDE_TEXT_IN(7 downto 4);
        elsif (unsigned(SELECT_IN) = 6) then
            ENCODED_SEG_OUT <= OVERRIDE_TEXT_IN(3 downto 0);
        else
            ENCODED_SEG_OUT <= ENCODED_SEG_IN;
        end if;
    end process;
end Behavioral;
