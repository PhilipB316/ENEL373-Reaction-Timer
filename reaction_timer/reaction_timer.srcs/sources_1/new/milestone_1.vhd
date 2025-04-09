----------------------------------------------------------------------------------
-- Engineers: Boston Black, Philip Brand, Michael Brown
-- 
-- Last Modified Date: 10-03-2025
-- Design Name: p AIn_aND-SaDNeSS
-- Module Name: milestone_1 - Behavioral
-- Project Name: just no
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Define module IO
entity milestone_1 is
    Port ( CLK100MHZ : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (7 downto 0) := X"0000";
           AN : out STD_LOGIC_VECTOR (7 downto 0) := X"00";
           SEVEN_SEG : out STD_LOGIC_VECTOR (7 downto 0) := X"00";
           BTNC : in STD_LOGIC);
end milestone_1;

architecture Behavioral of milestone_1 is
--  Define local values

--  CLOCK SIGNALS AND DIVIDERS
    signal clk_100_mhz_switchable : std_logic := '0';
    signal clk_1000_hz : std_logic := '0';
    signal clk_1000_hz_divider_bound : std_logic_vector (27 downto 0) := X"00186A0";
    signal clk_1_hz_switchable : std_logic;
    signal clk_1_hz_divider_bound : std_logic_vector (27 downto 0) := X"5F5E100";
    signal clk_var_hz : std_logic;
    signal clk_var_hz_switchable : std_logic;
    signal clk_var_hz_divider_bound : std_logic_vector ( 27 downto 0) := X"5FFFFFF";

--  FINITE STATE MACHINE
    signal fsm_state : std_logic_vector (3 downto 0) := X"2";
    signal fsm_state_change_triggers : std_logic_vector (1 downto 0);
    signal fsm_state_dot_complete : std_logic := '0';
    signal dotiey_countdown_en : std_logic := '0';
    signal reaction_time_count_en : std_logic := '0';
    signal reaction_time_count_rset : std_logic := '1';

--  DISPLAY SELECTION
    signal output_segment_select : std_logic_vector (2 downto 0) := "000";
    signal encoded_display_input_select : std_logic_vector (2 downto 0) := "000";
    signal encoded_reaction_time_digit : std_logic_vector (3 downto 0) := X"0";
    signal encoded_segment_data : std_logic_vector (3 downto 0) := X"0";
    signal encoded_segment_data_overridden : std_logic_vector (3 downto 0) := X"0";
    signal encoded_display_placeholder : std_logic_vector (3 downto 0) := X"0";
    signal encoded_dots : std_logic_vector (3 downto 0) := X"0";
    signal encoded_display_dly_text_override : std_logic_vector (3 downto 0) := X"0";

    signal rand_num : std_logic_vector (7 downto 0);

--  COMPONENT INSTANTIATION
    component fsm is
        Port ( CLK_IN : in STD_LOGIC;
               TRIGGERS_IN : in STD_LOGIC_VECTOR (1 downto 0);
               CLK_VAR_HZ_IN: in STD_LOGIC;
               CLK_VAR_HZ_SWITCHABLE_OUT: out STD_LOGIC;
               REACTION_TIME_COUNT_EN_OUT: out STD_LOGIC;
               REACTION_TIME_COUNT_RSET_OUT: out STD_LOGIC;
               DOTIEY_COUNTDOWN_EN_OUT: out STD_LOGIC;
               ENCODED_DISPLAY_INPUT_SELECT_OUT: out STD_LOGIC_VECTOR (2 downto 0));
    end component;

    component clk_divider is
        Port ( CLK100MHZ_IN : in STD_LOGIC;
               UPPERBOUND_IN : in STD_LOGIC_VECTOR;
               SLOWCLK_OUT : out STD_LOGIC);
    end component;

    component timer_8_num_selectable is
        Port ( CLK1000HZ_IN : in STD_LOGIC;
               EN_IN : in STD_LOGIC;
               RESET_IN : in STD_LOGIC;
               SELECT_IN : in STD_LOGIC_VECTOR (2 downto 0);
               INT_OUT : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component multiplexer_8_1_4b is
        Port ( MUX_IN_0 : in STD_LOGIC_VECTOR (3 downto 0);
               MUX_IN_1 : in STD_LOGIC_VECTOR (3 downto 0);
               MUX_IN_2 : in STD_LOGIC_VECTOR (3 downto 0);
               MUX_IN_3 : in STD_LOGIC_VECTOR (3 downto 0);
               MUX_IN_4 : in STD_LOGIC_VECTOR (3 downto 0);
               MUX_IN_5 : in STD_LOGIC_VECTOR (3 downto 0);
               MUX_IN_6 : in STD_LOGIC_VECTOR (3 downto 0);
               MUX_IN_7 : in STD_LOGIC_VECTOR (3 downto 0);
               SELECT_IN : in STD_LOGIC_VECTOR (2 downto 0);
               MUX_OUT : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component segment_display is
        Port ( NUMBER_IN : in STD_LOGIC_VECTOR (3 downto 0);
               MUX_IN : in STD_LOGIC_VECTOR (2 downto 0); -- its the select pin which chooses the anode. system relies on MUX_IN and NUMBER_IN changing
               SEGMENT_LIGHT_OUT : out STD_LOGIC_VECTOR (7 downto 0);
               ANODE_OUT : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    component counter_3b is
        Port ( CLK_IN : in STD_LOGIC;
               COUNT_OUT : out STD_LOGIC_VECTOR (2 downto 0));
    end component;

    component dotiey is
        Port ( SELECT_IN : in STD_LOGIC_VECTOR (2 downto 0);
               CLK_IN : in STD_LOGIC;
               EN_IN : in STD_LOGIC;
               DOT_OUT : out STD_LOGIC_VECTOR (3 downto 0);
               TIMER_FINISHED : out STD_LOGIC);
    end component;
    
    component selectable_override is
        Port ( SEG_SELECT_IN : in STD_LOGIC_VECTOR (2 downto 0);
               TEXT_SELECT_IN : in STD_LOGIC_VECTOR (2 downto 0);
               SEG_IN : in STD_LOGIC_VECTOR (3 downto 0);
               SEG_OUT : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component random_number_generator is
        Port ( CLK_IN : in STD_LOGIC;
               RAND_OUT : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

begin

--  Finite State Machine
    ff0: fsm port map ( CLK_IN => clk_1000_hz,
                      TRIGGERS_IN => fsm_state_change_triggers,
                      CLK_VAR_HZ_IN => clk_var_hz,
                      CLK_VAR_HZ_SWITCHABLE_OUT => clk_var_hz_switchable,
                      REACTION_TIME_COUNT_EN_OUT => reaction_time_count_en,
                      REACTION_TIME_COUNT_RSET_OUT => reaction_time_count_rset,
                      DOTIEY_COUNTDOWN_EN_OUT => dotiey_countdown_en,
                      ENCODED_DISPLAY_INPUT_SELECT_OUT => encoded_display_input_select);

--  1000 HZ Clock Divider
    ff1: clk_divider port map ( CLK100MHZ_IN => CLK100MHZ,
                                SLOWCLK_OUT => clk_1000_hz,
                                UPPERBOUND_IN => clk_1000_hz_divider_bound);

--  1 HZ Switchable Clock Divider
    ff2: clk_divider port map(CLK100MHZ_IN => clk_100_mhz_switchable,
                              SLOWCLK_OUT => clk_1_hz_switchable,
                              UPPERBOUND_IN => clk_1_hz_divider_bound);
                              
--  3 bit counter for seven segment anode selection
    ff3: counter_3b port map(CLK_IN => clk_1000_hz,
                             COUNT_OUT => output_segment_select);                             
    
--  8 digit counter with output digit selection
    ff4: timer_8_num_selectable port map(CLK1000HZ_IN => clk_1000_hz,
                                         EN_IN => reaction_time_count_en,
                                         RESET_IN => reaction_time_count_rset,
                                         SELECT_IN => output_segment_select,
                                         INT_OUT => encoded_reaction_time_digit);

--  Dot countdown generator
    ff5: dotiey port map(SELECT_IN => output_segment_select,
                         CLK_IN => clk_var_hz_switchable,
                         EN_IN => dotiey_countdown_en,
                         DOT_OUT => encoded_dots,
                         TIMER_FINISHED => fsm_state_dot_complete);
                         
--  8x4 to 4 encoded display data mux
    ff6: multiplexer_8_1_4b port map (MUX_IN_0 => encoded_reaction_time_digit,
                                      MUX_IN_1 => encoded_display_placeholder,
                                      MUX_IN_2 => encoded_display_placeholder,
                                      MUX_IN_3 => encoded_display_placeholder,
                                      MUX_IN_4 => encoded_display_placeholder,
                                      MUX_IN_5 => encoded_display_placeholder,
                                      MUX_IN_6 => encoded_display_placeholder,
                                      MUX_IN_7 => encoded_dots,
                                      SELECT_IN => encoded_display_input_select,
                                      MUX_OUT => encoded_segment_data);
                                      
--  Display text override
    ff7: selectable_override port map (SEG_SELECT_IN => output_segment_select,
                                       TEXT_SELECT_IN => encoded_display_input_select,
                                       SEG_IN => encoded_segment_data,
                                       SEG_OUT => encoded_segment_data_overridden);

--  Seven segment display decoder
    ff8: segment_display port map(NUMBER_IN => encoded_segment_data_overridden,
                                  MUX_IN => output_segment_select,
                                  SEGMENT_LIGHT_OUT => SEVEN_SEG,
                                  ANODE_OUT => AN);
             
--  Generate next "random" number from the LFSR in random_number_generator
    ff9: random_number_generator port map (CLK_IN => clk_var_hz,
                                           RAND_OUT => rand_num);
    
-- Set the upperbound for the variable clk based on the random number  
    clk_var_hz_divider_bound(27 downto 24) <= rand_num(6 downto 3);

-- Generate another clk square wave to trigger a new random number
    ff10: clk_divider port map(CLK100MHZ_IN => CLK100MHZ,
                                SLOWCLK_OUT => clk_var_hz,
                                UPPERBOUND_IN => clk_var_hz_divider_bound);
                                        
                                        

--  Map FSM fsm_state_change_triggers
    fsm_state_change_triggers(0) <= BTNC;
    fsm_state_change_triggers(1) <= fsm_state_dot_complete;

    LED(7 downto 0) <= rand_num;

end Behavioral;
