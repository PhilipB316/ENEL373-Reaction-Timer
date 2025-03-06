----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2025 14:01:26
-- Design Name: 
-- Module Name: milestone_1 - Behavioral
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

entity milestone_1 is
    Port ( CLK100MHZ : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (7 downto 0) := X"00";
           AN : out STD_LOGIC_VECTOR (7 downto 0) := X"00";
           SEVEN_SEG : out STD_LOGIC_VECTOR (7 downto 0) := X"00";
           SW : in STD_LOGIC_VECTOR (7 downto 0));
end milestone_1;

architecture Behavioral of milestone_1 is
    signal current_state : std_logic_vector (3 downto 0) := X"0";
    signal timer_clk : std_logic := '0';
    signal timer_divider : std_logic_vector (27 downto 0) := X"00186A0";
    signal segment_select : std_logic_vector (2 downto 0) := "000";
    signal timer_out : std_logic_vector (3 downto 0) := X"0";
    signal display_in : std_logic_vector (3 downto 0) := X"0";
    signal disp_select : std_logic_vector (2 downto 0) := "000";
    signal clear : std_logic_vector (3 downto 0) := X"0";
    signal error : std_logic_vector (3 downto 0) := X"0";
    signal average_time : std_logic_vector (3 downto 0) := X"0";
    signal max_time : std_logic_vector (3 downto 0) := X"0";
    signal min_time : std_logic_vector (3 downto 0) := X"0";
    signal dots : std_logic_vector (3 downto 0) := X"0";
    signal other : std_logic_vector (3 downto 0) := X"0";
    
    component clk_divider is
        port(CLK100MHZ_IN : in STD_LOGIC;
             UPPERBOUND_IN : in STD_LOGIC_VECTOR;
             SLOWCLK_OUT : out STD_LOGIC); 
    end component clk_divider;
    
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
    end component multiplexer_8_1_4b;
    
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
    
begin    
    ff0: clk_divider port map(CLK100MHZ_IN => CLK100MHZ,
                              SLOWCLK_OUT => timer_clk,
                              UPPERBOUND_IN => timer_divider);
    
    ff1: timer_8_num_selectable port map(CLK1000HZ_IN => timer_clk,
                                         EN_IN => '1',
                                         RESET_IN => '0',
                                         SELECT_IN => segment_select,
                                         INT_OUT => timer_out);
                                        
    ff2: multiplexer_8_1_4b port map (MUX_IN_0 => timer_out,
                                      MUX_IN_1 => clear,
                                      MUX_IN_2 => error,
                                      MUX_IN_3 => average_time,
                                      MUX_IN_4 => max_time,
                                      MUX_IN_5 => min_time,
                                      MUX_IN_6 => dots,
                                      MUX_IN_7 => other,
                                      SELECT_IN => disp_select,
                                      MUX_OUT => display_in);
                                      
    ff3: counter_3b port map(CLK_IN => timer_clk,
                             COUNT_OUT => segment_select);
                                         
    ff4: segment_display port map(NUMBER_IN => display_in,
                                  MUX_IN => segment_select,
                                  SEGMENT_LIGHT_OUT => SEVEN_SEG,
                                  ANODE_OUT => AN);
                            
    
end Behavioral;
