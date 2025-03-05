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
    signal counter_enable : STD_LOGIC_VECTOR (7 downto 0) := X"FF";
    signal countdown_clk : STD_LOGIC := '0';
    signal countdown_divider : STD_LOGIC_VECTOR := X"5F5E100";
    signal timer_clk : STD_LOGIC := '0';
    signal timer_divider : STD_LOGIC_VECTOR := X"00186A0";
    signal countdown_led : natural := 2;
    
    component clk_divider is
        port(CLK100MHZ_IN : in std_logic;
             UPPERBOUND_IN : in std_logic_vector;
             SLOWCLK_OUT : out std_logic); 
    end component clk_divider;
    
    component countdown_leds is
        port( ENABLE_IN : in std_logic;
              LED_OUT : out std_logic_vector (2 downto 0);
              SLOWCLK_IN : in std_logic);
    end component countdown_leds;
    
    component seven_seg_decoder is
        port(BCD_IN : in std_logic_vector;
             DECIMAL_POINT_IN : in std_logic;
             SEGMENT_LIGHT_OUT : out std_logic_vector);
    end component seven_seg_decoder;
    
begin
    ff0: clk_divider port map(CLK100MHZ_IN => CLK100MHZ,
                              SLOWCLK_OUT => countdown_clk,
                              UPPERBOUND_IN => countdown_divider);
    
    ff1: clk_divider port map(CLK100MHZ_IN => CLK100MHZ,
                              SLOWCLK_OUT => timer_clk,
                              UPPERBOUND_IN => timer_divider);
    
    ff2: countdown_leds port map(ENABLE_IN => current_state(1),
                                 LED_OUT => LED (0 to 2),
                                 SLOWCLK_IN => countdown_clk);
    
    process
    begin
--    May have sync issues
        if (current_state = X"0") then
            LED(0 to 2) <= "111";
            current_state <= X"1";
        end if;
    end process;
end Behavioral;
