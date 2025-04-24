library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity main_tb is
end main_tb;

architecture Behavioral of main_tb is
--  Define local variables
    signal CLK100MHZ : std_logic := '0';
    signal AN: std_logic_vector (7 downto 0) := X"00";
    signal SEVEN_SEG : std_logic_vector (7 downto 0) := X"00";
    signal LED : std_logic_vector (15 downto 0) := X"0000";
    signal BTNC : std_logic := '0';
    signal BTNR : std_logic := '0';
    signal BTNL : std_logic := '0';
    signal BTNU : std_logic := '0';
    signal BTND : std_logic := '0';
    signal temp : std_logic := '0';

    component main is
        Port (  CLK100MHZ : in STD_LOGIC;
                LED : out STD_LOGIC_VECTOR (15 downto 0);
                AN : out STD_LOGIC_VECTOR (7 downto 0);
                SEVEN_SEG : out STD_LOGIC_VECTOR (7 downto 0) := X"00";
                BTNC : in STD_LOGIC;
                BTNR : in STD_LOGIC;
                BTNL : in STD_LOGIC;
                BTNU : in STD_LOGIC;
                BTND : in STD_LOGIC);
    end component main;

begin
--  Instantiate the Unit Under Test (UUT)
    tb0: main port map (CLK100MHZ => CLK100MHZ,
                        LED => LED,
                        AN => AN,
                        SEVEN_SEG => SEVEN_SEG,
                        BTNC => BTNC,
                        BTNR => BTNR,
                        BTNL => BTNL,
                        BTNU => BTNU,
                        BTND => BTND);

--  Clock simulation
    clk_process: process is
    begin
        CLK100MHZ <= not CLK100MHZ;
        wait for 1ps;
    end process;

-- Button simulation
    btn_process: process is
    begin
        wait for 1000ns;
        BTNC <= '1';
        wait for 1000ns;
        BTNC <= '0';
        wait for 1000ns;
        BTNC <= '1';
        wait for 1000ns;
        BTNC <= '0';
        wait for 1000ns;
        BTNC <= '1';
        temp <= '1';
        wait for 1000ns;
        BTNC <= '0';
    end process;

end Behavioral;

