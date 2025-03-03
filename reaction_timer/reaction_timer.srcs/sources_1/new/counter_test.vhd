----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.03.2025 11:45:35
-- Design Name: 
-- Module Name: counter_test - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_test is
    Port ( CLK100MHZ : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (7 downto 0));
end counter_test;

architecture Behavioral of counter_test is
    signal slowclk : std_logic;
    signal clk_cycles : std_logic_vector  (27 downto 0) := "0101111101011110000100000000";
    signal en : std_logic := '1';
    signal reset : std_logic := '0';
    signal count : std_logic_vector (3 downto 0) := X"5";
    signal tick : std_logic := '0';

    component clk_divider is
        port(CLK100MHZ_IN : in std_logic;
             UPPERBOUND_IN : in std_logic_vector;
             SLOWCLK_OUT : out std_logic); 
    end component clk_divider;

    component counter_9i_plus is
        port ( EN_IN : in std_logic;
               RESET_IN : in std_logic;
               INCREMENT_IN : in std_logic;
               COUNT_OUT : out std_logic_vector;
               TICK_OUT : out std_logic);
    end component counter_9i_plus;

begin

    ff0: clk_divider port map(CLK100MHZ_IN => CLK100MHZ,
                              SLOWCLK_OUT => slowclk,
                              UPPERBOUND_IN => clk_cycles);

    ff4: counter_9i_plus port map (EN_IN => en,
                                   RESET_IN => reset,
                                   INCREMENT_IN => slowclk,
                                   COUNT_OUT => count,
                                   TICK_OUT => tick);
    
    LED (3 downto 0) <= count;
    LED (4) <= slowclk;
    LED (5) <= tick;
    LED (6) <= en;
    LED (7) <= reset;

end Behavioral;
