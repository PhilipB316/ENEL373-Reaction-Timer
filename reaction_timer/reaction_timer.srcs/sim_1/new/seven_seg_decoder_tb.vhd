----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2025 15:59:10
-- Design Name: 
-- Module Name: seven_seg_decoder_tb - Behavioral
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

entity seven_seg_decoder_tb is
--  Port ( );
end seven_seg_decoder_tb;

architecture Behavioral of seven_seg_decoder_tb is
    signal decimal_point : STD_LOGIC := '0';
    signal bcd : STD_LOGIC_VECTOR (3 downto 0) := X"0";
    signal segment_lights : STD_LOGIC_VECTOR (7 downto 0) := X"00";
begin
    inst_seven_seg_decoder : entity work.seven_seg_decoder(Behavioral)
    port map (BCD_IN => bcd, DECIMAL_POINT_IN => decimal_point, SEGMENT_LIGHT_OUT => segment_lights);
    
    simulation : process
    begin
    bcd <= std_logic_vector(unsigned(bcd) + X"1");
    wait for 10ns;
    end process;
end Behavioral;
