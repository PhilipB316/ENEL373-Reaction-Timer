----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2025 11:42:18
-- Design Name: 
-- Module Name: main - Behavioral
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

entity main is
    Port ( CLK100MHZ : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (0 downto 0));
end main;

architecture Behavioral of main is
--  Define local variables
    signal CLK_CYCLES : STD_LOGIC_VECTOR (27 downto 0) := "0010000000000000000000000000";
    
--  import component and define inputs and outputs
    component clk_divider is
        port(CLK100MHZ_IN : in std_logic;
             UPPERBOUND_IN : in std_logic_vector;
             SLOWCLK_OUT : out std_logic); 
    end component clk_divider;

begin
--  Map IO to hardware
    ff0: clk_divider port map(CLK100MHZ_IN => CLK100MHZ,
                              SLOWCLK_OUT => LED(0),
                              UPPERBOUND_IN => CLK_CYCLES);

end Behavioral;
