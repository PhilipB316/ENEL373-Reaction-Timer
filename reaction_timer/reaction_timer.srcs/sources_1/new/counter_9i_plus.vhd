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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_9i_plus is
    Port ( EN_IN : in STD_LOGIC;
           RESET_IN : in STD_LOGIC;
           INCREMENT_IN : in STD_LOGIC;
           COUNT_OUT : out STD_LOGIC_VECTOR (3 downto 0);
           TICK_OUT : out STD_LOGIC);
end counter_9i_plus;

architecture Behavioral of counter_9i_plus is
    signal count : std_logic_vector (3 downto 0) := (others => '0');
    signal tick : std_logic := '0';
begin
    process (INCREMENT_IN)
    begin
--      If clock is on a rising edge and enable is on
        if rising_edge (INCREMENT_IN) and EN_IN = '1' then
--          Increment count on clock signal
            count <= std_logic_vector(unsigned(count) + 1);
            
--          If count reaches max value reset to 0
            if count = X"9" then
                count <= X"0";
                tick <= not tick;
            end if;
        end if;
        
--      If reset is true then set counter back to 0
        if rising_edge (INCREMENT_IN) and RESET_IN = '1' then
            count <= X"0";
        end if;
            
    end process;

--  Move values to outputs
    TICK_OUT <= tick;
    COUNT_OUT <= count;

end Behavioral;
