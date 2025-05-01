----------------------------------------------------------------------------------
-- Engineers: Boston Black, Philip Brand, Michael Brown

-- Create Date: 06.03.2025 11:07:21
-- Module Name: segment_display - Behavioral
-- Project Name: Reaction Timer

-- Description: 
-- decodes BCD input and ties to hardware
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity segment_display is
    Port ( NUMBER_IN : in STD_LOGIC_VECTOR (4 downto 0);
           MUX_IN : in STD_LOGIC_VECTOR (2 downto 0); -- its the select pin which chooses the anode. system relies on MUX_IN and NUMBER_IN changing
           SEGMENT_LIGHT_OUT : out STD_LOGIC_VECTOR (7 downto 0);
           ANODE_OUT : out STD_LOGIC_VECTOR (7 downto 0));

end segment_display;

architecture Structural of segment_display is
    signal anode : STD_LOGIC_VECTOR (0 to 7);

    component decoder_3b is
        port(DEC_IN : in STD_LOGIC_VECTOR (2 downto 0);
             DEC_OUT : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    component seven_seg_decoder is
        port(BCD_IN : in STD_LOGIC_VECTOR (4 downto 0);
             DECIMAL_POINT_IN : in STD_LOGIC;
             SEGMENT_LIGHT_OUT : out STD_LOGIC_VECTOR (0 to 7));
    end component;

begin

--  3 bit to 8 line display anode decoder
    ff0: decoder_3b port map(DEC_IN => MUX_IN,
                             DEC_OUT => anode);
--  4 bit to 8 line segment light decoder
    ff1: seven_seg_decoder port map(BCD_IN => NUMBER_IN,
                                    DECIMAL_POINT_IN => '1',
                                    SEGMENT_LIGHT_OUT => SEGMENT_LIGHT_OUT);
    ANODE_OUT <= not anode;
end Structural;
