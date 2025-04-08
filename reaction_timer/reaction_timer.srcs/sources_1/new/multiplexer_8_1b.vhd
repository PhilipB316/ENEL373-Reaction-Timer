----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2025 16:03:56
-- Design Name: 
-- Module Name: multiplexer_8_1 - Behavioral
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

-- Define module IO
entity multiplexer_8_1_4b is
    Port ( MUX_IN_0 : in STD_LOGIC_VECTOR (4 downto 0);
           MUX_IN_1 : in STD_LOGIC_VECTOR (4 downto 0);
           MUX_IN_2 : in STD_LOGIC_VECTOR (4 downto 0);
           MUX_IN_3 : in STD_LOGIC_VECTOR (4 downto 0);
           MUX_IN_4 : in STD_LOGIC_VECTOR (4 downto 0);
           MUX_IN_5 : in STD_LOGIC_VECTOR (4 downto 0);
           MUX_IN_6 : in STD_LOGIC_VECTOR (4 downto 0);
           MUX_IN_7 : in STD_LOGIC_VECTOR (4 downto 0);
           SELECT_IN : in STD_LOGIC_VECTOR (2 downto 0);
           MUX_OUT : out STD_LOGIC_VECTOR (4 downto 0));
end multiplexer_8_1_4b;

architecture Behavioral of multiplexer_8_1_4b is

begin
    process (SELECT_IN)
    begin
        case(SELECT_IN) is
            when "000" => MUX_OUT <= MUX_IN_0;
            when "001" => MUX_OUT <= MUX_IN_1;
            when "010" => MUX_OUT <= MUX_IN_2;
            when "011" => MUX_OUT <= MUX_IN_3;
            when "100" => MUX_OUT <= MUX_IN_4;
            when "101" => MUX_OUT <= MUX_IN_5;
            when "110" => MUX_OUT <= MUX_IN_6;
            when "111" => MUX_OUT <= MUX_IN_7;
        end case;
    end process;
end Behavioral;
