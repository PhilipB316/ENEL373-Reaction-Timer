----------------------------------------------------------------------------------
-- Engineers: Boston Black, Philip Brand, Michael Brown

-- Module Name: seven_seg_decoder - Behavioral 
-- Project Name: Reaction Timer

-- Description:
-- maps BCD input to 7-segment display output
-- 0-9, blank, d, L, g., dot, A, H, I., O.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_seg_decoder is
    port ( BCD_IN : in STD_LOGIC_VECTOR (4 downto 0);
           DECIMAL_POINT_IN : in STD_LOGIC;
           SEGMENT_LIGHT_OUT : out STD_LOGIC_VECTOR (0 to 7));
end seven_seg_decoder;

architecture Behavioral of seven_seg_decoder is
begin
    process (BCD_IN) is
    begin
        case (BCD_IN) is
--          DO NOT NOT NOT NOT NOT CHANGE THE VALUES ON THE RIGHT HAND SIDE 
--          UNLESS YOU HAVE A COPY OF THESE SOMEWHERE!!
            when "00000" => SEGMENT_LIGHT_OUT(0 to 7) <= "11000000"; -- 0
            when "00001" => SEGMENT_LIGHT_OUT(0 to 7) <= "11111001"; -- 1
            when "00010" => SEGMENT_LIGHT_OUT(0 to 7) <= "10100100"; -- 2
            when "00011" => SEGMENT_LIGHT_OUT(0 to 7) <= "10110000"; -- 3
            when "00100" => SEGMENT_LIGHT_OUT(0 to 7) <= "10011001"; -- 4
            when "00101" => SEGMENT_LIGHT_OUT(0 to 7) <= "10010010"; -- 5
            when "00110" => SEGMENT_LIGHT_OUT(0 to 7) <= "10000010"; -- 6
            when "00111" => SEGMENT_LIGHT_OUT(0 to 7) <= "11111000"; -- 7
            when "01000" => SEGMENT_LIGHT_OUT(0 to 7) <= "10000000"; -- 8
            when "01001" => SEGMENT_LIGHT_OUT(0 to 7) <= "10010000"; -- 9
            when "01010" => SEGMENT_LIGHT_OUT(0 to 7) <= "11111111"; -- blank
            when "01011" => SEGMENT_LIGHT_OUT(0 to 7) <= "10100001"; -- "d"
            when "01100" => SEGMENT_LIGHT_OUT(0 to 7) <= "11000111"; -- "L"
            when "01101" => SEGMENT_LIGHT_OUT(0 to 7) <= "00010000"; -- "g."
            when "01110" => SEGMENT_LIGHT_OUT(0 to 7) <= "01111111"; -- dot
            when "01111" => SEGMENT_LIGHT_OUT(0 to 7) <= "10001000"; -- "A"
            when "10000" => SEGMENT_LIGHT_OUT(0 to 7) <= "10001001"; -- "H"
            when "10001" => SEGMENT_LIGHT_OUT(0 to 7) <= "01111001"; -- "I."
            when "10010" => SEGMENT_LIGHT_OUT(0 to 7) <= "01000000"; -- "O."
            when "10011" => SEGMENT_LIGHT_OUT(0 to 7) <= "10000110"; -- "o"
            when "10101" => SEGMENT_LIGHT_OUT(0 to 7) <= "10000110"; -- "E"
            when "10111" => SEGMENT_LIGHT_OUT(0 to 7) <= "10101111"; -- "r"
            when others => NULL;
        end case;
    end process;
end Behavioral;
