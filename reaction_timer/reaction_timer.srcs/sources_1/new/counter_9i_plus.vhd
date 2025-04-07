----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2025 15:59:26
-- Design Name: 
-- Module Name: counter_9i_plus - Behavioral
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
entity counter_decade is
    Port ( EN_IN : in STD_LOGIC;
           RESET_IN : in STD_LOGIC;
           INCREMENT_IN : in STD_LOGIC;
           COUNT_OUT : out STD_LOGIC_VECTOR (3 downto 0);
           TICK_OUT : out STD_LOGIC);
end counter_decade;

architecture Behavioral of counter_decade is
--  Define local values
    signal count : std_logic_vector (3 downto 0) := (others => '0');
    signal tick : std_logic := '0';

begin

    process (INCREMENT_IN, RESET_IN)
    begin

--      If clock is on a rising edge
        if rising_edge (INCREMENT_IN) then

            if EN_IN = '1' then
--              Increment count on clock signal
                count <= std_logic_vector(unsigned(count) + 1);

--              If count reaches max value reset to 0 AND toggle tick
                if count = X"9" then
                    count <= X"0";
                    tick <= not tick;
                end if;
            end if;

        end if;

--      Put tick back to zero on the falling edge
        if falling_edge (INCREMENT_IN) then

            if tick = '1' then
                tick <= not tick;
            end if;

        end if;

--      if RESET then set count to 0
        if (RESET_IN = '1') then
            count <= X"0";
        end if;

    end process;

    COUNT_OUT <= count;
    TICK_OUT <= tick;

end Behavioral;

