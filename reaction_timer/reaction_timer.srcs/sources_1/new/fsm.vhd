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
           TEMP_OUT : out STD_LOGIC_VECTOR (4 downto 0) := (others => '0'));
end fsm;

architecture Behavioral of fsm is

--  Define local values
    signal state : std_logic_vector (3 downto 0) := "0000";
    signal last_triggers : std_logic_vector (5 downto 0) := (others => '0');
    signal clk_cycle_count : unsigned (1 downto 0) := (others => '0');
begin

--  Triggers
--  TRIGGERS_IN(0) <= BTNC
--  TRIGGERS_IN(1) <= Dotty Completion
--  TRIGGERS_IN(2) <= BTNR
--  TRIGGERS_IN(3) <= BTNL
--  TRIGGERS_IN(4) <= BTNU
--  TRIGGERS_IN(5) <= BTND


--  States
--  X"0" <= Counting
--  X"1" <= Display Time
--  X"2" <= Dots
--  X"3" <= Average Time
--  X"4" <= Max Time
--  X"5" <= Min Time
--  X"6" <= Reset
--  X"7" <= Error

    --  Finite state machine state outputs
    process(CLK_IN, CLK_VAR_HZ_IN) is
    begin
    if (falling_edge(CLK_IN)) then
--      Counting
        if (state = X"0") then
            REACTION_TIME_COUNT_EN_OUT <= '1';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "000";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
            if (TRIGGERS_IN /= last_triggers) then
                last_triggers <= TRIGGERS_IN;
                if (TRIGGERS_IN(0) = '1') then -- if BTNC pressed
                    state <= X"1"; -- if counting then show display time
                    
                end if;
            end if;
        
--      Display time
        elsif (state = X"1") then
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "000";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
            DOUBLE_DABBLE_RESET_OUT <= '1';

            if (TRIGGERS_IN /= last_triggers) then
                last_triggers <= TRIGGERS_IN;
                if (TRIGGERS_IN(0) = '1') then -- if BTNC pressed
                    state <= X"2"; -- if display time then start counting 
                elsif (TRIGGERS_IN(2) = '1') then -- if BTNR pressed
                    state <= X"3"; -- if display time then show average time
                elsif (TRIGGERS_IN(3) = '1') then -- if BTNL pressed
                    state <= X"6"; -- if display time then reset
                    clk_cycle_count <= (others => '0');
                elsif (TRIGGERS_IN(4) = '1') then -- if BTNU pressed
                    state <= X"4"; -- if display time then show max time
                elsif (TRIGGERS_IN(5) = '1') then -- if BTND pressed
                    state <= X"5"; -- if display time then show min time
                else
                    NULL;
                end if;
            end if;

--      Dots
        elsif (state = X"2") then
            CLK_VAR_HZ_SWITCHABLE_OUT <= CLK_VAR_HZ_IN;
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '1';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "111";
            DOTIEY_COUNTDOWN_EN_OUT <= '1';
            
            TEMP_OUT(4) <= '1';
            if (TRIGGERS_IN /= last_triggers) then
                last_triggers <= TRIGGERS_IN;
                if (TRIGGERS_IN(0) = '1') then -- if BTNC pressed
--                    state <= X"7"; -- if dotiey then show error 
                elsif (TRIGGERS_IN(1) = '1') then -- if dotiey completion
                    state <= X"0"; -- if dotiey completion start counting
                end if;
            end if;

--      Average time
        elsif (state = X"3") then
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "011";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
            DOUBLE_DABBLE_RESET_OUT <= '0';

            if (TRIGGERS_IN /= last_triggers) then
                last_triggers <= TRIGGERS_IN;
                if (TRIGGERS_IN(0) = '1') then -- if BTNC pressed
                    state <= X"1"; -- if display time then start counting 
                elsif (TRIGGERS_IN(3) = '1') then -- if BTNL pressed
                    state <= X"6"; -- if display time then reset
                    clk_cycle_count <= (others => '0');
                elsif (TRIGGERS_IN(4) = '1') then -- if BTNU pressed
                    state <= X"4"; -- if display time then show max time
                elsif (TRIGGERS_IN(5) = '1') then -- if BTND pressed
                    state <= X"5"; -- if display time then show min time
                end if;
            end if;

--      Max time
        elsif (state = X"4") then
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "001";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
            DOUBLE_DABBLE_RESET_OUT <= '0';
        
            if (TRIGGERS_IN /= last_triggers) then
                last_triggers <= TRIGGERS_IN;
                if (TRIGGERS_IN(0) = '1') then -- if BTNC pressed
                    state <= X"1"; -- if display time then start counting 
                elsif (TRIGGERS_IN(3) = '1') then -- if BTNL pressed
                    state <= X"6"; -- if display time then reset
                    clk_cycle_count <= (others => '0');
                elsif (TRIGGERS_IN(4) = '1') then -- if BTNU pressed
                    state <= X"3"; -- if display time then show average time
                elsif (TRIGGERS_IN(5) = '1') then -- if BTND pressed
                    state <= X"5"; -- if display time then show min time
                end if;
            end if;
            
--      Min -time
        elsif (state = X"5") then
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "010";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
            DOUBLE_DABBLE_RESET_OUT <= '0';

            if (TRIGGERS_IN /= last_triggers) then
                last_triggers <= TRIGGERS_IN;
                if (TRIGGERS_IN(0) = '1') then -- if BTNC pressed
                    state <= X"1"; -- if display time then start counting 
                elsif (TRIGGERS_IN(3) = '1') then -- if BTNL pressed
                    state <= X"6"; -- if display time then reset
                    clk_cycle_count <= (others => '0');
                elsif (TRIGGERS_IN(4) = '1') then -- if BTNU pressed
                    state <= X"3"; -- if display time then show average time
                elsif (TRIGGERS_IN(5) = '1') then -- if BTND pressed
                    state <= X"4"; -- if display time then show max time
                end if;
            end if;

--      Reset
        elsif (state = X"6") then
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '1';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "000";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
            clk_cycle_count <= clk_cycle_count + 1;
            if (clk_cycle_count = 3) then
                clk_cycle_count <= "00";
                state <= X"1";
            end if;

--      Error
        elsif (state = X"7") then
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "100";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';

            if (TRIGGERS_IN /= last_triggers) then
                last_triggers <= TRIGGERS_IN;
                if (TRIGGERS_IN(0) = '1') then -- if BTNC pressed
                    state <= X"2"; -- if error then dotiey again
                end if;
            end if;

        end if;
    end if;
    end process;
    TEMP_OUT(3 downto 0) <= state;

end Behavioral;
