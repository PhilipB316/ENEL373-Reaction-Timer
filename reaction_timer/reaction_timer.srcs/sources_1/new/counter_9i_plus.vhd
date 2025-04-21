----------------------------------------------------------------------------------
-- Engineers: Philip Brand, Michael Brown, Boston Black

-- Create Date: 03.03.2025 15:59:26
-- Module Name: counter_9i_plus - Behavioral
-- Project Name: Reaction Timer

-- Description: 
-- decade counter
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_decade is
    Port ( EN_IN : in STD_LOGIC;
           RESET_IN : in STD_LOGIC;
           INCREMENT_IN : in STD_LOGIC;
           COUNT_OUT : out STD_LOGIC_VECTOR (4 downto 0);
           TICK_OUT : out STD_LOGIC);
end counter_decade;

architecture Behavioral of counter_decade is
    signal count : std_logic_vector (4 downto 0) := (others => '0');
    signal tick : std_logic := '0';
begin
    process (INCREMENT_IN, RESET_IN)
    begin
        if rising_edge (INCREMENT_IN) then
            if EN_IN = '1' then
                count <= std_logic_vector(unsigned(count) + 1);
                if count = "01001" then
                    count <= "00000";
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
        if (RESET_IN = '1') then
            count <= "00000";
        end if;
    end process;
    COUNT_OUT <= count;
    TICK_OUT <= tick;
end Behavioral;
