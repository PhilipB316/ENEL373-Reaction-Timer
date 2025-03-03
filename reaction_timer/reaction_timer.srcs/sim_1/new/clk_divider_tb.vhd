----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2025 11:35:03
-- Design Name: 
-- Module Name: clk_divider_tb - Behavioral
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

entity clk_divider_tb is
--  Port ( );
end clk_divider_tb;

architecture Behavioral of clk_divider_tb is
--  import component and define inputs and outputs
    component clk_divider is
        port(CLK100MHZ_IN : in std_logic;
             UPPERBOUND_IN : in std_logic_vector;
             SLOWCLK_OUT : out std_logic); 
    end component clk_divider;
    
--  Test Variables
    signal test_clk : std_logic := '0';
    signal test_out : std_logic := '0';
    signal test_limit : std_logic_vector (27 downto 0) := "0000000000000000000000000100";

begin
--  Map IO to test inputs
    uut: clk_divider port map(CLK100MHZ_IN => test_clk,
                              SLOWCLK_OUT => test_out,
                              UPPERBOUND_IN => test_limit);

--  Clock simulation
    clk_process: process is
    begin
        test_clk <= not test_clk;
        wait for 10ns;
    end process;
    
end Behavioral;
