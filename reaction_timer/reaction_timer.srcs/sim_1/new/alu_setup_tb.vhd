----------------------------------------------------------------------------------
-- Engineers: Michael Brown, Philip Brand
-- Create Date: 25.04.2025 02:04:31
-- Module Name: alu_setup_tb - Behavioral
-- Project Name: ALU Setup Test Bench 
-- Description: Tests the alu, circular_buffer, and binary_to_bcd_8 components.
-- Additional Comments: Used to test the more complex parts of the 
-- reaction statistic calculations.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_setup_tb is
--  Port ( );
end alu_setup_tb;

architecture Behavioral of alu_setup_tb is
    signal clk : std_logic := '0';
    signal circular_buffer_input : std_logic_vector (27 downto 0) := (others => '0');
    signal circular_buffer_write_trigger : std_logic := '0';
    signal circular_buffer_reset : std_logic := '0';
    signal circular_buffer_output_1 : std_logic_vector (27 downto 0) := (others => '0');
    signal circular_buffer_output_2 : std_logic_vector (27 downto 0) := (others => '0');
    signal circular_buffer_output_3 : std_logic_vector (27 downto 0) := (others => '0');
    signal circular_buffer_size : std_logic_vector (1 downto 0) := (others => '0');
    signal alu_operation_select : std_logic_vector (1 downto 0) := (others => '0');
    signal alu_output : std_logic_vector (27 downto 0) := (others => '0');
    signal binary_to_bcd_reset : std_logic := '0';
    signal bcd_out : std_logic_vector (39 downto 0) := (others => '0');
    signal readable_bcd : std_logic_vector (31 downto 0) := (others => '0');
    
    component alu is
        Port ( NUM_1_IN, NUM_2_IN, NUM_3_IN : in STD_LOGIC_VECTOR (27 downto 0);
               BUFFER_SIZE_IN, OPERATION_SELECT_IN : in STD_LOGIC_VECTOR (1 downto 0);
               OUTPUT_OUT : out STD_LOGIC_VECTOR (27 downto 0));
    end component alu;

    component circular_buffer is
        Port ( NUMBER_IN : in STD_LOGIC_VECTOR (27 downto 0);
               NUMBER_1_OUT, NUMBER_2_OUT, NUMBER_3_OUT : out STD_LOGIC_VECTOR (27 downto 0);
               BUFFER_SIZE_OUT : out STD_LOGIC_VECTOR (1 downto 0);
               RESET_IN, WRITE_TRIGGER_IN : in STD_LOGIC);
    end component circular_buffer;

    component binary_to_bcd_8 is
        Port ( CLK_IN : IN  std_logic;
               RESET_IN : IN  std_logic;
               BINARY_IN : IN  std_logic_vector(27 downto 0);
               BCD_8_DIGIT_OUT : OUT std_logic_vector (39 downto 0) := (others => '0'));
    end component binary_to_bcd_8;

begin
    ff0: alu port map ( NUM_1_IN => circular_buffer_output_1,
                        NUM_2_IN => circular_buffer_output_2,
                        NUM_3_IN => circular_buffer_output_3,
                        BUFFER_SIZE_IN => circular_buffer_size,
                        OPERATION_SELECT_IN => alu_operation_select,
                        OUTPUT_OUT => alu_output);
    
    ff1: circular_buffer port map ( NUMBER_IN => circular_buffer_input,
                                    NUMBER_1_OUT => circular_buffer_output_1,
                                    NUMBER_2_OUT => circular_buffer_output_2,
                                    NUMBER_3_OUT => circular_buffer_output_3,
                                    BUFFER_SIZE_OUT => circular_buffer_size,
                                    RESET_IN => circular_buffer_reset,
                                    WRITE_TRIGGER_IN => circular_buffer_write_trigger);

    ff2: binary_to_bcd_8 port map ( CLK_IN => clk,
                                    RESET_IN => binary_to_bcd_reset,
                                    BINARY_IN => alu_output,
                                    BCD_8_DIGIT_OUT => bcd_out);
    
    readable_bcd(31 downto 28) <= bcd_out(38 downto 35);
    readable_bcd(27 downto 24) <= bcd_out(33 downto 30);
    readable_bcd(23 downto 20) <= bcd_out(28 downto 25);
    readable_bcd(19 downto 16) <= bcd_out(23 downto 20);
    readable_bcd(15 downto 12) <= bcd_out(18 downto 15);
    readable_bcd(11 downto 8) <= bcd_out(13 downto 10);
    readable_bcd(7 downto 4) <= bcd_out(8 downto 5);
    readable_bcd(3 downto 0) <= bcd_out(3 downto 0);

    simulation_clk : process
    begin
        wait for 1ns;
        clk <= '1';
        wait for 1ns;
        clk <= '0';
    end process;
    
    simulation : process
    begin
        binary_to_bcd_reset <= '1';
        wait for 10ns;
        circular_buffer_reset <= '1';
        circular_buffer_input <= X"0000000";
        wait for 100ns;
        circular_buffer_reset <= '0';
        wait for 100ns;
        circular_buffer_input <= X"0010001";
        binary_to_bcd_reset <= '1';
        wait for 100ns;
        circular_buffer_write_trigger <= '1';
        wait for 100ns;
        circular_buffer_write_trigger <= '0';
        wait for 100ns;
        circular_buffer_input <= X"00FF000";
        wait for 10ns;
        circular_buffer_write_trigger <= '1';
        wait for 10ns;
        alu_operation_select <= "11";
        circular_buffer_write_trigger <= '0';
        wait for 100ns;
        circular_buffer_input <= X"0022222";
        wait for 10ns;
        circular_buffer_write_trigger <= '1';
        wait for 10ns;
        circular_buffer_write_trigger <= '0';
        wait for 100ns;
        binary_to_bcd_reset <= '0';
        wait for 100ns;
        binary_to_bcd_reset <= '1';
        alu_operation_select <= "01";
        wait for 1ns;
        binary_to_bcd_reset <= '0';
        wait for 100ns;
        binary_to_bcd_reset <= '1';
        alu_operation_select <= "10";
        wait for 100ns;
        binary_to_bcd_reset <= '0';
        wait for 200ns;
        circular_buffer_reset <= '1';
        wait for 100000ns;
    end process;
end Behavioral;
