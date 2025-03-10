----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2025 14:34:26
-- Design Name: 
-- Module Name: countdown_leds - Behavioral
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

entity countdown_leds is
    Port ( ENABLE_IN : in STD_LOGIC;
           ANODE_SELECT_OUT : out STD_LOGIC_VECTOR (7 downto 0);
           SEGMENT_LIGHTS_OUT : out STD_LOGIC_VECTOR (7 downto 0);
           SLOWCLK_IN : in STD_LOGIC;
           FINISHED_OUT : out STD_LOGIC);
end countdown_leds;

architecture Behavioral of countdown_leds is
    signal led_counter : natural := 3;
begin
    process (ENABLE_IN)
    begin
        if (ENABLE_IN'event and ENABLE_IN='1') then
            led_counter <= 3;
            FINISHED_OUT <= '0';
            ANODE_SELECT_OUT <= "11111000";
            SEGMENT_LIGHTS_OUT <= "11111110";
        end if;
    end process;

    process (SLOWCLK_IN)
    begin
        if (ENABLE_IN='1') then
            if (SLOWCLK_IN'event and SLOWCLK_IN='1') then
                if (led_counter = 0) then
                    FINISHED_OUT <= '1';
                else
                    led_counter <= led_counter - 1;
                end if;
                ANODE_SELECT_OUT(led_counter) <= '1';
           end if;
       end if;
    end process;
end Behavioral;
