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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsm is
    Port ( STATE_OUT : out STD_LOGIC_VECTOR (3 downto 0);
           TRIGGERS_IN : in STD_LOGIC_VECTOR (1 downto 0));
end fsm;

architecture Behavioral of fsm is

    signal state : std_logic_vector (3 downto 0);

begin
--  Triggers
--  TRIGGERS_IN(0) <= BTNC
--  TRIGGERS_IN(1) <= Dotty Completion

--  States
--  X"0" <= Counting
--  X"1" <= Display Time
--  X"2" <= Dots

--  BTNC event
    process (TRIGGERS_IN(0)) is
    begin     
        if (TRIGGERS_IN(0) = '1') then        
--          Counting state
            if (state = X"0") then
                state <= X"1";
            
--          Display Time state
            elsif (state = X"1") then
                state <= X"2";
            end if;
        end if;    
    end process;
    
--  dot clock event
    process (TRIGGERS_IN(1)) is
    begin     
        if (TRIGGERS_IN(1) = '1') then        
--          Dot state
            if (state = X"2") then
                state <= X"0";
            end if;
        end if;    
    end process;

    STATE_OUT <= state;

end Behavioral;
