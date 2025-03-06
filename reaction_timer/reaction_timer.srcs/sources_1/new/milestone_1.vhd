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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity milestone_1 is
    Port ( CLK100MHZ : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (7 downto 0) := X"00";
           AN : out STD_LOGIC_VECTOR (7 downto 0) := X"00";
           SEVEN_SEG : out STD_LOGIC_VECTOR (7 downto 0) := X"00";
           SW : in STD_LOGIC_VECTOR (7 downto 0));
end milestone_1;

architecture Behavioral of milestone_1 is
    signal current_state : STD_LOGIC_VECTOR (3 downto 0) := X"0";
    signal timer_clk : STD_LOGIC := '0';
    signal timer_divider : STD_LOGIC_VECTOR (27 downto 0) := X"00186A0";
    signal segment_select : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal number_output : STD_LOGIC_VECTOR (3 downto 0) := X"0";
    
    component clk_divider is
        port(CLK100MHZ_IN : in std_logic;
             UPPERBOUND_IN : in std_logic_vector;
             SLOWCLK_OUT : out std_logic); 
    end component clk_divider;
    
    component timer_8_num_selectable is
        port(CLK1000HZ_IN : in STD_LOGIC;
            EN_IN : in STD_LOGIC;
            RESET_IN : in STD_LOGIC;
            SELECT_IN : in STD_LOGIC_VECTOR (2 downto 0);
            INT_OUT : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component segment_display is
        Port(NUMBER_IN : in STD_LOGIC_VECTOR (3 downto 0); 
             MUX_IN : in STD_LOGIC_VECTOR (2 downto 0); -- its the select pin which chooses the anode. system relies on MUX_IN and NUMBER_IN changing
             SEGMENT_LIGHT_OUT : out STD_LOGIC_VECTOR (7 downto 0);
             ANODE_OUT : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
begin    
    ff0: clk_divider port map(CLK100MHZ_IN => CLK100MHZ,
                              SLOWCLK_OUT => timer_clk,
                              UPPERBOUND_IN => timer_divider);
    
    ff1: timer_8_num_selectable port map(CLK1000HZ_IN => timer_clk,
                                         EN_IN => '1',
                                         RESET_IN => '0',
                                         SELECT_IN => segment_select,
                                         INT_OUT => number_output);
                                         
    ff2: segment_display port map(NUMBER_IN => number_output,
                                  MUX_IN => segment_select,
                                  SEGMENT_LIGHT_OUT => SEVEN_SEG,
                                  ANODE_OUT => AN);
    
    process(timer_clk)
    begin
        if (timer_clk'event and timer_clk='1') then
            if (segment_select = "111") then
                segment_select <= "000";
            else
                segment_select <= std_logic_vector(unsigned(segment_select) + 1);
            end if;
        end if;
    end process;
end Behavioral;
