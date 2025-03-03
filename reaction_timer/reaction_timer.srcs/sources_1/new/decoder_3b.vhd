----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2025 14:54:36
-- Design Name: 
-- Module Name: decoder_3b - Behavioral
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

entity decoder_3b is
    Port ( ENC_IN : in STD_LOGIC_VECTOR (2 downto 0);
           ENC_OUT : out STD_LOGIC_VECTOR (7 downto 0));
end decoder_3b;

architecture Behavioral of decoder_3b is

begin
    
--  Mapping Inputs to Outputs
    ENC_OUT(0) <= not ENC_IN(0) and not ENC_IN(1) and not ENC_IN(2);
    ENC_OUT(1) <= ENC_IN(0) and not ENC_IN(1) and not ENC_IN(2);
    ENC_OUT(2) <= ENC_IN(1) and not ENC_IN(0) and not ENC_IN(2);
    ENC_OUT(3) <= ENC_IN(1) and ENC_IN(0) and not ENC_IN(2);
    ENC_OUT(4) <= not ENC_IN(0) and not ENC_IN(1) and ENC_IN(2);
    ENC_OUT(5) <=  ENC_IN(0) and not ENC_IN(1) and ENC_IN(2);
    ENC_OUT(6) <= not ENC_IN(0) and ENC_IN(1) and ENC_IN(2);
    ENC_OUT(7) <= ENC_IN(0) and ENC_IN(1) and ENC_IN(2);

end Behavioral;
