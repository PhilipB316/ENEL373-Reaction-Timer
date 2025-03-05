----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2025 11:07:21
-- Design Name: 
-- Module Name: segment_display - Behavioral
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

entity segment_display is
    Port ( CLK_IN : in STD_LOGIC;
           NUMBER_IN : in STD_LOGIC_VECTOR (3 downto 0);
           MUX_IN : in STD_LOGIC_VECTOR (2 downto 0);
           SEGMENT_LIGHT_OUT : out STD_LOGIC_VECTOR (7 downto 0);
           ANODE_OUT : out STD_LOGIC_VECTOR (7 downto 0));
           
end segment_display;

architecture Behavioral of segment_display is
    component decoder_3b is
        port(DEC_IN : in STD_LOGIC_VECTOR (2 downto 0);
             DEC_OUT : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component seven_seg_decoder is
        port(BCD_IN : in STD_LOGIC_VECTOR (3 downto 0);
             DECIMAL_POINT_IN : in STD_LOGIC;
             SEGMENT_LIGHT_OUT : out STD_LOGIC_VECTOR (0 to 7));
    end component;
    
begin

    ff0: decoder_3b port map(DEC_IN => MUX_IN,
                             DEC_OUT => ANODE_OUT);
    
    ff1: seven_seg_decoder port map(BCD_IN => NUMBER_IN,
                                    DECIMAL_POINT_IN => '0',
                                    SEGMENT_LIGHT_OUT => SEGMENT_LIGHT_OUT);

end Behavioral;
