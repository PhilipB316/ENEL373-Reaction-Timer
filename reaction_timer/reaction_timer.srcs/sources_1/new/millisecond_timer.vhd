----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2025 14:47:21
-- Design Name: 
-- Module Name: millisecond_timer - Behavioral
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

entity millisecond_timer is
    Port ( EN_TIMER_IN : in STD_LOGIC;
           EN_OUTPUT_IN : in STD_LOGIC;
           RESET_IN : STD_LOGIC;
           SLOWCLK_IN : in STD_LOGIC;
           AN_SELECT_IN : in STD_LOGIC_VECTOR (7 downto 0);
           NUMBER_OUT : out STD_LOGIC_VECTOR (3 downto 0));
end millisecond_timer;

architecture Behavioral of millisecond_timer is
    component counter_9i_plus is
        port ( EN_IN : in std_logic;
               RESET_IN : in std_logic;
               INCREMENT_IN : in std_logic;
               COUNT_OUT : out std_logic_vector;
               TICK_OUT : out std_logic);
    end component counter_9i_plus;
    
    signal tick_over : std_logic_vector (8 downto 0);
    signal enable_counters : std_logic_vector (7 downto 1);
begin
    process
    begin
        if (EN_TIMER_IN = '1') then
            enable_counters <= X"FF";
            tick_over(0) <= SLOWCLK_IN;
        elsif (EN_OUTPUT_IN = '1') then
            enable_counters <= AN_SELECT_IN;
        else
            enable_counters <= X"00";
        end if;
    end process;

    ff0: counter_9i_plus port map (EN_IN => enable_counters(0),
                                   RESET_IN => RESET_IN,
                                   INCREMENT_IN => tick_over(0),
                                   COUNT_OUT => NUMBER_OUT,
                                   TICK_OUT => tick_over(1));
                                   
    ff1: counter_9i_plus port map (EN_IN => enable_counters(1),
                                   RESET_IN => RESET_IN,
                                   INCREMENT_IN => tick_over(1),
                                   COUNT_OUT => NUMBER_OUT,
                                   TICK_OUT => tick_over(2));
    
    ff2: counter_9i_plus port map (EN_IN => enable_counters(2),
                                   RESET_IN => RESET_IN,
                                   INCREMENT_IN => tick_over(2),
                                   COUNT_OUT => NUMBER_OUT,
                                   TICK_OUT => tick_over(3));
                                   
    ff3: counter_9i_plus port map (EN_IN => enable_counters(3),
                                   RESET_IN => RESET_IN,
                                   INCREMENT_IN => tick_over(3),
                                   COUNT_OUT => NUMBER_OUT,
                                   TICK_OUT => tick_over(4));
    
    ff4: counter_9i_plus port map (EN_IN => enable_counters(4),
                                   RESET_IN => RESET_IN,
                                   INCREMENT_IN => tick_over(4),
                                   COUNT_OUT => NUMBER_OUT,
                                   TICK_OUT => tick_over(5));
                                   
    ff5: counter_9i_plus port map (EN_IN => enable_counters(5),
                                   RESET_IN => RESET_IN,
                                   INCREMENT_IN => tick_over(5),
                                   COUNT_OUT => NUMBER_OUT,
                                   TICK_OUT => tick_over(6));
    
    ff6: counter_9i_plus port map (EN_IN => enable_counters(6),
                                   RESET_IN => RESET_IN,
                                   INCREMENT_IN => tick_over(6),
                                   COUNT_OUT => NUMBER_OUT,
                                   TICK_OUT => tick_over(7));
                                   
    ff7: counter_9i_plus port map (EN_IN => enable_counters(7),
                                   RESET_IN => RESET_IN,
                                   INCREMENT_IN => tick_over(7),
                                   COUNT_OUT => NUMBER_OUT,
                                   TICK_OUT => tick_over(8));

end Behavioral;
