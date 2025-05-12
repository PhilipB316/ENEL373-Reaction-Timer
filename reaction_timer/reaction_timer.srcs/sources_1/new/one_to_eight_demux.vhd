----------------------------------------------------------------------------------
-- Engineers: Boston Black, Philip Brand, Michael Brown

-- Create Date: 05.03.2025 16:27:40
-- Module Name: one_to_eight_demux - Behavioral
-- Project Name: Reaction Timer

-- Description: 
-- 1 to 8 demultiplexer
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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

