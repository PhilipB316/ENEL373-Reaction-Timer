----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2025 16:21:10
-- Design Name: 
-- Module Name: counter_9i_plus_tb - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_9i_plus_tb is
--  Port ( );
end counter_9i_plus_tb;

architecture Behavioral of counter_9i_plus_tb is
--  import component and define inputs and outputs
    component counter_9i_plus is
        port ( EN_IN : in STD_LOGIC;
               RESET_IN : in STD_LOGIC;
               INCREMENT_IN : in STD_LOGIC;
               COUNT_OUT : out STD_LOGIC_VECTOR (3 downto 0);
               TICK_OUT : out STD_LOGIC);
    end component counter_9i_plus;
    
    signal test_clk : std_logic := '0';
    signal test_reset: std_logic := '0';
    signal test_count: std_logic_vector (3 downto 0);
    signal test_tick: std_logic;
    signal test_enable: std_logic := '0';
    
begin
    
    uut: counter_9i_plus port map(INCREMENT_IN => test_clk,
                                  RESET_IN => test_reset,
                                  EN_IN => test_enable,
                                  COUNT_OUT => test_count,
                                  TICK_OUT => test_tick);
--  Clock simulation
    clk_process: process is
    begin
        test_clk <= not test_clk;
        wait for 10ns;
    end process;
    
    en_process: process is
    begin
        wait for 10ns;

        test_enable <= not test_enable;
        wait for 500ns;
    end process;
    
    reset_process: process is
    begin
        wait for 10ns;

        test_reset <= '0';
        wait for 300ns;
        test_reset <= '1';
        wait for 10ns;
    end process;
    
    
end Behavioral;
