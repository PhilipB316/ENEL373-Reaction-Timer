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
    Port ( -- INPUTS
           CLK_IN : in STD_LOGIC;
           TRIGGERS_IN : in STD_LOGIC_VECTOR (5 downto 0);
           CLK_VAR_HZ_IN: in STD_LOGIC;
        --  OUTPUTS
           CLK_VAR_HZ_SWITCHABLE_OUT: out STD_LOGIC;
           REACTION_TIME_COUNT_EN_OUT: out STD_LOGIC;
           REACTION_TIME_COUNT_RSET_OUT: out STD_LOGIC;
           DOTIEY_COUNTDOWN_EN_OUT: out STD_LOGIC;
           ENCODED_DISPLAY_INPUT_SELECT_OUT: out STD_LOGIC_VECTOR (2 downto 0);
           DOUBLE_DABBLE_RESET_OUT: out STD_LOGIC;  
           RESET_OUT: out STD_LOGIC;
           TEMP_OUT : out STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
           ALU_OPERATION_SELECT_OUT : out STD_LOGIC_VECTOR (1 downto 0);
           BUFFER_WRITE_TRIGGER_OUT : out STD_LOGIC);
end fsm;

architecture Behavioral of fsm is

    signal current_state : std_logic_vector (3 downto 0) := "0000";
    signal next_state : std_logic_vector (3 downto 0) := "0000";
    signal last_triggers : std_logic_vector (5 downto 0) := (others => '0');
    signal clk_cycle_count : unsigned (1 downto 0) := (others => '0');
    signal buffer_write_trigger : std_logic := '0';
    signal alu_operation_select : std_logic_vector (1 downto 0) := "00";

    signal counting_state : std_logic_vector (3 downto 0) := X"0";
    signal display_time_state : std_logic_vector (3 downto 0) := X"1";
    signal dotiey_state : std_logic_vector (3 downto 0) := X"2";
    signal avg_state : std_logic_vector (3 downto 0) := X"3";
    signal max_state : std_logic_vector (3 downto 0) := X"4";
    signal min_state : std_logic_vector (3 downto 0) := X"5";
    signal reset_state : std_logic_vector (3 downto 0) := X"6";
    signal error_state : std_logic_vector (3 downto 0) := X"7";
    signal binary_to_bcd_reset_state : std_logic_vector (3 downto 0) := X"8";

begin

--  Triggers
--  TRIGGERS_IN(0) <= BTNC
--  TRIGGERS_IN(1) <= Dotty Completion
--  TRIGGERS_IN(2) <= BTNR - avg
--  TRIGGERS_IN(3) <= BTNL - clr
--  TRIGGERS_IN(4) <= BTNU - max
--  TRIGGERS_IN(5) <= BTND - min

    --  Finite state machine state outputs
    process(CLK_IN, CLK_VAR_HZ_IN) is
    begin
    if (falling_edge(CLK_IN)) then
--      Counting
        if (current_state = counting_state) then
            REACTION_TIME_COUNT_EN_OUT <= '1';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "000";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
            BUFFER_WRITE_TRIGGER_OUT <= '0';
            if (TRIGGERS_IN /= last_triggers) then
                last_triggers <= TRIGGERS_IN;
                if (TRIGGERS_IN(0) = '1') then -- if BTNC pressed
                    current_state <= display_time_state; 
                    BUFFER_WRITE_TRIGGER_OUT <= '1';
                end if;
            end if;
        
--      Display time
        elsif (current_state = display_time_state) then
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "000";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
            DOUBLE_DABBLE_RESET_OUT <= '1';
            ALU_OPERATION_SELECT_OUT <= "00";

            if (TRIGGERS_IN /= last_triggers) then
                last_triggers <= TRIGGERS_IN;
                if (TRIGGERS_IN(0) = '1') then -- if BTNC pressed
                    current_state <= dotiey_state; 
                elsif (TRIGGERS_IN(2) = '1') then -- if BTNR pressed
                    next_state <= avg_state; 
                    current_state <= binary_to_bcd_reset_state;
                elsif (TRIGGERS_IN(3) = '1') then -- if BTNL pressed
                    current_state <= reset_state; 
                    clk_cycle_count <= (others => '0');
                elsif (TRIGGERS_IN(4) = '1') then -- if BTNU pressed
                    next_state <= max_state; 
                    current_state <= binary_to_bcd_reset_state;
                elsif (TRIGGERS_IN(5) = '1') then -- if BTND pressed
                    next_state <= min_state; 
                    current_state <= binary_to_bcd_reset_state;
                else
                    NULL;
                end if;
            end if;

--      Dots
        elsif (current_state = dotiey_state) then
            CLK_VAR_HZ_SWITCHABLE_OUT <= CLK_VAR_HZ_IN;
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '1';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "111";
            DOTIEY_COUNTDOWN_EN_OUT <= '1';
            
            if (TRIGGERS_IN /= last_triggers) then
                last_triggers <= TRIGGERS_IN;
                if (TRIGGERS_IN(0) = '1') then -- if BTNC pressed
                    current_state <= error_state;
                elsif (TRIGGERS_IN(1) = '1') then -- if dotiey completion
                    current_state <= counting_state;
                end if;
            end if;

--      Average time
        elsif (current_state = avg_state) then
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "011";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
            DOUBLE_DABBLE_RESET_OUT <= '0';
            ALU_OPERATION_SELECT_OUT <= "11";

            if (TRIGGERS_IN /= last_triggers) then
                last_triggers <= TRIGGERS_IN;
                if (TRIGGERS_IN(0) = '1') then -- if BTNC pressed
                    next_state <= display_time_state;
                elsif (TRIGGERS_IN(2) = '1') then -- if BTNR pressed
                    next_state <= avg_state;
                elsif (TRIGGERS_IN(3) = '1') then -- if BTNL pressed
                    next_state <= reset_state; 
                    clk_cycle_count <= (others => '0');
                elsif (TRIGGERS_IN(4) = '1') then -- if BTNU pressed
                    next_state <= max_state;
                elsif (TRIGGERS_IN(5) = '1') then -- if BTND pressed
                    next_state <= min_state;
                end if;
                current_state <= binary_to_bcd_reset_state;
            end if;
 
--      Max time
        elsif (current_state = max_state) then
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "001";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
            DOUBLE_DABBLE_RESET_OUT <= '0';
            ALU_OPERATION_SELECT_OUT <= "01";
        
            if (TRIGGERS_IN /= last_triggers) then
                last_triggers <= TRIGGERS_IN;
                if (TRIGGERS_IN(0) = '1') then -- if BTNC pressed
                    next_state <= display_time_state;
                elsif (TRIGGERS_IN(2) = '1') then -- if BTNR pressed
                    next_state <= avg_state;
                elsif (TRIGGERS_IN(3) = '1') then -- if BTNL pressed
                    next_state <= reset_state; 
                    clk_cycle_count <= (others => '0');
                elsif (TRIGGERS_IN(4) = '1') then -- if BTNU pressed
                    next_state <= max_state;
                elsif (TRIGGERS_IN(5) = '1') then -- if BTND pressed
                    next_state <= min_state;
                end if;
                current_state <= binary_to_bcd_reset_state;
            end if;
            
--      Min time
        elsif (current_state = min_state) then
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "010";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
            DOUBLE_DABBLE_RESET_OUT <= '0';
            ALU_OPERATION_SELECT_OUT <= "10";

            if (TRIGGERS_IN /= last_triggers) then
                last_triggers <= TRIGGERS_IN;
                if (TRIGGERS_IN(0) = '1') then -- if BTNC pressed
                    next_state <= display_time_state;
                elsif (TRIGGERS_IN(2) = '1') then -- if BTNR pressed
                    next_state <= avg_state;
                elsif (TRIGGERS_IN(3) = '1') then -- if BTNL pressed
                    next_state <= reset_state; 
                    clk_cycle_count <= (others => '0');
                elsif (TRIGGERS_IN(4) = '1') then -- if BTNU pressed
                    next_state <= max_state;
                elsif (TRIGGERS_IN(5) = '1') then -- if BTND pressed
                    next_state <= min_state;
                end if;
                current_state <= binary_to_bcd_reset_state;
            end if;
 
--      Reset
        elsif (current_state = reset_state) then
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '1';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "000";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
            clk_cycle_count <= clk_cycle_count + 1;
            RESET_OUT <= '1';
            if (clk_cycle_count = "11") then
                clk_cycle_count <= "00";
                RESET_OUT <= '0';
                current_state <= display_time_state;
            end if;

--      Error
        elsif (current_state = error_state) then
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "100";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';

            if (TRIGGERS_IN /= last_triggers) then
                last_triggers <= TRIGGERS_IN;
                if (TRIGGERS_IN(0) = '1') then -- if BTNC pressed
                    current_state <= dotiey_state;
                end if;
            end if;
        
        elsif (current_state = binary_to_bcd_reset_state) then
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
            DOUBLE_DABBLE_RESET_OUT <= '1';
            current_state <= next_state;
        end if;
    end if;
    end process;
    TEMP_OUT(3 downto 0) <= current_state;

end Behavioral;
