----------------------------------------------------------------------------------
-- Engineers: Boston Black, Philip Brand, Michael Brown

-- Create Date: 03/06/2025 04:07:27 PM
-- Module Name: fsm - Behavioral
-- Project Name: Reaction Timer

-- Description: 
--  FSM for reaction timer
--  Takes state change triggers and outputs appropriate signals to system
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fsm is
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
end fsm;

architecture Behavioral of fsm is
    type states is (delay_countup,
                    delay_display,
                    dots_countdown,
                    display_max,
                    display_max,
                    display_min,
                    data_reset,
                    error,
                    converter_reset);
    signal current_state, next_state: states;

    signal current_triggers : std_logic_vector (5 downto 0) := (others => '0');
    signal last_triggers : std_logic_vector (5 downto 0) := (others => '0');
    signal clk_cycle_count : unsigned (1 downto 0) := (others => '0');
    signal buffer_write_trigger : std_logic := '0';
    signal alu_operation_select : std_logic_vector (1 downto 0) := "00";

begin

    current_triggers(0) <= BTNC_IN;
    current_triggers(1) <= DOTIEY_COMPLETE_IN;
    current_triggers(2) <= BTNR_IN;
    current_triggers(3) <= BTNL_IN;
    current_triggers(4) <= BTNU_IN;
    current_triggers(5) <= BTND_IN;

--  Finite state machine state outputs
    process(CLK_IN, CLK_VAR_HZ_IN) is
    begin
    if (falling_edge(CLK_IN)) then
        case current_state is

        when delay_countup =>
            REACTION_TIME_COUNT_EN_OUT <= '1';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "000";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
            BUFFER_WRITE_TRIGGER_OUT <= '0';
            if (current_triggers /= last_triggers) then
                last_triggers <= current_triggers;
                if (current_triggers(0) = '1') then -- if BTNC pressed
                    current_state <= delay_display; 
                    BUFFER_WRITE_TRIGGER_OUT <= '1';
                end if;
            end if;
        
            when delay_display =>
                REACTION_TIME_COUNT_EN_OUT <= '0';
                REACTION_TIME_COUNT_RSET_OUT <= '0';
                ENCODED_DISPLAY_INPUT_SELECT_OUT <= "000";
                DOTIEY_COUNTDOWN_EN_OUT <= '0';
                DOUBLE_DABBLE_RESET_OUT <= '1';
                ALU_OPERATION_SELECT_OUT <= "00";
    
                if (current_triggers /= last_triggers) then
                    last_triggers <= current_triggers;
                    if (current_triggers(0) = '1') then -- if BTNC pressed
                        current_state <= dots_countdown; 
                    elsif (current_triggers(2) = '1') then -- if BTNR pressed
                        next_state <= display_max; 
                        current_state <= converter_reset;
                    elsif (current_triggers(3) = '1') then -- if BTNL pressed
                        current_state <= data_reset; 
                        clk_cycle_count <= (others => '0');
                    elsif (current_triggers(4) = '1') then -- if BTNU pressed
                        next_state <= display_max; 
                        current_state <= converter_reset;
                    elsif (current_triggers(5) = '1') then -- if BTND pressed
                        next_state <= display_min; 
                        current_state <= converter_reset;
                    else
                        NULL;
                    end if;
                end if;
    
            when dots_countdown =>
                CLK_VAR_HZ_SWITCHABLE_OUT <= CLK_VAR_HZ_IN;
                REACTION_TIME_COUNT_EN_OUT <= '0';
                REACTION_TIME_COUNT_RSET_OUT <= '1';
                ENCODED_DISPLAY_INPUT_SELECT_OUT <= "111";
                DOTIEY_COUNTDOWN_EN_OUT <= '1';
                
                if (current_triggers /= last_triggers) then
                    last_triggers <= current_triggers;
                    if (current_triggers(0) = '1') then -- if BTNC pressed
                        current_state <= error;
                    elsif (current_triggers(1) = '1') then -- if dotiey completion
                        current_state <= delay_countup;
                    end if;
                end if;
    
            when display_max =>
                REACTION_TIME_COUNT_EN_OUT <= '0';
                REACTION_TIME_COUNT_RSET_OUT <= '0';
                ENCODED_DISPLAY_INPUT_SELECT_OUT <= "011";
                DOTIEY_COUNTDOWN_EN_OUT <= '0';
                DOUBLE_DABBLE_RESET_OUT <= '0';
                ALU_OPERATION_SELECT_OUT <= "11";
    
                if (current_triggers /= last_triggers) then
                    last_triggers <= current_triggers;
                    if (current_triggers(0) = '1') then -- if BTNC pressed
                        next_state <= delay_display;
                    elsif (current_triggers(2) = '1') then -- if BTNR pressed
                        next_state <= display_max;
                    elsif (current_triggers(3) = '1') then -- if BTNL pressed
                        next_state <= data_reset; 
                        clk_cycle_count <= (others => '0');
                    elsif (current_triggers(4) = '1') then -- if BTNU pressed
                        next_state <= display_max;
                    elsif (current_triggers(5) = '1') then -- if BTND pressed
                        next_state <= display_min;
                    end if;
                current_state <= converter_reset;
                end if;
        
            when display_max =>
                REACTION_TIME_COUNT_EN_OUT <= '0';
                REACTION_TIME_COUNT_RSET_OUT <= '0';
                ENCODED_DISPLAY_INPUT_SELECT_OUT <= "001";
                DOTIEY_COUNTDOWN_EN_OUT <= '0';
                DOUBLE_DABBLE_RESET_OUT <= '0';
                ALU_OPERATION_SELECT_OUT <= "01";
            
                if (current_triggers /= last_triggers) then
                    last_triggers <= current_triggers;
                    if (current_triggers(0) = '1') then -- if BTNC pressed
                        next_state <= delay_display;
                    elsif (current_triggers(2) = '1') then -- if BTNR pressed
                        next_state <= display_max;
                    elsif (current_triggers(3) = '1') then -- if BTNL pressed
                        next_state <= data_reset; 
                        clk_cycle_count <= (others => '0');
                    elsif (current_triggers(4) = '1') then -- if BTNU pressed
                        next_state <= display_max;
                    elsif (current_triggers(5) = '1') then -- if BTND pressed
                        next_state <= display_min;
                    end if;
                    current_state <= converter_reset;
                end if;
                
            when display_min =>
                REACTION_TIME_COUNT_EN_OUT <= '0';
                REACTION_TIME_COUNT_RSET_OUT <= '0';
                ENCODED_DISPLAY_INPUT_SELECT_OUT <= "010";
                DOTIEY_COUNTDOWN_EN_OUT <= '0';
                DOUBLE_DABBLE_RESET_OUT <= '0';
                ALU_OPERATION_SELECT_OUT <= "10";
    
                if (current_triggers /= last_triggers) then
                    last_triggers <= current_triggers;
                    if (current_triggers(0) = '1') then -- if BTNC pressed
                        next_state <= delay_display;
                    elsif (current_triggers(2) = '1') then -- if BTNR pressed
                        next_state <= display_max;
                    elsif (current_triggers(3) = '1') then -- if BTNL pressed
                        next_state <= data_reset; 
                        clk_cycle_count <= (others => '0');
                    elsif (current_triggers(4) = '1') then -- if BTNU pressed
                        next_state <= display_max;
                    elsif (current_triggers(5) = '1') then -- if BTND pressed
                        next_state <= display_min;
                    end if;
                    current_state <= converter_reset;
                end if;
        
            when data_reset =>
                REACTION_TIME_COUNT_EN_OUT <= '0';
                REACTION_TIME_COUNT_RSET_OUT <= '1';
                ENCODED_DISPLAY_INPUT_SELECT_OUT <= "000";
                DOTIEY_COUNTDOWN_EN_OUT <= '0';
                clk_cycle_count <= clk_cycle_count + 1;
                RESET_OUT <= '1';
                if (clk_cycle_count = "11") then
                clk_cycle_count <= "00";
                RESET_OUT <= '0';
                current_state <= delay_display;
                end if;
    
            when error =>
                REACTION_TIME_COUNT_EN_OUT <= '0';
                REACTION_TIME_COUNT_RSET_OUT <= '0';
                ENCODED_DISPLAY_INPUT_SELECT_OUT <= "100";
                DOTIEY_COUNTDOWN_EN_OUT <= '0';
    
                if (current_triggers /= last_triggers) then
                    last_triggers <= current_triggers;
                    if (current_triggers(0) = '1') then -- if BTNC pressed
                        current_state <= dots_countdown;
                    end if;
                end if;
            
            when converter_reset =>
                REACTION_TIME_COUNT_EN_OUT <= '0';
                REACTION_TIME_COUNT_RSET_OUT <= '0';
                DOTIEY_COUNTDOWN_EN_OUT <= '0';
                DOUBLE_DABBLE_RESET_OUT <= '1';
                current_state <= next_state;
             end case;
        end if;
    end process;

end Behavioral;

