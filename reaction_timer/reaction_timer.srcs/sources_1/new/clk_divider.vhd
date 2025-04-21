----------------------------------------------------------------------------------
-- Engineers: Philip Brand, Michael Brown, Boston Black

-- Create Date: 03.03.2025 11:20:09
-- Module Name: clk_divider - Behavioral
-- Project Name: Reaction Timer

-- Description:
-- clk divider for reducing clock frequency
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clk_divider is
    Port ( CLK100MHZ_IN : in STD_LOGIC;
           UPPERBOUND_IN : in STD_LOGIC_VECTOR (27 downto 0);
           SLOWCLK_OUT : out STD_LOGIC);
end clk_divider;

architecture Behavioral of clk_divider is
    signal count: std_logic_vector (27 downto 0) := (others => '0');
    signal temp: std_logic := '1';
    signal upperbound_half : STD_LOGIC_VECTOR (27 downto 0);
begin
--  Move the temporary clock to the SLOWCLK output
    SLOWCLK_OUT <= temp;
    upperbound_half <= std_logic_vector(unsigned(UPPERBOUND_IN) / 2);

    begin
        if rising_edge (CLK100MHZ_IN) then
--          If UPPERBOUND is reached, reset count and toggle temporary clock
            if count = upperbound_half then
                count <= (others => '0');
                temp <= not temp;
            else
--             Else increase the counter
               count <= std_logic_vector(unsigned(count) + 1);
            end if;
        end if;
    end process;

end Behavioral;
