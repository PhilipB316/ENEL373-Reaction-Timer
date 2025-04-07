----------------------------------------------------------------------------------
-- Engineers: Boston Black, Philip Brand, Michael Brown
-- 
-- Last Modified Date: 10-03-2025
-- Design Name: p AIn_aND-SaDNeSS
-- Module Name: main - Behavioral
-- Project Name: just no
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Define module IO
entity main is
    Port ( CLK100MHZ : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (15 downto 0) := X"0000";
           AN : out STD_LOGIC_VECTOR (7 downto 0) := X"00";
           SEVEN_SEG : out STD_LOGIC_VECTOR (7 downto 0) := X"00";
           SW : in STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC);
end main;

architecture Behavioral of main is
--  Define local values

--  CLOCK SIGNALS AND DIVIDERS
    signal clk_100_mhz_switchable : std_logic := '0';
    signal clk_1000_hz : std_logic := '0';
    signal clk_1000_hz_divider_bound : std_logic_vector (27 downto 0) := X"00186A0";
    signal clk_1_hz_switchable : std_logic;
    signal clk_1_hz_divider_bound : std_logic_vector (27 downto 0) := X"5F5E100";
    signal clk_var_hz : std_logic;
    signal clk_var_hz_switchable : std_logic;
    signal clk_var_hz_divider_bound : std_logic_vector ( 27 downto 0) := X"5F5E100";
    
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
    signal encoded_display_placeholder_1 : std_logic_vector (3 downto 0) := X"0";
    signal encoded_display_placeholder_2 : std_logic_vector (3 downto 0) := X"0";
    signal encoded_display_placeholder_3 : std_logic_vector (3 downto 0) := X"0";
    signal encoded_display_placeholder_4 : std_logic_vector (3 downto 0) := X"0";
    signal encoded_display_placeholder_5 : std_logic_vector (3 downto 0) := X"0";
    signal encoded_dots : std_logic_vector (3 downto 0) := X"0";
    signal encoded_display_dly_text_override : std_logic_vector (3 downto 0) := X"0";
    
    signal rand_num : std_logic_vector (7 downto 0);
    
--  COMPONENT INSTANTIATION
    component fsm is
        port(CLK_IN : in STD_LOGIC;
             STATE_OUT : out STD_LOGIC_VECTOR (3 downto 0);
             TRIGGERS_IN : in STD_LOGIC_VECTOR (1 downto 0));
    end component;
    
    component clk_divider is
        port(CLK100MHZ_IN : in STD_LOGIC;
             UPPERBOUND_IN : in STD_LOGIC_VECTOR;
             SLOWCLK_OUT : out STD_LOGIC); 
    end component;
    
    component timer_8_num_selectable is
        port(CLK1000HZ_IN : in STD_LOGIC;
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
        Port(NUMBER_IN : in STD_LOGIC_VECTOR (3 downto 0); 
             MUX_IN : in STD_LOGIC_VECTOR (2 downto 0); -- its the select pin which chooses the anode. system relies on MUX_IN and NUMBER_IN changing
             SEGMENT_LIGHT_OUT : out STD_LOGIC_VECTOR (7 downto 0);
             ANODE_OUT : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component counter_3b is
        Port(CLK_IN : in STD_LOGIC;
             COUNT_OUT : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component dotiey is
        Port(SELECT_IN : in STD_LOGIC_VECTOR (2 downto 0);
             CLK_IN : in STD_LOGIC;
             EN_IN : in STD_LOGIC;
             DOT_OUT : out STD_LOGIC_VECTOR (3 downto 0);
             TIMER_FINISHED : out STD_LOGIC);
    end component;
    
    component text_segment_override is
        Port ( SELECT_IN : in STD_LOGIC_VECTOR (2 downto 0);
               ENCODED_SEG_IN : in STD_LOGIC_VECTOR (3 downto 0);
               ENCODED_SEG_OUT : out STD_LOGIC_VECTOR (3 downto 0);
               OVERRIDE_TEXT_IN : in STD_LOGIC_VECTOR (11 downto 0));
    end component;
    
    component random_number_generator is
        PORT(CLK_IN : in STD_LOGIC;
             RAND_OUT : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
begin    
    
--  Finite State Machine
    ff0: fsm port map(CLK_IN => clk_1000_hz,
                      STATE_OUT => fsm_state,
                      TRIGGERS_IN => fsm_state_change_triggers);
    
--  1000 HZ Clock Divider
    ff1: clk_divider port map(CLK100MHZ_IN => CLK100MHZ,
                              SLOWCLK_OUT => clk_1000_hz,
                              UPPERBOUND_IN => clk_1000_hz_divider_bound);

--  1 HZ Switchable Clock Divider
    ff2: clk_divider port map(CLK100MHZ_IN => clk_100_mhz_switchable,
                              SLOWCLK_OUT => clk_1_hz_switchable,
                              UPPERBOUND_IN => clk_1_hz_divider_bound);
    
--  8 digit counter with output digit selection
    ff3: timer_8_num_selectable port map(CLK1000HZ_IN => clk_1000_hz,
                                         EN_IN => reaction_time_count_en,
                                         RESET_IN => reaction_time_count_rset,
                                         SELECT_IN => output_segment_select,
                                         INT_OUT => encoded_reaction_time_digit);

--  8x4 to 4 encoded display data mux
    ff4: multiplexer_8_1_4b port map (MUX_IN_0 => encoded_reaction_time_digit,
                                      MUX_IN_1 => encoded_display_placeholder_1,
                                      MUX_IN_2 => encoded_display_placeholder_2,
                                      MUX_IN_3 => encoded_display_placeholder_3,
                                      MUX_IN_4 => encoded_display_placeholder_4,
                                      MUX_IN_5 => encoded_display_placeholder_5,
                                      MUX_IN_6 => encoded_dots,
                                      MUX_IN_7 => encoded_display_dly_text_override,
                                      SELECT_IN => encoded_display_input_select,
                                      MUX_OUT => encoded_segment_data);

--  3 bit counter for seven segment anode selection
    ff5: counter_3b port map(CLK_IN => clk_1000_hz,
                             COUNT_OUT => output_segment_select);

--  Seven segment display decoder
    ff6: segment_display port map(NUMBER_IN => encoded_segment_data,
                                  MUX_IN => output_segment_select,
                                  SEGMENT_LIGHT_OUT => SEVEN_SEG,
                                  ANODE_OUT => AN);

--  Dot countdown generator
    ff7: dotiey port map(SELECT_IN => output_segment_select,
                         CLK_IN => clk_var_hz_switchable,
                         EN_IN => dotiey_countdown_en,
                         DOT_OUT => encoded_dots,
                         TIMER_FINISHED => fsm_state_dot_complete);
    
--  DLY seven segment text override
    ff8: text_segment_override port map(SELECT_IN => output_segment_select,
                                        ENCODED_SEG_IN => encoded_reaction_time_digit,
                                        ENCODED_SEG_OUT => encoded_display_dly_text_override,
                                        OVERRIDE_TEXT_IN => "101111001101");
                                        
-- Generate next "random" number from the LFSR in random_number_generator
    ff9: random_number_generator port map (CLK_IN => clk_var_hz,
                                           RAND_OUT => rand_num);
    
-- Set the upperbound for the variable clk based on the random number  
    clk_var_hz_divider_bound(27 downto 20) <= rand_num;
                              
-- Generate another clk square wave to trigger a new random number
    ff2_2: clk_divider port map(CLK100MHZ_IN => CLK100MHZ,
                                SLOWCLK_OUT => clk_var_hz,
                                UPPERBOUND_IN => clk_var_hz_divider_bound);
                                        
                                        
--  Finite state machine state outputs
    process(fsm_state)
    begin
--      Counting
        if fsm_state = X"0" then
            reaction_time_count_en <= '1';
            reaction_time_count_rset <= '0';
            encoded_display_input_select <= "000";
            dotiey_countdown_en <= '0';
        end if;
       
--      Display time 
        if fsm_state = X"1" then
            reaction_time_count_en <= '0';
            reaction_time_count_rset <= '0';
            encoded_display_input_select <= "111";
            dotiey_countdown_en <= '0';
        end if;
        
--      Dots
        if fsm_state = X"2" then
            clk_var_hz_switchable <= clk_var_hz;
            reaction_time_count_en <= '0';
            reaction_time_count_rset <= '1';
            encoded_display_input_select <= "110";
            dotiey_countdown_en <= '1';
        end if;
        
    end process;
    
--  Map FSM fsm_state_change_triggers
    fsm_state_change_triggers(0) <= BTNC;
    fsm_state_change_triggers(1) <= fsm_state_dot_complete;
    
    LED(7 downto 0) <= rand_num;
    
end Behavioral;
