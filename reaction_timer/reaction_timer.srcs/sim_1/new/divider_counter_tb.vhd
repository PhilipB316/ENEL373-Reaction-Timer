----------------------------------------------------------------------------------
-- Engineers: 
-- Create Date: 03.03.2025 15:32:57
-- Module Name: divider_counter_tb - Behavioral
-- Project Name: 
-- Description: 
-- Additional Comments: Out of date. Non-functional
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divider_counter_tb is
--  Port ( );
end divider_counter_tb;

architecture Behavioral of divider_counter_tb is
    signal CLK : STD_LOGIC := '0';
    signal SLOWCLK : STD_LOGIC := '0';
    signal UPPERBOUND : STD_LOGIC_VECTOR (27 downto 0) := X"0000004";
    signal ENCODED_3B : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal DECODED_3B : STD_LOGIC_VECTOR (7 downto 0) := X"00";
    
begin
    inst_clock_divider : entity work.clk_divider(Behavioral)
    port map (CLK100MHZ_IN => CLK, UPPERBOUND_IN => UPPERBOUND, SLOWCLK_OUT => SLOWCLK);
    
    inst_counter_3b : entity work.counter_3b(Behavioral)
    port map (CLK_IN => CLK, COUNT_OUT => ENCODED_3B);
    
    inst_decoder_3b : entity work.decoder_3b(Behavioral)
    port map (ENC_IN => ENCODED_3B, ENC_OUT => DECODED_3B);
    
simulation : process
begin
    CLK <= not CLK;
    wait for 10ns;
end process;

end Behavioral;
