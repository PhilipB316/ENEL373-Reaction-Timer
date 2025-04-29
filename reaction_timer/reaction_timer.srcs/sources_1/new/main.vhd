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
    Port (  CLK100MHZ : in STD_LOGIC;
            LED : out STD_LOGIC_VECTOR (15 downto 0) := X"0000";
            AN : out STD_LOGIC_VECTOR (7 downto 0) := X"00";
            SEVEN_SEG : out STD_LOGIC_VECTOR (7 downto 0) := X"00";
            BTNC : in STD_LOGIC;
            BTNR : in STD_LOGIC;
            BTNL : in STD_LOGIC;
            BTNU : in STD_LOGIC;
            BTND : in STD_LOGIC);  
end main;

architecture Behavioral of main is
--  Define local values

--  CLOCK SIGNALS AND DIVIDERS
    signal clk_100_mhz_switchable : std_logic := '0';
    signal clk_1000_hz : std_logic := '0';
    signal clk_1000_hz_divider_bound : std_logic_vector (27 downto 0) := X"00186A0";
    signal clk_10_khz : std_logic := '0';
    signal clk_10_khz_divider_bound : std_logic_vector (27 downto 0) := X"0002710";
    signal clk_1_hz_switchable : std_logic;
    signal clk_1_hz_divider_bound : std_logic_vector (27 downto 0) := X"5F5E100";
    signal clk_var_hz : std_logic;
    signal clk_var_hz_switchable : std_logic;
    signal clk_var_hz_divider_bound : std_logic_vector ( 27 downto 0) := X"5F5E100";

--  FINITE STATE MACHINE
    signal fsm_state : std_logic_vector (3 downto 0) := X"2";
    signal fsm_state_change_triggers : std_logic_vector (5 downto 0);
    signal fsm_state_dot_complete : std_logic := '0';
    signal dotiey_countdown_en : std_logic := '0';
    signal reaction_time_count_en : std_logic := '0';
    signal reaction_time_count_rset : std_logic := '1';

--  DISPLAY SELECTION
    signal output_segment_select : std_logic_vector (2 downto 0) := "000";
    signal encoded_display_input_select : std_logic_vector (2 downto 0) := "000";
    signal encoded_reaction_time_digit : std_logic_vector (4 downto 0) := "00000";
    signal encoded_segment_data : std_logic_vector (4 downto 0) := "00000";
    signal encoded_segment_data_overridden : std_logic_vector (4 downto 0) := "00000";
    signal encoded_display_placeholder : std_logic_vector (4 downto 0) := "01010";
    signal encoded_dots : std_logic_vector (4 downto 0) := "00000";
    signal encoded_display_dly_text_override : std_logic_vector (4 downto 0) := "00000";
    signal encoded_error_text : std_logic_vector (4 downto 0) := "00000";

    signal rand_num : std_logic_vector (7 downto 0);
    
--  ALU & CIRCULAR BUFFER
    signal timer_bcd_bus : std_logic_vector (39 downto 0) := X"0000000000";
    signal timer_binary : std_logic_vector (27 downto 0) := X"0000000";
    signal alu_binary : std_logic_vector (27 downto 0) := X"0000000";
    signal alu_bcd_bus : std_logic_vector (39 downto 0) := X"0000000000";
    signal alu_operation_select : std_logic_vector (1 downto 0) := "00";
    signal alu_num_1, alu_num_2, alu_num_3 : std_logic_vector (27 downto 0) := X"0000000";
    signal circ_buff_size : std_logic_vector (1 downto 0) := "00";
    signal circ_buff_rset : std_logic := '0';
    signal circ_buff_write : std_logic := '0';
    signal max_alu_bcd_result : std_logic_vector (27 downto 0) := X"0000000";
    signal min_alu_bcd_result : std_logic_vector (27 downto 0) := X"0000000";
    signal avg_alu_bcd_result : std_logic_vector (27 downto 0) := X"0000000";
    signal selected_alu_bcd_digit : std_logic_vector (4 downto 0) := "00000";
    signal double_dabble_reset : std_logic;

--  BUTTONS
    signal BTNC_debounced : std_logic := '0';
    signal BTNR_debounced : std_logic := '0';
    signal BTNL_debounced : std_logic := '0';
    signal BTNU_debounced : std_logic := '0';
    signal BTND_debounced : std_logic := '0';
    

--  COMPONENT INSTANTIATION
    component fsm is
        Port (
            -- INPUTS
               CLK_IN : in STD_LOGIC;
               BTNC_IN : in STD_LOGIC;
               BTNR_IN : in STD_LOGIC;
               BTNL_IN : in STD_LOGIC;
               BTNU_IN : in STD_LOGIC;
               BTND_IN : in STD_LOGIC;
               DOTIEY_COMPLETE_IN : in STD_LOGIC;
               CLK_VAR_HZ_IN: in STD_LOGIC;
            --  OUTPUTS
               CLK_VAR_HZ_SWITCHABLE_OUT: out STD_LOGIC;
               REACTION_TIME_COUNT_EN_OUT: out STD_LOGIC;
               REACTION_TIME_COUNT_RSET_OUT: out STD_LOGIC;
               DOTIEY_COUNTDOWN_EN_OUT: out STD_LOGIC;
               ENCODED_DISPLAY_INPUT_SELECT_OUT: out STD_LOGIC_VECTOR (2 downto 0);
               DOUBLE_DABBLE_RESET_OUT: out STD_LOGIC;  
               RESET_OUT: out STD_LOGIC;
               ALU_OPERATION_SELECT_OUT : out STD_LOGIC_VECTOR (1 downto 0);
               BUFFER_WRITE_TRIGGER_OUT : out STD_LOGIC);
    end component fsm;

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
               BCD_BUS_OUT : out STD_LOGIC_VECTOR (39 downto 0);
               INT_OUT : out STD_LOGIC_VECTOR (4 downto 0));
    end component;

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
    end component;

    component segment_display is
        Port ( NUMBER_IN : in STD_LOGIC_VECTOR (4 downto 0);
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
               DOT_OUT : out STD_LOGIC_VECTOR (4 downto 0);
               TIMER_FINISHED : out STD_LOGIC);
    end component;
    
    component selectable_override is
        Port ( SEG_SELECT_IN : in STD_LOGIC_VECTOR (2 downto 0);
               TEXT_SELECT_IN : in STD_LOGIC_VECTOR (2 downto 0);
               SEG_IN : in STD_LOGIC_VECTOR (4 downto 0);
               SEG_OUT : out STD_LOGIC_VECTOR (4 downto 0));
    end component;

    component lfsr is
        Port ( CLK_IN : in STD_LOGIC;
               RAND_OUT : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component bcd_8_to_binary is
        Port ( BCD_BUS_IN : in STD_LOGIC_VECTOR (39 downto 0);
               BINARY_OUT : out STD_LOGIC_VECTOR (27 downto 0));
    end component bcd_8_to_binary;
        
    component circular_buffer is
        Port ( NUMBER_IN : in STD_LOGIC_VECTOR (27 downto 0);
               NUMBER_1_OUT, NUMBER_2_OUT, NUMBER_3_OUT : out STD_LOGIC_VECTOR (27 downto 0);
               BUFFER_SIZE_OUT : out STD_LOGIC_VECTOR (1 downto 0);
               RESET_IN, WRITE_TRIGGER_IN : in STD_LOGIC);
    end component circular_buffer;
    
    component alu is
        Port ( NUM_1_IN, NUM_2_IN, NUM_3_IN : in STD_LOGIC_VECTOR (27 downto 0);
               BUFFER_SIZE_IN, OPERATION_SELECT_IN : in STD_LOGIC_VECTOR (1 downto 0);
               OUTPUT_OUT : out STD_LOGIC_VECTOR (27 downto 0));
    end component alu;
    
    component binary_to_bcd_8 is
        Port ( CLK_IN : IN  STD_LOGIC;
               RESET_IN : IN  STD_LOGIC;
               BINARY_IN : IN  STD_LOGIC_VECTOR (27 downto 0);
               BCD_8_DIGIT_OUT : OUT STD_LOGIC_VECTOR (39 downto 0));
    end component binary_to_bcd_8;

    component debouncer is
        Port ( BUTTON_IN : in STD_LOGIC;
               CLK_IN : in STD_LOGIC;
               DEBOUNCED_OUT : out STD_LOGIC);
    end component debouncer;

begin

--  Finite State Machine
    ff0: fsm port map ( CLK_IN => clk_10_khz,
                        BTNC_IN => BTNC_debounced,
                        BTNR_IN => BTNR_debounced,
                        BTNL_IN => BTNL_debounced,
                        BTNU_IN => BTNU_debounced,
                        BTND_IN => BTND_debounced,
                        DOTIEY_COMPLETE_IN => fsm_state_dot_complete,
                        CLK_VAR_HZ_IN => clk_var_hz,
                        CLK_VAR_HZ_SWITCHABLE_OUT => clk_var_hz_switchable,
                        REACTION_TIME_COUNT_EN_OUT => reaction_time_count_en,
                        REACTION_TIME_COUNT_RSET_OUT => reaction_time_count_rset,
                        DOTIEY_COUNTDOWN_EN_OUT => dotiey_countdown_en,
                        ENCODED_DISPLAY_INPUT_SELECT_OUT => encoded_display_input_select,
                        DOUBLE_DABBLE_RESET_OUT => double_dabble_reset,
                        RESET_OUT => circ_buff_rset,
                        ALU_OPERATION_SELECT_OUT => alu_operation_select,
                        BUFFER_WRITE_TRIGGER_OUT => circ_buff_write);

--  1000 HZ Clock Divider
    ff1: clk_divider port map ( CLK100MHZ_IN => CLK100MHZ,
                                SLOWCLK_OUT => clk_1000_hz,
                                UPPERBOUND_IN => clk_1000_hz_divider_bound);

--  1 HZ Switchable Clock Divider
    ff2: clk_divider port map(CLK100MHZ_IN => clk_100_mhz_switchable,
                              SLOWCLK_OUT => clk_1_hz_switchable,
                              UPPERBOUND_IN => clk_1_hz_divider_bound);

--  10 KHz Clock Divider
    ff2a: clk_divider port map(CLK100MHZ_IN => CLK100MHZ,
                              SLOWCLK_OUT => clk_10_khz,
                              UPPERBOUND_IN => clk_10_khz_divider_bound);
                              
--  3 bit counter for seven segment anode selection
    ff3: counter_3b port map(CLK_IN => clk_1000_hz,
                             COUNT_OUT => output_segment_select);                             
    
--  8 digit counter with output digit selection
    ff4: timer_8_num_selectable port map(CLK1000HZ_IN => clk_1000_hz,
                                         EN_IN => reaction_time_count_en,
                                         RESET_IN => reaction_time_count_rset,
                                         SELECT_IN => output_segment_select,
                                         BCD_BUS_OUT => timer_bcd_bus,
                                         INT_OUT => encoded_reaction_time_digit);
     
--  BCD bus to binary converter                                    
    ff5: bcd_8_to_binary port map(BCD_BUS_IN => timer_bcd_bus,
                                  BINARY_OUT => timer_binary);
                                  
--  Circular buffer previous times
    ff6: circular_buffer port map(NUMBER_IN => timer_binary,
                                  NUMBER_1_OUT => alu_num_1,
                                  NUMBER_2_OUT => alu_num_2,
                                  NUMBER_3_OUT => alu_num_3,
                                  BUFFER_SIZE_OUT => circ_buff_size,
                                  RESET_IN => circ_buff_rset,
                                  WRITE_TRIGGER_IN => circ_buff_write);
                                  
--  ALU
    ff7: alu port map(NUM_1_IN => alu_num_1,
                      NUM_2_in => alu_num_2,
                      NUM_3_in => alu_num_3,
                      BUFFER_SIZE_IN => circ_buff_size,
                      OPERATION_SELECT_IN => alu_operation_select,
                      OUTPUT_OUT => alu_binary);
                      
--  Dot countdown generator
    ff9: dotiey port map(SELECT_IN => output_segment_select,
                         CLK_IN => clk_var_hz_switchable,
                         EN_IN => dotiey_countdown_en,
                         DOT_OUT => encoded_dots,
                         TIMER_FINISHED => fsm_state_dot_complete);
         
--  Error text mux                
    ff10: multiplexer_8_1_4b port map (MUX_IN_0 => "10111", -- R
                                       MUX_IN_1 => "10011", -- O
                                       MUX_IN_2 => "10111", -- R
                                       MUX_IN_3 => "10111", -- R
                                       MUX_IN_4 => "10101", -- E
                                       MUX_IN_5 => encoded_display_placeholder, --
                                       MUX_IN_6 => encoded_display_placeholder, --
                                       MUX_IN_7 => encoded_display_placeholder, --
                                       SELECT_IN => output_segment_select,
                                       MUX_OUT => encoded_error_text); 
                         
--  8x4 to 4 encoded display data mux
    ff11: multiplexer_8_1_4b port map (MUX_IN_0 => encoded_reaction_time_digit,     -- Counter
                                       MUX_IN_1 => selected_alu_bcd_digit,           -- ALU ?
                                       MUX_IN_2 => selected_alu_bcd_digit,           -- ALU ?
                                       MUX_IN_3 => selected_alu_bcd_digit,           -- ALU ?
                                       MUX_IN_4 => encoded_error_text,               -- Error
                                       MUX_IN_5 => encoded_display_placeholder,
                                       MUX_IN_6 => encoded_display_placeholder,
                                       MUX_IN_7 => encoded_dots,
                                       SELECT_IN => encoded_display_input_select,
                                       MUX_OUT => encoded_segment_data);
                                      
--  Display text override
    ff12: selectable_override port map (SEG_SELECT_IN => output_segment_select,
                                       TEXT_SELECT_IN => encoded_display_input_select,
                                       SEG_IN => encoded_segment_data,
                                       SEG_OUT => encoded_segment_data_overridden);

--  Seven segment display decoder
    ff13: segment_display port map(NUMBER_IN => encoded_segment_data_overridden,
                                  MUX_IN => output_segment_select,
                                  SEGMENT_LIGHT_OUT => SEVEN_SEG,
                                  ANODE_OUT => AN);
             
--  Generate next "random" number from the LFSR in lfsr
    ff14: lfsr port map (CLK_IN => clk_var_hz,
                                           RAND_OUT => clk_var_hz_divider_bound(27 downto 20));

-- Generate another clk square wave to trigger a new random number
    ff15: clk_divider port map(CLK100MHZ_IN => CLK100MHZ,
                                SLOWCLK_OUT => clk_var_hz,
                                UPPERBOUND_IN => clk_var_hz_divider_bound);
    
--  Converts binary ALU result to BCD for display
    ff16: binary_to_bcd_8 port map ( CLK_IN => CLK100MHZ,
                                    RESET_IN => double_dabble_reset,
                                    BINARY_IN => alu_binary,
                                    BCD_8_DIGIT_OUT => alu_bcd_bus);

--  Selects BCD digit from the ALU to display on current anode
    ff17: multiplexer_8_1_4b port map (MUX_IN_0 => alu_bcd_bus(4 downto 0),
                                       MUX_IN_1 => alu_bcd_bus(9 downto 5),
                                       MUX_IN_2 => alu_bcd_bus(14 downto 10),
                                       MUX_IN_3 => alu_bcd_bus(19 downto 15),
                                       MUX_IN_4 => alu_bcd_bus(24 downto 20),
                                       MUX_IN_5 => alu_bcd_bus(29 downto 25),
                                       MUX_IN_6 => alu_bcd_bus(34 downto 30),
                                       MUX_IN_7 => alu_bcd_bus(39 downto 35),
                                       SELECT_IN => output_segment_select,
                                       MUX_OUT => selected_alu_bcd_digit);

--  Map the buttons to the debouncer component
    ff18: debouncer port map (BUTTON_IN => BTNC,
                              CLK_IN => CLK100MHZ,
                              DEBOUNCED_OUT => BTNC_debounced);
                              
    ff19: debouncer port map (BUTTON_IN => BTNR,
                              CLK_IN => CLK100MHZ,
                              DEBOUNCED_OUT => BTNR_debounced);
                              
    ff20: debouncer port map (BUTTON_IN => BTNL,
                              CLK_IN => CLK100MHZ,
                              DEBOUNCED_OUT => BTNL_debounced);
                              
    ff21: debouncer port map (BUTTON_IN => BTNU,
                              CLK_IN => CLK100MHZ,
                              DEBOUNCED_OUT => BTNU_debounced);
                              
    ff22: debouncer port map (BUTTON_IN => BTND,
                              CLK_IN => CLK100MHZ,
                              DEBOUNCED_OUT => BTND_debounced);
    
end Behavioral;
