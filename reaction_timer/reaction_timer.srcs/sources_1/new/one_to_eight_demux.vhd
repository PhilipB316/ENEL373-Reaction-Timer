----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2025 16:27:40
-- Design Name: 
-- Module Name: one_to_eight_demux - Behavioral
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

entity one_to_eight_demux is
    Port ( SELECT_IN : in STD_LOGIC_VECTOR (2 downto 0);
           DEMUX_OUT : out STD_LOGIC_VECTOR (7 downto 0));
end one_to_eight_demux;

architecture Behavioral of one_to_eight_demux is
begin
    process (SELECT_IN) is
    begin
        case (SELECT_IN) is
            when "000" => DEMUX_OUT <= X"01";
            when "001" => DEMUX_OUT <= X"02";
            when "010" => DEMUX_OUT <= X"04";
            when "011" => DEMUX_OUT <= X"08";
            when "100" => DEMUX_OUT <= X"10";
            when "101" => DEMUX_OUT <= X"20";
            when "110" => DEMUX_OUT <= X"40";
            when "111" => DEMUX_OUT <= X"80";
        end case;
    end process;
end Behavioral;
