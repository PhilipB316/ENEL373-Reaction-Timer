----------------------------------------------------------------------------------
-- Engineer: 
-- Create Date: 03.03.2025 15:59:10
-- Module Name: seven_seg_decoder_tb - Behavioral
-- Project Name: 
-- Description: 
-- Additional Comments:
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity seven_seg_decoder_tb is
--  Port ( );
end seven_seg_decoder_tb;

architecture Behavioral of seven_seg_decoder_tb is
    signal decimal_point : STD_LOGIC := '0';
    signal bcd : STD_LOGIC_VECTOR (4 downto 0) := "00000";
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
