----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2025 04:07:27 PM
-- Design Name: 
-- Module Name: fsm - Behavioral
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

entity fsm is
    Port ( CLK_IN : in STD_LOGIC;
           STATE_OUT : out STD_LOGIC_VECTOR (3 downto 0);
           TRIGGERS_IN : in STD_LOGIC_VECTOR (1 downto 0));
end fsm;

architecture Behavioral of fsm is

    signal state : std_logic_vector (3 downto 0);
    signal last_triggers : std_logic_vector (1 downto 0);

begin
--  Triggers
--  TRIGGERS_IN(0) <= BTNC
--  TRIGGERS_IN(1) <= Dotty Completion

--  States
--  X"0" <= Counting
--  X"1" <= Display Time
--  X"2" <= Dots
    process (CLK_IN) is
    begin
        if (CLK_IN = '1') then
--          BTNC   
            if (TRIGGERS_IN(0) = '1' and last_triggers /= TRIGGERS_IN) then        
--              Counting state
                if (state = X"0") then
                    state <= X"1";
                
--              Display Time state
                elsif (state = X"1") then
                    state <= X"2";
                end if;
            
--          Dot timer
            elsif (TRIGGERS_IN(1) = '1') then        
--              Dot state
                if (state = X"2") then
                    state <= X"0";
                end if;
            end if;
        end if;
        
        if (CLK_IN = '0') then
            last_triggers <= TRIGGERS_IN;
        end if;
    end process;

    STATE_OUT <= state;

end Behavioral;
