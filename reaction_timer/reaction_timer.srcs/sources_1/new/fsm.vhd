----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2025 04:07:27 PM
-- Design Name: 
-- Module Name: fsm - Behavioral
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

-- Define module IO
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
           RESET_OUT: out STD_LOGIC);
end fsm;

architecture Behavioral of fsm is

--  Define local values
    signal state : std_logic_vector (3 downto 0) := "0010";
    signal last_triggers : std_logic_vector (5 downto 0);
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

    process (CLK_IN) is
    begin
    if (CLK_IN = '1' and CLK_IN'event) then
        clk_cycle_count <= clk_cycle_count + 1;
--      If triggers have changed, check if state change needed then update last_triggers
        if (last_triggers /= TRIGGERS_IN) then

            if (TRIGGERS_IN(0) = '1') then -- BTNC pressed
                if (state = X"0") then -- if counting then show display time
                    state <= X"1";

                elsif (state = X"1") then -- if display time then start counting 
                    state <= X"2";

                elsif (state = X"2") then -- if dotiey then show error 
                    state <= X"7";

                elsif (state = X"7") then -- if error then dotiey again
                    state <= X"2";
                end if;

            elsif (TRIGGERS_IN(1) = '1') then -- dotiey completion
                if (state = X"2") then -- if dotiey completion start counting
                    state <= X"0";
                end if;
            
            elsif (TRIGGERS_IN(2) = '1') then -- if BTNR pressed
                if (state = X"1") then -- if display time then show average time
                    state <= X"3";
                end if;

            elsif (TRIGGERS_IN(3) = '1') then -- if BTNL pressed
                if (state = X"1") then -- if display time then reset
                    state <= X"6";
                    clk_cycle_count <= (others => '0');
                end if;
            
            elsif (TRIGGERS_IN(4) = '1') then -- if BTNU pressed
                if (state = X"1") then -- if display time then show max time
                    state <= X"4";
                end if;

            elsif (TRIGGERS_IN(5) = '1') then -- if BTND pressed
                if (state = X"1") then -- if display time then show min time
                    state <= X"5";
                end if;    

            end if;

            last_triggers <= TRIGGERS_IN;
        end if;
    end if;
    end process;    
    
    --  Finite state machine state outputs
    process(state, CLK_VAR_HZ_IN)
    begin
--      Counting
        if state = X"0" then
            REACTION_TIME_COUNT_EN_OUT <= '1';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "000";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
        end if;

--      Display time
        if state = X"1" then
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "000";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
            DOUBLE_DABBLE_RESET_OUT <= '1';
        end if;

--      Dots
        if state = X"2" then
            CLK_VAR_HZ_SWITCHABLE_OUT <= CLK_VAR_HZ_IN;
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '1';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "111";
            DOTIEY_COUNTDOWN_EN_OUT <= '1';
        end if;

--      Average time
        if state = X"3" then
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "011";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
            DOUBLE_DABBLE_RESET_OUT <= '0';
        end if;

--      Max time
        if state = X"4" then
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "001";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
            DOUBLE_DABBLE_RESET_OUT <= '0';
        end if;

--      Min -time
        if state = X"5" then
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "010";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
            DOUBLE_DABBLE_RESET_OUT <= '0';
        end if;

--      Reset
        if state = X"6" then
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '1';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "000";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
            clk_cycle_count <= clk_cycle_count + 1;
            if (clk_cycle_count = 3) then
                clk_cycle_count <= "00";
                state <= X"1";
            end if;
        end if;

--      Error
        if state = X"7" then
            REACTION_TIME_COUNT_EN_OUT <= '0';
            REACTION_TIME_COUNT_RSET_OUT <= '0';
            ENCODED_DISPLAY_INPUT_SELECT_OUT <= "100";
            DOTIEY_COUNTDOWN_EN_OUT <= '0';
        end if;

    end process;

end Behavioral;
