library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity seven_seg_decoder is
port ( BCD_IN : in STD_LOGIC_VECTOR (3 downto 0);
DECIMAL_POINT_IN : in STD_LOGIC;
SEGMENT_LIGHT_OUT : out STD_LOGIC_VECTOR (0 to 7));
end seven_seg_decoder;
architecture Behavioral of seven_seg_decoder is
begin
    process (BCD_IN) is
    begin
        case (BCD_IN) is
        
        -- DO NOT NOT NOT NOT NOT CHANGE THE VALUES ON THE RIGHT HAND SIDE UNLESS YOU HAVE A COPY OF THESE SOMEWHERE!!
        
            when "0000" => SEGMENT_LIGHT_OUT(0 to 7) <= "11000000"; -- 0
            when "0001" => SEGMENT_LIGHT_OUT(0 to 7) <= "11111001"; -- 1
            when "0010" => SEGMENT_LIGHT_OUT(0 to 7) <= "10100100"; -- 2
            when "0011" => SEGMENT_LIGHT_OUT(0 to 7) <= "10110000"; -- 3
            when "0100" => SEGMENT_LIGHT_OUT(0 to 7) <= "10011001"; -- 4
            when "0101" => SEGMENT_LIGHT_OUT(0 to 7) <= "10010010"; -- 5
            when "0110" => SEGMENT_LIGHT_OUT(0 to 7) <= "10000010"; -- 6
            when "0111" => SEGMENT_LIGHT_OUT(0 to 7) <= "11111000"; -- 7
            when "1000" => SEGMENT_LIGHT_OUT(0 to 7) <= "10000000"; -- 8
            when "1001" => SEGMENT_LIGHT_OUT(0 to 7) <= "10010000"; -- 9
            when "1010" => SEGMENT_LIGHT_OUT(0 to 7) <= "10000000"; -- blank
            when "1011" => SEGMENT_LIGHT_OUT(0 to 7) <= "10100000"; -- max
            when "1100" => SEGMENT_LIGHT_OUT(0 to 7) <= "10000001"; -- average
            when "1101" => SEGMENT_LIGHT_OUT(0 to 7) <= "10010000"; -- min
            --when "1110" => SEGMENT_LIGHT_OUT(0 to 6) <=
            --when "1111" => SEGMENT_LIGHT_OUT(0 to 6) <=
        when others => NULL;
    end case;
    end process;
    SEGMENT_LIGHT_OUT(7) <= DECIMAL_POINT_IN;
end Behavioral;
