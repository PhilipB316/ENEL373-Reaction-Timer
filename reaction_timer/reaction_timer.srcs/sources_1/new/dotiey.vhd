----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2025 15:23:20
-- Design Name: 
-- Module Name: dotiey - Behavioral
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
entity dotiey is
    Port ( SELECT_IN : in STD_LOGIC_VECTOR (2 downto 0);
           CLK_IN : in STD_LOGIC;
           EN_IN : in STD_LOGIC;
           DOT_OUT : out STD_LOGIC_VECTOR (3 downto 0);
           TIMER_FINISHED : out STD_LOGIC);
end dotiey;

architecture Behavioral of dotiey is
--  Define local values
    signal count : std_logic_vector (3 downto 0) := "0010";
    signal dot: std_logic_vector (3 downto 0) := "1110";
    signal blank : std_logic_vector (3 downto 0) := "1010";

begin

    process (CLK_IN, EN_IN)
    begin 
--      On rising clock edge decrement count, if zero, set TIMER_FINISHED to true
        if rising_edge(CLK_IN) then
            if EN_IN = '1' then
                if count /= "0000" then
                    count <= std_logic_vector(unsigned(count) - 1);
                else
                    TIMER_FINISHED <= '1';
                end if;
            end if;
        end if;
        
--      If not enabled, reset counter and TIMER_FINISHED
        if EN_IN = '0' then
            count <= "0010";
            TIMER_FINISHED <= '0';
        end if;
    end process;
    
    process (SELECT_IN)
    begin
--      Output a dot if the display number is <= the count, else output blank
        if (unsigned(SELECT_IN) <= unsigned(count)) then
            DOT_OUT <= dot;
        else
            DOT_OUT <= blank;
        end if;
    end process;

end Behavioral;
