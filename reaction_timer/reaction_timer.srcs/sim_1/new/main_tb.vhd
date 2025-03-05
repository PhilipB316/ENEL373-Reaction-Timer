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

entity main_tb is
--    Port ( CLK100MHZ : in STD_LOGIC;
--           LED : out STD_LOGIC_VECTOR (4 downto 0) := X"00";
--           AN : out STD_LOGIC_VECTOR (7 downto 0) := X"00";
--           SEVEN_SEG : out STD_LOGIC_VECTOR (7 downto 0) := X"00");
end main_tb;

architecture Behavioral of main_tb is
--  Define local variables
    signal CLK100MHZ : std_logic := '0';
    signal AN: std_logic_vector (7 downto 0);
    signal SEVEN_SEG : std_logic_vector (7 downto 0);
    signal upper_bound : std_logic_vector  (27 downto 0) := "0000000000000000000000000001";
    signal slowclk : std_logic;
    signal encoded_segment : std_logic_vector (2 downto 0);
    signal decimal_point : std_logic := '0';
    signal display_value : std_logic_vector (3 downto 0) := X"0";
    signal cycle : std_logic := '0';
    signal not_inverted_anode: std_logic_vector (7 downto 0) := X"FF";
    
--  import component and define inputs and outputs
    component clk_divider is
        port(CLK100MHZ_IN : in std_logic;
             UPPERBOUND_IN : in std_logic_vector;
             SLOWCLK_OUT : out std_logic); 
    end component clk_divider;
    
    component counter_3b is
        port(CLK_IN : in std_logic;
             COUNT_OUT : out std_logic_vector);
    end component counter_3b;
    
    component decoder_3b is
        port(DEC_IN : in std_logic_vector;
             DEC_OUT : out std_logic_vector);
    end component decoder_3b;
    
    component seven_seg_decoder is
        port(BCD_IN : in std_logic_vector;
             DECIMAL_POINT_IN : in std_logic;
             SEGMENT_LIGHT_OUT : out std_logic_vector);
    end component seven_seg_decoder;
    
    component counter_decade is
        port ( EN_IN : in std_logic;
               RESET_IN : in std_logic;
               INCREMENT_IN : in std_logic;
               COUNT_OUT : out std_logic_vector;
               TICK_OUT : out std_logic);
    end component counter_decade;
    
begin
--  Map IO to hardware
    uut1: clk_divider port map(CLK100MHZ_IN => CLK100MHZ,
                              SLOWCLK_OUT => slowclk,
                              UPPERBOUND_IN => upper_bound);
    uut2: counter_3b port map(CLK_IN => cycle,
                             COUNT_OUT => encoded_segment);
    uut3: decoder_3b port map(DEC_IN => encoded_segment,
                              DEC_OUT => not_inverted_anode);
    uut4: seven_seg_decoder port map (DECIMAL_POINT_IN => decimal_point,
                                     SEGMENT_LIGHT_OUT => SEVEN_SEG,
                                     BCD_IN => display_value);
    uut5: counter_decade port map (EN_IN => '1',
                                   RESET_IN => '0',
                                   INCREMENT_IN => slowclk,
                                   COUNT_OUT => display_value,
                                   TICK_OUT => cycle);

    AN <= not not_inverted_anode;
--  Clock simulation
    clk_process: process is
    begin
        CLK100MHZ <= not CLK100MHZ;
        wait for 10ns;
    end process;

end Behavioral;
