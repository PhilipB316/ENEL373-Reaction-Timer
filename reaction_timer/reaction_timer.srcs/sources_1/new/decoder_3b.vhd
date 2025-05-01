----------------------------------------------------------------------------------
-- Engineer: Philip Brand, Michael Brown, Boston Black

-- Create Date: 03.03.2025 14:54:36
-- Module Name: decoder_3b - Behavioral
-- Project Name: Reaction Timer

-- Description: 
-- 3 to 8 decoder for 3 bit inputs
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Define module IO
entity decoder_3b is
    Port ( DEC_IN : in STD_LOGIC_VECTOR (2 downto 0);
           DEC_OUT : out STD_LOGIC_VECTOR (7 downto 0));
end decoder_3b;

architecture Dataflow of decoder_3b is
begin
--  Mapping Inputs to Outputs
    DEC_OUT(0) <= not DEC_IN(0) and not DEC_IN(1) and not DEC_IN(2);
    DEC_OUT(1) <= DEC_IN(0) and not DEC_IN(1) and not DEC_IN(2);
    DEC_OUT(2) <= DEC_IN(1) and not DEC_IN(0) and not DEC_IN(2);
    DEC_OUT(3) <= DEC_IN(1) and DEC_IN(0) and not DEC_IN(2);
    DEC_OUT(4) <= not DEC_IN(0) and not DEC_IN(1) and DEC_IN(2);
    DEC_OUT(5) <=  DEC_IN(0) and not DEC_IN(1) and DEC_IN(2);
    DEC_OUT(6) <= not DEC_IN(0) and DEC_IN(1) and DEC_IN(2);
    DEC_OUT(7) <= DEC_IN(0) and DEC_IN(1) and DEC_IN(2);
end Dataflow;
