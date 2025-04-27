----------------------------------------------------------------------------------
-- Engineers: Philip Brand, Michael Brown, Boston Black 

-- Create Date: 06.03.2025 10:12:19
-- Module Name: timer_8_num_selectable - Behavioral
-- Project Name: Reaction Timer

-- Description: 
-- 8 BCD counters tied together with selectable digit output select
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity timer_8_num_selectable is
    Port ( CLK1000HZ_IN : in STD_LOGIC;
           EN_IN : in STD_LOGIC;
           RESET_IN : in STD_LOGIC;
           SELECT_IN : in STD_LOGIC_VECTOR (2 downto 0);
           BCD_BUS_OUT : out STD_LOGIC_VECTOR (39 downto 0);
           INT_OUT : out STD_LOGIC_VECTOR (4 downto 0));
end timer_8_num_selectable;

architecture Behavioral of timer_8_num_selectable is
    signal tick : std_logic_vector(7 downto 0) := X"00";
    signal mux_0 : STD_LOGIC_VECTOR (4 downto 0);
    signal mux_1 : STD_LOGIC_VECTOR (4 downto 0);
    signal mux_2 : STD_LOGIC_VECTOR (4 downto 0);
    signal mux_3 : STD_LOGIC_VECTOR (4 downto 0);
    signal mux_4 : STD_LOGIC_VECTOR (4 downto 0);
    signal mux_5 : STD_LOGIC_VECTOR (4 downto 0);
    signal mux_6 : STD_LOGIC_VECTOR (4 downto 0);
    signal mux_7 : STD_LOGIC_VECTOR (4 downto 0);

    component counter_decade is
        Port ( EN_IN : in std_logic;
               RESET_IN : in std_logic;
               INCREMENT_IN : in std_logic;
               COUNT_OUT : out std_logic_vector;
               TICK_OUT : out std_logic);
    end component counter_decade;

    component multiplexer_8_1_4b is
        Port ( MUX_IN_0 : in STD_LOGIC_VECTOR (4 downto 0);
               MUX_IN_1 : in STD_LOGIC_VECTOR (4 downto 0);
               MUX_IN_2 : in STD_LOGIC_VECTOR (4 downto 0);
               MUX_IN_3 : in STD_LOGIC_VECTOR (4 downto 0);
               MUX_IN_4 : in STD_LOGIC_VECTOR (4 downto 0);
               MUX_IN_5 : in STD_LOGIC_VECTOR (4 downto 0);
               MUX_IN_6 : in STD_LOGIC_VECTOR (4 downto 0);
               MUX_IN_7 : in STD_LOGIC_VECTOR (4 downto 0);
               SELECT_IN : in STD_LOGIC_VECTOR (2 downto 0);
               MUX_OUT : out STD_LOGIC_VECTOR (4 downto 0));
    end component multiplexer_8_1_4b;

begin

--  1's digit timer
    ff0: counter_decade port map (EN_IN => EN_IN,
                                  RESET_IN => RESET_IN,
                                  INCREMENT_IN => CLK1000HZ_IN,
                                  COUNT_OUT => mux_0,
                                  TICK_OUT => tick(0));
--  10's digit timer
    ff1: counter_decade port map (EN_IN => EN_IN,
                                  RESET_IN => RESET_IN,
                                  INCREMENT_IN => tick(0),
                                  COUNT_OUT => mux_1,
                                  TICK_OUT => tick(1));
--  100's digit timer
    ff2: counter_decade port map (EN_IN => EN_IN,
                                  RESET_IN => RESET_IN,
                                  INCREMENT_IN => tick(1),
                                  COUNT_OUT => mux_2,
                                  TICK_OUT => tick(2));
--  1,000's digit timer
    ff3: counter_decade port map (EN_IN => EN_IN,
                                  RESET_IN => RESET_IN,
                                  INCREMENT_IN => tick(2),
                                  COUNT_OUT => mux_3,
                                  TICK_OUT => tick(3));
--  10,000's digit timer
    ff4: counter_decade port map (EN_IN => EN_IN,
                                  RESET_IN => RESET_IN,
                                  INCREMENT_IN => tick(3),
                                  COUNT_OUT => mux_4,
                                  TICK_OUT => tick(4));
--  100,000's digit timer
    ff5: counter_decade port map (EN_IN => EN_IN,
                                  RESET_IN => RESET_IN,
                                  INCREMENT_IN => tick(4),
                                  COUNT_OUT => mux_5,
                                  TICK_OUT => tick(5));
--  1,000,000's digit timer
    ff6: counter_decade port map (EN_IN => EN_IN,
                                  RESET_IN => RESET_IN,
                                  INCREMENT_IN => tick(5),
                                  COUNT_OUT => mux_6,
                                  TICK_OUT => tick(6));
--  10,000,000's digit timer
    ff7: counter_decade port map (EN_IN => EN_IN,
                                  RESET_IN => RESET_IN,
                                  INCREMENT_IN => tick(6),
                                  COUNT_OUT => mux_7,
                                  TICK_OUT => tick(7));
--  Digit multiplexer
    ff8: multiplexer_8_1_4b port map (MUX_IN_0 => mux_0,
                                      MUX_IN_1 => mux_1,
                                      MUX_IN_2 => mux_2,
                                      MUX_IN_3 => mux_3,
                                      MUX_IN_4 => mux_4,
                                      MUX_IN_5 => mux_5,
                                      MUX_IN_6 => mux_6,
                                      MUX_IN_7 => mux_7,
                                      SELECT_IN => SELECT_IN,
                                      MUX_OUT => INT_OUT);
                                      
    BCD_BUS_OUT <= mux_7 & mux_6 & mux_5 & mux_4 & mux_3 & mux_2 & mux_1 & mux_0;

end Behavioral;
