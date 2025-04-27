-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Fri Apr 25 04:33:05 2025
-- Host        : clucktop running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file {D:/UC
--               Files/2025/ENEL373/ThuGroup13/reaction_timer/reaction_timer.sim/sim_1/synth/func/xsim/alu_setup_tb_func_synth.vhd}
-- Design      : main
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_divider is
  port (
    CLK : out STD_LOGIC;
    CLK100MHZ_IBUF_BUFG : in STD_LOGIC
  );
end clk_divider;

architecture STRUCTURE of clk_divider is
  signal \^clk\ : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal \count0_carry__0_i_1__0_n_0\ : STD_LOGIC;
  signal \count0_carry__0_i_2__0_n_0\ : STD_LOGIC;
  signal \count0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \count0_carry__0_i_4__0_n_0\ : STD_LOGIC;
  signal \count0_carry__0_n_0\ : STD_LOGIC;
  signal \count0_carry__0_n_1\ : STD_LOGIC;
  signal \count0_carry__0_n_2\ : STD_LOGIC;
  signal \count0_carry__0_n_3\ : STD_LOGIC;
  signal \count0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \count0_carry__1_i_2__0_n_0\ : STD_LOGIC;
  signal \count0_carry__1_n_3\ : STD_LOGIC;
  signal count0_carry_i_1_n_0 : STD_LOGIC;
  signal count0_carry_i_2_n_0 : STD_LOGIC;
  signal count0_carry_i_3_n_0 : STD_LOGIC;
  signal count0_carry_i_4_n_0 : STD_LOGIC;
  signal count0_carry_n_0 : STD_LOGIC;
  signal count0_carry_n_1 : STD_LOGIC;
  signal count0_carry_n_2 : STD_LOGIC;
  signal count0_carry_n_3 : STD_LOGIC;
  signal \count[0]_i_2_n_0\ : STD_LOGIC;
  signal count_reg : STD_LOGIC_VECTOR ( 27 downto 0 );
  signal \count_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal temp_i_1_n_0 : STD_LOGIC;
  signal NLW_count0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_count0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_count0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_count0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_count_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_reg[8]_i_1\ : label is 11;
begin
  CLK <= \^clk\;
count0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => count0_carry_n_0,
      CO(2) => count0_carry_n_1,
      CO(1) => count0_carry_n_2,
      CO(0) => count0_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_count0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => count0_carry_i_1_n_0,
      S(2) => count0_carry_i_2_n_0,
      S(1) => count0_carry_i_3_n_0,
      S(0) => count0_carry_i_4_n_0
    );
\count0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => count0_carry_n_0,
      CO(3) => \count0_carry__0_n_0\,
      CO(2) => \count0_carry__0_n_1\,
      CO(1) => \count0_carry__0_n_2\,
      CO(0) => \count0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_count0_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \count0_carry__0_i_1__0_n_0\,
      S(2) => \count0_carry__0_i_2__0_n_0\,
      S(1) => \count0_carry__0_i_3_n_0\,
      S(0) => \count0_carry__0_i_4__0_n_0\
    );
\count0_carry__0_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => count_reg(23),
      I1 => count_reg(22),
      I2 => count_reg(21),
      O => \count0_carry__0_i_1__0_n_0\
    );
\count0_carry__0_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => count_reg(20),
      I1 => count_reg(19),
      I2 => count_reg(18),
      O => \count0_carry__0_i_2__0_n_0\
    );
\count0_carry__0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => count_reg(15),
      I1 => count_reg(17),
      I2 => count_reg(16),
      O => \count0_carry__0_i_3_n_0\
    );
\count0_carry__0_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => count_reg(13),
      I1 => count_reg(14),
      I2 => count_reg(12),
      O => \count0_carry__0_i_4__0_n_0\
    );
\count0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count0_carry__0_n_0\,
      CO(3 downto 2) => \NLW_count0_carry__1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => clear,
      CO(0) => \count0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_count0_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \count0_carry__1_i_1_n_0\,
      S(0) => \count0_carry__1_i_2__0_n_0\
    );
\count0_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_reg(27),
      O => \count0_carry__1_i_1_n_0\
    );
\count0_carry__1_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => count_reg(26),
      I1 => count_reg(25),
      I2 => count_reg(24),
      O => \count0_carry__1_i_2__0_n_0\
    );
count0_carry_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => count_reg(9),
      I1 => count_reg(11),
      I2 => count_reg(10),
      O => count0_carry_i_1_n_0
    );
count0_carry_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => count_reg(6),
      I1 => count_reg(7),
      I2 => count_reg(8),
      O => count0_carry_i_2_n_0
    );
count0_carry_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => count_reg(5),
      I1 => count_reg(4),
      I2 => count_reg(3),
      O => count0_carry_i_3_n_0
    );
count0_carry_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => count_reg(2),
      I1 => count_reg(1),
      I2 => count_reg(0),
      O => count0_carry_i_4_n_0
    );
\count[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_reg(0),
      O => \count[0]_i_2_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[0]_i_1_n_7\,
      Q => count_reg(0),
      R => clear
    );
\count_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_reg[0]_i_1_n_0\,
      CO(2) => \count_reg[0]_i_1_n_1\,
      CO(1) => \count_reg[0]_i_1_n_2\,
      CO(0) => \count_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_reg[0]_i_1_n_4\,
      O(2) => \count_reg[0]_i_1_n_5\,
      O(1) => \count_reg[0]_i_1_n_6\,
      O(0) => \count_reg[0]_i_1_n_7\,
      S(3 downto 1) => count_reg(3 downto 1),
      S(0) => \count[0]_i_2_n_0\
    );
\count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[8]_i_1_n_5\,
      Q => count_reg(10),
      R => clear
    );
\count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[8]_i_1_n_4\,
      Q => count_reg(11),
      R => clear
    );
\count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[12]_i_1_n_7\,
      Q => count_reg(12),
      R => clear
    );
\count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[8]_i_1_n_0\,
      CO(3) => \count_reg[12]_i_1_n_0\,
      CO(2) => \count_reg[12]_i_1_n_1\,
      CO(1) => \count_reg[12]_i_1_n_2\,
      CO(0) => \count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[12]_i_1_n_4\,
      O(2) => \count_reg[12]_i_1_n_5\,
      O(1) => \count_reg[12]_i_1_n_6\,
      O(0) => \count_reg[12]_i_1_n_7\,
      S(3 downto 0) => count_reg(15 downto 12)
    );
\count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[12]_i_1_n_6\,
      Q => count_reg(13),
      R => clear
    );
\count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[12]_i_1_n_5\,
      Q => count_reg(14),
      R => clear
    );
\count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[12]_i_1_n_4\,
      Q => count_reg(15),
      R => clear
    );
\count_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[16]_i_1_n_7\,
      Q => count_reg(16),
      R => clear
    );
\count_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[12]_i_1_n_0\,
      CO(3) => \count_reg[16]_i_1_n_0\,
      CO(2) => \count_reg[16]_i_1_n_1\,
      CO(1) => \count_reg[16]_i_1_n_2\,
      CO(0) => \count_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[16]_i_1_n_4\,
      O(2) => \count_reg[16]_i_1_n_5\,
      O(1) => \count_reg[16]_i_1_n_6\,
      O(0) => \count_reg[16]_i_1_n_7\,
      S(3 downto 0) => count_reg(19 downto 16)
    );
\count_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[16]_i_1_n_6\,
      Q => count_reg(17),
      R => clear
    );
\count_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[16]_i_1_n_5\,
      Q => count_reg(18),
      R => clear
    );
\count_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[16]_i_1_n_4\,
      Q => count_reg(19),
      R => clear
    );
\count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[0]_i_1_n_6\,
      Q => count_reg(1),
      R => clear
    );
\count_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[20]_i_1_n_7\,
      Q => count_reg(20),
      R => clear
    );
\count_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[16]_i_1_n_0\,
      CO(3) => \count_reg[20]_i_1_n_0\,
      CO(2) => \count_reg[20]_i_1_n_1\,
      CO(1) => \count_reg[20]_i_1_n_2\,
      CO(0) => \count_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[20]_i_1_n_4\,
      O(2) => \count_reg[20]_i_1_n_5\,
      O(1) => \count_reg[20]_i_1_n_6\,
      O(0) => \count_reg[20]_i_1_n_7\,
      S(3 downto 0) => count_reg(23 downto 20)
    );
\count_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[20]_i_1_n_6\,
      Q => count_reg(21),
      R => clear
    );
\count_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[20]_i_1_n_5\,
      Q => count_reg(22),
      R => clear
    );
\count_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[20]_i_1_n_4\,
      Q => count_reg(23),
      R => clear
    );
\count_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[24]_i_1_n_7\,
      Q => count_reg(24),
      R => clear
    );
\count_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[20]_i_1_n_0\,
      CO(3) => \NLW_count_reg[24]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \count_reg[24]_i_1_n_1\,
      CO(1) => \count_reg[24]_i_1_n_2\,
      CO(0) => \count_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[24]_i_1_n_4\,
      O(2) => \count_reg[24]_i_1_n_5\,
      O(1) => \count_reg[24]_i_1_n_6\,
      O(0) => \count_reg[24]_i_1_n_7\,
      S(3 downto 0) => count_reg(27 downto 24)
    );
\count_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[24]_i_1_n_6\,
      Q => count_reg(25),
      R => clear
    );
\count_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[24]_i_1_n_5\,
      Q => count_reg(26),
      R => clear
    );
\count_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[24]_i_1_n_4\,
      Q => count_reg(27),
      R => clear
    );
\count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[0]_i_1_n_5\,
      Q => count_reg(2),
      R => clear
    );
\count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[0]_i_1_n_4\,
      Q => count_reg(3),
      R => clear
    );
\count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[4]_i_1_n_7\,
      Q => count_reg(4),
      R => clear
    );
\count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[0]_i_1_n_0\,
      CO(3) => \count_reg[4]_i_1_n_0\,
      CO(2) => \count_reg[4]_i_1_n_1\,
      CO(1) => \count_reg[4]_i_1_n_2\,
      CO(0) => \count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[4]_i_1_n_4\,
      O(2) => \count_reg[4]_i_1_n_5\,
      O(1) => \count_reg[4]_i_1_n_6\,
      O(0) => \count_reg[4]_i_1_n_7\,
      S(3 downto 0) => count_reg(7 downto 4)
    );
\count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[4]_i_1_n_6\,
      Q => count_reg(5),
      R => clear
    );
\count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[4]_i_1_n_5\,
      Q => count_reg(6),
      R => clear
    );
\count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[4]_i_1_n_4\,
      Q => count_reg(7),
      R => clear
    );
\count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[8]_i_1_n_7\,
      Q => count_reg(8),
      R => clear
    );
\count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[4]_i_1_n_0\,
      CO(3) => \count_reg[8]_i_1_n_0\,
      CO(2) => \count_reg[8]_i_1_n_1\,
      CO(1) => \count_reg[8]_i_1_n_2\,
      CO(0) => \count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[8]_i_1_n_4\,
      O(2) => \count_reg[8]_i_1_n_5\,
      O(1) => \count_reg[8]_i_1_n_6\,
      O(0) => \count_reg[8]_i_1_n_7\,
      S(3 downto 0) => count_reg(11 downto 8)
    );
\count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[8]_i_1_n_6\,
      Q => count_reg(9),
      R => clear
    );
temp_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => clear,
      I1 => \^clk\,
      O => temp_i_1_n_0
    );
temp_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => temp_i_1_n_0,
      Q => \^clk\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_divider_0 is
  port (
    CLK : out STD_LOGIC;
    CLK100MHZ_IBUF_BUFG : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of clk_divider_0 : entity is "clk_divider";
end clk_divider_0;

architecture STRUCTURE of clk_divider_0 is
  signal \^clk\ : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal \count0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \count0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \count0_carry__0_i_3__0_n_0\ : STD_LOGIC;
  signal \count0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \count0_carry__0_n_0\ : STD_LOGIC;
  signal \count0_carry__0_n_1\ : STD_LOGIC;
  signal \count0_carry__0_n_2\ : STD_LOGIC;
  signal \count0_carry__0_n_3\ : STD_LOGIC;
  signal \count0_carry__1_i_1__0_n_0\ : STD_LOGIC;
  signal \count0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \count0_carry__1_n_3\ : STD_LOGIC;
  signal \count0_carry_i_1__0_n_0\ : STD_LOGIC;
  signal \count0_carry_i_2__0_n_0\ : STD_LOGIC;
  signal \count0_carry_i_3__0_n_0\ : STD_LOGIC;
  signal \count0_carry_i_4__0_n_0\ : STD_LOGIC;
  signal count0_carry_n_0 : STD_LOGIC;
  signal count0_carry_n_1 : STD_LOGIC;
  signal count0_carry_n_2 : STD_LOGIC;
  signal count0_carry_n_3 : STD_LOGIC;
  signal \count[0]_i_2__0_n_0\ : STD_LOGIC;
  signal count_reg : STD_LOGIC_VECTOR ( 27 downto 0 );
  signal \count_reg[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_reg[0]_i_1__0_n_1\ : STD_LOGIC;
  signal \count_reg[0]_i_1__0_n_2\ : STD_LOGIC;
  signal \count_reg[0]_i_1__0_n_3\ : STD_LOGIC;
  signal \count_reg[0]_i_1__0_n_4\ : STD_LOGIC;
  signal \count_reg[0]_i_1__0_n_5\ : STD_LOGIC;
  signal \count_reg[0]_i_1__0_n_6\ : STD_LOGIC;
  signal \count_reg[0]_i_1__0_n_7\ : STD_LOGIC;
  signal \count_reg[12]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_reg[12]_i_1__0_n_1\ : STD_LOGIC;
  signal \count_reg[12]_i_1__0_n_2\ : STD_LOGIC;
  signal \count_reg[12]_i_1__0_n_3\ : STD_LOGIC;
  signal \count_reg[12]_i_1__0_n_4\ : STD_LOGIC;
  signal \count_reg[12]_i_1__0_n_5\ : STD_LOGIC;
  signal \count_reg[12]_i_1__0_n_6\ : STD_LOGIC;
  signal \count_reg[12]_i_1__0_n_7\ : STD_LOGIC;
  signal \count_reg[16]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_reg[16]_i_1__0_n_1\ : STD_LOGIC;
  signal \count_reg[16]_i_1__0_n_2\ : STD_LOGIC;
  signal \count_reg[16]_i_1__0_n_3\ : STD_LOGIC;
  signal \count_reg[16]_i_1__0_n_4\ : STD_LOGIC;
  signal \count_reg[16]_i_1__0_n_5\ : STD_LOGIC;
  signal \count_reg[16]_i_1__0_n_6\ : STD_LOGIC;
  signal \count_reg[16]_i_1__0_n_7\ : STD_LOGIC;
  signal \count_reg[20]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_reg[20]_i_1__0_n_1\ : STD_LOGIC;
  signal \count_reg[20]_i_1__0_n_2\ : STD_LOGIC;
  signal \count_reg[20]_i_1__0_n_3\ : STD_LOGIC;
  signal \count_reg[20]_i_1__0_n_4\ : STD_LOGIC;
  signal \count_reg[20]_i_1__0_n_5\ : STD_LOGIC;
  signal \count_reg[20]_i_1__0_n_6\ : STD_LOGIC;
  signal \count_reg[20]_i_1__0_n_7\ : STD_LOGIC;
  signal \count_reg[24]_i_1__0_n_1\ : STD_LOGIC;
  signal \count_reg[24]_i_1__0_n_2\ : STD_LOGIC;
  signal \count_reg[24]_i_1__0_n_3\ : STD_LOGIC;
  signal \count_reg[24]_i_1__0_n_4\ : STD_LOGIC;
  signal \count_reg[24]_i_1__0_n_5\ : STD_LOGIC;
  signal \count_reg[24]_i_1__0_n_6\ : STD_LOGIC;
  signal \count_reg[24]_i_1__0_n_7\ : STD_LOGIC;
  signal \count_reg[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_reg[4]_i_1__0_n_1\ : STD_LOGIC;
  signal \count_reg[4]_i_1__0_n_2\ : STD_LOGIC;
  signal \count_reg[4]_i_1__0_n_3\ : STD_LOGIC;
  signal \count_reg[4]_i_1__0_n_4\ : STD_LOGIC;
  signal \count_reg[4]_i_1__0_n_5\ : STD_LOGIC;
  signal \count_reg[4]_i_1__0_n_6\ : STD_LOGIC;
  signal \count_reg[4]_i_1__0_n_7\ : STD_LOGIC;
  signal \count_reg[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_reg[8]_i_1__0_n_1\ : STD_LOGIC;
  signal \count_reg[8]_i_1__0_n_2\ : STD_LOGIC;
  signal \count_reg[8]_i_1__0_n_3\ : STD_LOGIC;
  signal \count_reg[8]_i_1__0_n_4\ : STD_LOGIC;
  signal \count_reg[8]_i_1__0_n_5\ : STD_LOGIC;
  signal \count_reg[8]_i_1__0_n_6\ : STD_LOGIC;
  signal \count_reg[8]_i_1__0_n_7\ : STD_LOGIC;
  signal \temp_i_1__0_n_0\ : STD_LOGIC;
  signal NLW_count0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_count0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_count0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_count0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_count_reg[24]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_reg[0]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \count_reg[12]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \count_reg[16]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \count_reg[20]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \count_reg[24]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \count_reg[4]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \count_reg[8]_i_1__0\ : label is 11;
begin
  CLK <= \^clk\;
count0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => count0_carry_n_0,
      CO(2) => count0_carry_n_1,
      CO(1) => count0_carry_n_2,
      CO(0) => count0_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_count0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => \count0_carry_i_1__0_n_0\,
      S(2) => \count0_carry_i_2__0_n_0\,
      S(1) => \count0_carry_i_3__0_n_0\,
      S(0) => \count0_carry_i_4__0_n_0\
    );
\count0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => count0_carry_n_0,
      CO(3) => \count0_carry__0_n_0\,
      CO(2) => \count0_carry__0_n_1\,
      CO(1) => \count0_carry__0_n_2\,
      CO(0) => \count0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_count0_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \count0_carry__0_i_1_n_0\,
      S(2) => \count0_carry__0_i_2_n_0\,
      S(1) => \count0_carry__0_i_3__0_n_0\,
      S(0) => \count0_carry__0_i_4_n_0\
    );
\count0_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => count_reg(21),
      I1 => Q(2),
      I2 => Q(4),
      I3 => count_reg(23),
      I4 => Q(3),
      I5 => count_reg(22),
      O => \count0_carry__0_i_1_n_0\
    );
\count0_carry__0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00009009"
    )
        port map (
      I0 => Q(1),
      I1 => count_reg(20),
      I2 => Q(0),
      I3 => count_reg(19),
      I4 => count_reg(18),
      O => \count0_carry__0_i_2_n_0\
    );
\count0_carry__0_i_3__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => count_reg(15),
      I1 => count_reg(16),
      I2 => count_reg(17),
      O => \count0_carry__0_i_3__0_n_0\
    );
\count0_carry__0_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => count_reg(12),
      I1 => count_reg(14),
      I2 => count_reg(13),
      O => \count0_carry__0_i_4_n_0\
    );
\count0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count0_carry__0_n_0\,
      CO(3 downto 2) => \NLW_count0_carry__1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => clear,
      CO(0) => \count0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_count0_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \count0_carry__1_i_1__0_n_0\,
      S(0) => \count0_carry__1_i_2_n_0\
    );
\count0_carry__1_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_reg(27),
      O => \count0_carry__1_i_1__0_n_0\
    );
\count0_carry__1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => count_reg(24),
      I1 => Q(5),
      I2 => Q(7),
      I3 => count_reg(26),
      I4 => Q(6),
      I5 => count_reg(25),
      O => \count0_carry__1_i_2_n_0\
    );
\count0_carry_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => count_reg(11),
      I1 => count_reg(10),
      I2 => count_reg(9),
      O => \count0_carry_i_1__0_n_0\
    );
\count0_carry_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => count_reg(8),
      I1 => count_reg(7),
      I2 => count_reg(6),
      O => \count0_carry_i_2__0_n_0\
    );
\count0_carry_i_3__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => count_reg(5),
      I1 => count_reg(4),
      I2 => count_reg(3),
      O => \count0_carry_i_3__0_n_0\
    );
\count0_carry_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => count_reg(2),
      I1 => count_reg(1),
      I2 => count_reg(0),
      O => \count0_carry_i_4__0_n_0\
    );
\count[0]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_reg(0),
      O => \count[0]_i_2__0_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[0]_i_1__0_n_7\,
      Q => count_reg(0),
      R => clear
    );
\count_reg[0]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_reg[0]_i_1__0_n_0\,
      CO(2) => \count_reg[0]_i_1__0_n_1\,
      CO(1) => \count_reg[0]_i_1__0_n_2\,
      CO(0) => \count_reg[0]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_reg[0]_i_1__0_n_4\,
      O(2) => \count_reg[0]_i_1__0_n_5\,
      O(1) => \count_reg[0]_i_1__0_n_6\,
      O(0) => \count_reg[0]_i_1__0_n_7\,
      S(3 downto 1) => count_reg(3 downto 1),
      S(0) => \count[0]_i_2__0_n_0\
    );
\count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[8]_i_1__0_n_5\,
      Q => count_reg(10),
      R => clear
    );
\count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[8]_i_1__0_n_4\,
      Q => count_reg(11),
      R => clear
    );
\count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[12]_i_1__0_n_7\,
      Q => count_reg(12),
      R => clear
    );
\count_reg[12]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[8]_i_1__0_n_0\,
      CO(3) => \count_reg[12]_i_1__0_n_0\,
      CO(2) => \count_reg[12]_i_1__0_n_1\,
      CO(1) => \count_reg[12]_i_1__0_n_2\,
      CO(0) => \count_reg[12]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[12]_i_1__0_n_4\,
      O(2) => \count_reg[12]_i_1__0_n_5\,
      O(1) => \count_reg[12]_i_1__0_n_6\,
      O(0) => \count_reg[12]_i_1__0_n_7\,
      S(3 downto 0) => count_reg(15 downto 12)
    );
\count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[12]_i_1__0_n_6\,
      Q => count_reg(13),
      R => clear
    );
\count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[12]_i_1__0_n_5\,
      Q => count_reg(14),
      R => clear
    );
\count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[12]_i_1__0_n_4\,
      Q => count_reg(15),
      R => clear
    );
\count_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[16]_i_1__0_n_7\,
      Q => count_reg(16),
      R => clear
    );
\count_reg[16]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[12]_i_1__0_n_0\,
      CO(3) => \count_reg[16]_i_1__0_n_0\,
      CO(2) => \count_reg[16]_i_1__0_n_1\,
      CO(1) => \count_reg[16]_i_1__0_n_2\,
      CO(0) => \count_reg[16]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[16]_i_1__0_n_4\,
      O(2) => \count_reg[16]_i_1__0_n_5\,
      O(1) => \count_reg[16]_i_1__0_n_6\,
      O(0) => \count_reg[16]_i_1__0_n_7\,
      S(3 downto 0) => count_reg(19 downto 16)
    );
\count_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[16]_i_1__0_n_6\,
      Q => count_reg(17),
      R => clear
    );
\count_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[16]_i_1__0_n_5\,
      Q => count_reg(18),
      R => clear
    );
\count_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[16]_i_1__0_n_4\,
      Q => count_reg(19),
      R => clear
    );
\count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[0]_i_1__0_n_6\,
      Q => count_reg(1),
      R => clear
    );
\count_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[20]_i_1__0_n_7\,
      Q => count_reg(20),
      R => clear
    );
\count_reg[20]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[16]_i_1__0_n_0\,
      CO(3) => \count_reg[20]_i_1__0_n_0\,
      CO(2) => \count_reg[20]_i_1__0_n_1\,
      CO(1) => \count_reg[20]_i_1__0_n_2\,
      CO(0) => \count_reg[20]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[20]_i_1__0_n_4\,
      O(2) => \count_reg[20]_i_1__0_n_5\,
      O(1) => \count_reg[20]_i_1__0_n_6\,
      O(0) => \count_reg[20]_i_1__0_n_7\,
      S(3 downto 0) => count_reg(23 downto 20)
    );
\count_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[20]_i_1__0_n_6\,
      Q => count_reg(21),
      R => clear
    );
\count_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[20]_i_1__0_n_5\,
      Q => count_reg(22),
      R => clear
    );
\count_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[20]_i_1__0_n_4\,
      Q => count_reg(23),
      R => clear
    );
\count_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[24]_i_1__0_n_7\,
      Q => count_reg(24),
      R => clear
    );
\count_reg[24]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[20]_i_1__0_n_0\,
      CO(3) => \NLW_count_reg[24]_i_1__0_CO_UNCONNECTED\(3),
      CO(2) => \count_reg[24]_i_1__0_n_1\,
      CO(1) => \count_reg[24]_i_1__0_n_2\,
      CO(0) => \count_reg[24]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[24]_i_1__0_n_4\,
      O(2) => \count_reg[24]_i_1__0_n_5\,
      O(1) => \count_reg[24]_i_1__0_n_6\,
      O(0) => \count_reg[24]_i_1__0_n_7\,
      S(3 downto 0) => count_reg(27 downto 24)
    );
\count_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[24]_i_1__0_n_6\,
      Q => count_reg(25),
      R => clear
    );
\count_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[24]_i_1__0_n_5\,
      Q => count_reg(26),
      R => clear
    );
\count_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[24]_i_1__0_n_4\,
      Q => count_reg(27),
      R => clear
    );
\count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[0]_i_1__0_n_5\,
      Q => count_reg(2),
      R => clear
    );
\count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[0]_i_1__0_n_4\,
      Q => count_reg(3),
      R => clear
    );
\count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[4]_i_1__0_n_7\,
      Q => count_reg(4),
      R => clear
    );
\count_reg[4]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[0]_i_1__0_n_0\,
      CO(3) => \count_reg[4]_i_1__0_n_0\,
      CO(2) => \count_reg[4]_i_1__0_n_1\,
      CO(1) => \count_reg[4]_i_1__0_n_2\,
      CO(0) => \count_reg[4]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[4]_i_1__0_n_4\,
      O(2) => \count_reg[4]_i_1__0_n_5\,
      O(1) => \count_reg[4]_i_1__0_n_6\,
      O(0) => \count_reg[4]_i_1__0_n_7\,
      S(3 downto 0) => count_reg(7 downto 4)
    );
\count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[4]_i_1__0_n_6\,
      Q => count_reg(5),
      R => clear
    );
\count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[4]_i_1__0_n_5\,
      Q => count_reg(6),
      R => clear
    );
\count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[4]_i_1__0_n_4\,
      Q => count_reg(7),
      R => clear
    );
\count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[8]_i_1__0_n_7\,
      Q => count_reg(8),
      R => clear
    );
\count_reg[8]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[4]_i_1__0_n_0\,
      CO(3) => \count_reg[8]_i_1__0_n_0\,
      CO(2) => \count_reg[8]_i_1__0_n_1\,
      CO(1) => \count_reg[8]_i_1__0_n_2\,
      CO(0) => \count_reg[8]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[8]_i_1__0_n_4\,
      O(2) => \count_reg[8]_i_1__0_n_5\,
      O(1) => \count_reg[8]_i_1__0_n_6\,
      O(0) => \count_reg[8]_i_1__0_n_7\,
      S(3 downto 0) => count_reg(11 downto 8)
    );
\count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \count_reg[8]_i_1__0_n_6\,
      Q => count_reg(9),
      R => clear
    );
\temp_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => clear,
      I1 => \^clk\,
      O => \temp_i_1__0_n_0\
    );
temp_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \temp_i_1__0_n_0\,
      Q => \^clk\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity counter_3b is
  port (
    \ENCODED_DISPLAY_INPUT_SELECT_OUT_reg[2]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \ENCODED_DISPLAY_INPUT_SELECT_OUT_reg[1]\ : out STD_LOGIC;
    \count_reg[2]_0\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \count_reg[0]_0\ : out STD_LOGIC;
    \ENCODED_DISPLAY_INPUT_SELECT_OUT_reg[0]\ : out STD_LOGIC;
    \count_reg[2]_1\ : out STD_LOGIC;
    \count_reg[1]_0\ : out STD_LOGIC;
    AN_OBUF : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 );
    g0_b0_i_1 : in STD_LOGIC;
    BCD_BUS_OUT : in STD_LOGIC_VECTOR ( 5 downto 0 );
    g0_b0_i_3_0 : in STD_LOGIC;
    count_reg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    g0_b0_i_2_0 : in STD_LOGIC;
    CLK : in STD_LOGIC
  );
end counter_3b;

architecture STRUCTURE of counter_3b is
  signal \^encoded_display_input_select_out_reg[0]\ : STD_LOGIC;
  signal \^encoded_display_input_select_out_reg[1]\ : STD_LOGIC;
  signal \^count_reg[2]_0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \ff12/ff0/DEC_OUT20_in\ : STD_LOGIC;
  signal g0_b0_i_10_n_0 : STD_LOGIC;
  signal g0_b0_i_12_n_0 : STD_LOGIC;
  signal g0_b0_i_17_n_0 : STD_LOGIC;
  signal g0_b0_i_20_n_0 : STD_LOGIC;
  signal g0_b0_i_21_n_0 : STD_LOGIC;
  signal g0_b0_i_22_n_0 : STD_LOGIC;
  signal g0_b0_i_8_n_0 : STD_LOGIC;
  signal g0_b0_i_9_n_0 : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 2 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \AN_OBUF[0]_inst_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \AN_OBUF[1]_inst_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \AN_OBUF[2]_inst_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \AN_OBUF[3]_inst_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \AN_OBUF[4]_inst_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \AN_OBUF[5]_inst_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \AN_OBUF[6]_inst_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \AN_OBUF[7]_inst_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \count[1]_i_1__6\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of g0_b0_i_11 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of g0_b0_i_15 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of g0_b0_i_16 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of g0_b0_i_17 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of g0_b0_i_21 : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of g0_b0_i_22 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of g0_b0_i_7 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of g0_b0_i_8 : label is "soft_lutpair11";
begin
  \ENCODED_DISPLAY_INPUT_SELECT_OUT_reg[0]\ <= \^encoded_display_input_select_out_reg[0]\;
  \ENCODED_DISPLAY_INPUT_SELECT_OUT_reg[1]\ <= \^encoded_display_input_select_out_reg[1]\;
  \count_reg[2]_0\(2 downto 0) <= \^count_reg[2]_0\(2 downto 0);
\AN_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^count_reg[2]_0\(1),
      I1 => \^count_reg[2]_0\(0),
      I2 => \^count_reg[2]_0\(2),
      O => AN_OBUF(0)
    );
\AN_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => \^count_reg[2]_0\(0),
      I1 => \^count_reg[2]_0\(1),
      I2 => \^count_reg[2]_0\(2),
      O => AN_OBUF(1)
    );
\AN_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => \^count_reg[2]_0\(1),
      I1 => \^count_reg[2]_0\(0),
      I2 => \^count_reg[2]_0\(2),
      O => AN_OBUF(2)
    );
\AN_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F7"
    )
        port map (
      I0 => \^count_reg[2]_0\(1),
      I1 => \^count_reg[2]_0\(0),
      I2 => \^count_reg[2]_0\(2),
      O => AN_OBUF(3)
    );
\AN_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => \^count_reg[2]_0\(1),
      I1 => \^count_reg[2]_0\(0),
      I2 => \^count_reg[2]_0\(2),
      O => AN_OBUF(4)
    );
\AN_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => \^count_reg[2]_0\(0),
      I1 => \^count_reg[2]_0\(1),
      I2 => \^count_reg[2]_0\(2),
      O => AN_OBUF(5)
    );
\AN_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => \^count_reg[2]_0\(1),
      I1 => \^count_reg[2]_0\(0),
      I2 => \^count_reg[2]_0\(2),
      O => AN_OBUF(6)
    );
\AN_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \^count_reg[2]_0\(1),
      I1 => \^count_reg[2]_0\(0),
      I2 => \^count_reg[2]_0\(2),
      O => AN_OBUF(7)
    );
\count[0]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^count_reg[2]_0\(0),
      O => \ff12/ff0/DEC_OUT20_in\
    );
\count[1]_i_1__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^count_reg[2]_0\(1),
      I1 => \^count_reg[2]_0\(0),
      O => plusOp(1)
    );
\count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \^count_reg[2]_0\(2),
      I1 => \^count_reg[2]_0\(0),
      I2 => \^count_reg[2]_0\(1),
      O => plusOp(2)
    );
\count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \ff12/ff0/DEC_OUT20_in\,
      Q => \^count_reg[2]_0\(0),
      R => '0'
    );
\count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => plusOp(1),
      Q => \^count_reg[2]_0\(1),
      R => '0'
    );
\count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => plusOp(2),
      Q => \^count_reg[2]_0\(2),
      R => '0'
    );
g0_b0_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2E002E0000FF0000"
    )
        port map (
      I0 => g0_b0_i_20_n_0,
      I1 => count_reg(3),
      I2 => g0_b0_i_21_n_0,
      I3 => Q(1),
      I4 => g0_b0_i_22_n_0,
      I5 => Q(0),
      O => g0_b0_i_10_n_0
    );
g0_b0_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C800"
    )
        port map (
      I0 => Q(0),
      I1 => \^count_reg[2]_0\(2),
      I2 => \^count_reg[2]_0\(0),
      I3 => \^count_reg[2]_0\(1),
      O => \^encoded_display_input_select_out_reg[0]\
    );
g0_b0_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F4AFFFF4F4A0000"
    )
        port map (
      I0 => \^count_reg[2]_0\(1),
      I1 => BCD_BUS_OUT(5),
      I2 => \^count_reg[2]_0\(0),
      I3 => BCD_BUS_OUT(2),
      I4 => \^count_reg[2]_0\(2),
      I5 => g0_b0_i_3_0,
      O => g0_b0_i_12_n_0
    );
g0_b0_i_15: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^count_reg[2]_0\(1),
      I1 => \^count_reg[2]_0\(2),
      O => \count_reg[1]_0\
    );
g0_b0_i_16: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \^count_reg[2]_0\(2),
      I1 => \^count_reg[2]_0\(1),
      I2 => \^count_reg[2]_0\(0),
      I3 => Q(0),
      O => \count_reg[2]_1\
    );
g0_b0_i_17: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E5E0"
    )
        port map (
      I0 => \^count_reg[2]_0\(1),
      I1 => BCD_BUS_OUT(3),
      I2 => \^count_reg[2]_0\(0),
      I3 => BCD_BUS_OUT(0),
      O => g0_b0_i_17_n_0
    );
g0_b0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B888B888B8BBB888"
    )
        port map (
      I0 => \^encoded_display_input_select_out_reg[1]\,
      I1 => Q(2),
      I2 => g0_b0_i_8_n_0,
      I3 => Q(1),
      I4 => g0_b0_i_9_n_0,
      I5 => Q(0),
      O => \ENCODED_DISPLAY_INPUT_SELECT_OUT_reg[2]\(0)
    );
g0_b0_i_20: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7777757751551011"
    )
        port map (
      I0 => \^count_reg[2]_0\(2),
      I1 => \^count_reg[2]_0\(1),
      I2 => count_reg(0),
      I3 => \^count_reg[2]_0\(0),
      I4 => count_reg(1),
      I5 => count_reg(2),
      O => g0_b0_i_20_n_0
    );
g0_b0_i_21: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^count_reg[2]_0\(2),
      I1 => \^count_reg[2]_0\(1),
      O => g0_b0_i_21_n_0
    );
g0_b0_i_22: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \^count_reg[2]_0\(0),
      I1 => \^count_reg[2]_0\(1),
      I2 => \^count_reg[2]_0\(2),
      O => g0_b0_i_22_n_0
    );
g0_b0_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B888B888B8BBB888"
    )
        port map (
      I0 => g0_b0_i_10_n_0,
      I1 => Q(2),
      I2 => \^encoded_display_input_select_out_reg[0]\,
      I3 => Q(1),
      I4 => g0_b0_i_12_n_0,
      I5 => Q(0),
      O => \ENCODED_DISPLAY_INPUT_SELECT_OUT_reg[2]\(1)
    );
g0_b0_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F400F0F4F400000"
    )
        port map (
      I0 => \^count_reg[2]_0\(0),
      I1 => \^count_reg[2]_0\(1),
      I2 => Q(0),
      I3 => g0_b0_i_17_n_0,
      I4 => \^count_reg[2]_0\(2),
      I5 => g0_b0_i_1,
      O => \count_reg[0]_0\
    );
g0_b0_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE888888"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => \^count_reg[2]_0\(0),
      I3 => \^count_reg[2]_0\(1),
      I4 => \^count_reg[2]_0\(2),
      O => \^encoded_display_input_select_out_reg[1]\
    );
g0_b0_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8400"
    )
        port map (
      I0 => Q(0),
      I1 => \^count_reg[2]_0\(2),
      I2 => \^count_reg[2]_0\(0),
      I3 => \^count_reg[2]_0\(1),
      O => g0_b0_i_8_n_0
    );
g0_b0_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5E0FFFFE5E00000"
    )
        port map (
      I0 => \^count_reg[2]_0\(1),
      I1 => BCD_BUS_OUT(4),
      I2 => \^count_reg[2]_0\(0),
      I3 => BCD_BUS_OUT(1),
      I4 => \^count_reg[2]_0\(2),
      I5 => g0_b0_i_2_0,
      O => g0_b0_i_9_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity counter_decade is
  port (
    tick_0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \count_reg[1]_0\ : out STD_LOGIC;
    CLK : in STD_LOGIC;
    REACTION_TIME_COUNT_EN_OUT : in STD_LOGIC;
    \SEGMENT_LIGHT_OUT_reg[0]_i_1\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \SEGMENT_LIGHT_OUT_reg[0]_i_1_0\ : in STD_LOGIC;
    \SEGMENT_LIGHT_OUT_reg[0]_i_2_0\ : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end counter_decade;

architecture STRUCTURE of counter_decade is
  signal \^q\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \SEGMENT_LIGHT_OUT_reg[0]_i_4_n_0\ : STD_LOGIC;
  signal \SEGMENT_LIGHT_OUT_reg[0]_i_8_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^tick_0\ : STD_LOGIC;
  signal \tick__0_i_1_n_0\ : STD_LOGIC;
  signal \tick__0_i_2_n_0\ : STD_LOGIC;
  signal tick_i_1_n_0 : STD_LOGIC;
  signal \tick_reg__0_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1__2\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \count[1]_i_1__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \count[2]_i_1__1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \count[3]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \count[4]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \tick__0_i_2\ : label is "soft_lutpair22";
begin
  Q(4 downto 0) <= \^q\(4 downto 0);
  tick_0 <= \^tick_0\;
\SEGMENT_LIGHT_OUT_reg[0]_i_2\: unisim.vcomponents.MUXF8
     port map (
      I0 => \SEGMENT_LIGHT_OUT_reg[0]_i_4_n_0\,
      I1 => \SEGMENT_LIGHT_OUT_reg[0]_i_1_0\,
      O => \count_reg[1]_0\,
      S => \SEGMENT_LIGHT_OUT_reg[0]_i_1\(1)
    );
\SEGMENT_LIGHT_OUT_reg[0]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SEGMENT_LIGHT_OUT_reg[0]_i_8_n_0\,
      I1 => \SEGMENT_LIGHT_OUT_reg[0]_i_2_0\,
      O => \SEGMENT_LIGHT_OUT_reg[0]_i_4_n_0\,
      S => \SEGMENT_LIGHT_OUT_reg[0]_i_1\(0)
    );
\SEGMENT_LIGHT_OUT_reg[0]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0015FFFF"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(2),
      I4 => \^q\(4),
      O => \SEGMENT_LIGHT_OUT_reg[0]_i_8_n_0\
    );
\count[0]_i_1__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => p_0_in(0)
    );
\count[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FFEF00"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(3),
      I3 => \^q\(0),
      I4 => \^q\(1),
      O => p_0_in(1)
    );
\count[2]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      O => p_0_in(2)
    );
\count[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3CCCC8CC"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(3),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \^q\(2),
      O => p_0_in(3)
    );
\count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(3),
      O => p_0_in(4)
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => p_0_in(0),
      Q => \^q\(0)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => p_0_in(1),
      Q => \^q\(1)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => p_0_in(2),
      Q => \^q\(2)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => p_0_in(3),
      Q => \^q\(3)
    );
\count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => p_0_in(4),
      Q => \^q\(4)
    );
\tick__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFFFF01000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \tick__0_i_2_n_0\,
      I2 => \^q\(2),
      I3 => \^q\(3),
      I4 => REACTION_TIME_COUNT_EN_OUT,
      I5 => \^tick_0\,
      O => \tick__0_i_1_n_0\
    );
\tick__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      O => \tick__0_i_2_n_0\
    );
tick_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \tick_reg__0_n_0\,
      I1 => \^tick_0\,
      O => tick_i_1_n_0
    );
tick_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => tick_i_1_n_0,
      Q => \^tick_0\,
      R => '0'
    );
\tick_reg__0\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \tick__0_i_1_n_0\,
      Q => \tick_reg__0_n_0\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity counter_decade_1 is
  port (
    tick_1 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \count_reg[3]_0\ : out STD_LOGIC;
    CLK : in STD_LOGIC;
    REACTION_TIME_COUNT_EN_OUT : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of counter_decade_1 : entity is "counter_decade";
end counter_decade_1;

architecture STRUCTURE of counter_decade_1 is
  signal \^q\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \count[0]_i_1__3_n_0\ : STD_LOGIC;
  signal \count[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \count[2]_i_1__2_n_0\ : STD_LOGIC;
  signal \count[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \count[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \^tick_1\ : STD_LOGIC;
  signal \tick__0_i_1__0_n_0\ : STD_LOGIC;
  signal \tick__0_i_2__0_n_0\ : STD_LOGIC;
  signal \tick_i_1__0_n_0\ : STD_LOGIC;
  signal \tick_reg__0_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1__3\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \count[1]_i_1__1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \count[2]_i_1__2\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \count[3]_i_1__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \count[4]_i_1__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \tick__0_i_2__0\ : label is "soft_lutpair25";
begin
  Q(4 downto 0) <= \^q\(4 downto 0);
  tick_1 <= \^tick_1\;
\SEGMENT_LIGHT_OUT_reg[0]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0015FFFF"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(2),
      I4 => \^q\(4),
      O => \count_reg[3]_0\
    );
\count[0]_i_1__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \count[0]_i_1__3_n_0\
    );
\count[1]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FFEF00"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(3),
      I3 => \^q\(0),
      I4 => \^q\(1),
      O => \count[1]_i_1__1_n_0\
    );
\count[2]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      O => \count[2]_i_1__2_n_0\
    );
\count[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3CCCC8CC"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(3),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \^q\(2),
      O => \count[3]_i_1__0_n_0\
    );
\count[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(3),
      O => \count[4]_i_1__0_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[0]_i_1__3_n_0\,
      Q => \^q\(0)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[1]_i_1__1_n_0\,
      Q => \^q\(1)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[2]_i_1__2_n_0\,
      Q => \^q\(2)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[3]_i_1__0_n_0\,
      Q => \^q\(3)
    );
\count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[4]_i_1__0_n_0\,
      Q => \^q\(4)
    );
\tick__0_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFFFF01000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \tick__0_i_2__0_n_0\,
      I2 => \^q\(2),
      I3 => \^q\(3),
      I4 => REACTION_TIME_COUNT_EN_OUT,
      I5 => \^tick_1\,
      O => \tick__0_i_1__0_n_0\
    );
\tick__0_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      O => \tick__0_i_2__0_n_0\
    );
\tick_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \tick_reg__0_n_0\,
      I1 => \^tick_1\,
      O => \tick_i_1__0_n_0\
    );
tick_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \tick_i_1__0_n_0\,
      Q => \^tick_1\,
      R => '0'
    );
\tick_reg__0\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \tick__0_i_1__0_n_0\,
      Q => \tick_reg__0_n_0\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity counter_decade_2 is
  port (
    tick_2 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \count_reg[0]_0\ : out STD_LOGIC;
    CLK : in STD_LOGIC;
    REACTION_TIME_COUNT_EN_OUT : in STD_LOGIC;
    \SEGMENT_LIGHT_OUT_reg[0]_i_2\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \SEGMENT_LIGHT_OUT_reg[0]_i_2_0\ : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of counter_decade_2 : entity is "counter_decade";
end counter_decade_2;

architecture STRUCTURE of counter_decade_2 is
  signal \^q\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \SEGMENT_LIGHT_OUT_reg[0]_i_10_n_0\ : STD_LOGIC;
  signal \count[0]_i_1__4_n_0\ : STD_LOGIC;
  signal \count[1]_i_1__2_n_0\ : STD_LOGIC;
  signal \count[2]_i_1__3_n_0\ : STD_LOGIC;
  signal \count[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \count[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \^tick_2\ : STD_LOGIC;
  signal \tick__0_i_1__1_n_0\ : STD_LOGIC;
  signal \tick__0_i_2__1_n_0\ : STD_LOGIC;
  signal \tick_i_1__1_n_0\ : STD_LOGIC;
  signal \tick_reg__0_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1__4\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \count[1]_i_1__2\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \count[2]_i_1__3\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \count[3]_i_1__1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \count[4]_i_1__1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \tick__0_i_2__1\ : label is "soft_lutpair28";
begin
  Q(4 downto 0) <= \^q\(4 downto 0);
  tick_2 <= \^tick_2\;
\SEGMENT_LIGHT_OUT_reg[0]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0015FFFF"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(2),
      I4 => \^q\(4),
      O => \SEGMENT_LIGHT_OUT_reg[0]_i_10_n_0\
    );
\SEGMENT_LIGHT_OUT_reg[0]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SEGMENT_LIGHT_OUT_reg[0]_i_10_n_0\,
      I1 => \SEGMENT_LIGHT_OUT_reg[0]_i_2_0\,
      O => \count_reg[0]_0\,
      S => \SEGMENT_LIGHT_OUT_reg[0]_i_2\(0)
    );
\count[0]_i_1__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \count[0]_i_1__4_n_0\
    );
\count[1]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FFEF00"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(3),
      I3 => \^q\(0),
      I4 => \^q\(1),
      O => \count[1]_i_1__2_n_0\
    );
\count[2]_i_1__3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      O => \count[2]_i_1__3_n_0\
    );
\count[3]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3CCCC8CC"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(3),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \^q\(2),
      O => \count[3]_i_1__1_n_0\
    );
\count[4]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(3),
      O => \count[4]_i_1__1_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[0]_i_1__4_n_0\,
      Q => \^q\(0)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[1]_i_1__2_n_0\,
      Q => \^q\(1)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[2]_i_1__3_n_0\,
      Q => \^q\(2)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[3]_i_1__1_n_0\,
      Q => \^q\(3)
    );
\count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[4]_i_1__1_n_0\,
      Q => \^q\(4)
    );
\tick__0_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFFFF01000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \tick__0_i_2__1_n_0\,
      I2 => \^q\(2),
      I3 => \^q\(3),
      I4 => REACTION_TIME_COUNT_EN_OUT,
      I5 => \^tick_2\,
      O => \tick__0_i_1__1_n_0\
    );
\tick__0_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      O => \tick__0_i_2__1_n_0\
    );
\tick_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \tick_reg__0_n_0\,
      I1 => \^tick_2\,
      O => \tick_i_1__1_n_0\
    );
tick_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \tick_i_1__1_n_0\,
      Q => \^tick_2\,
      R => '0'
    );
\tick_reg__0\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \tick__0_i_1__1_n_0\,
      Q => \tick_reg__0_n_0\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity counter_decade_3 is
  port (
    tick_3 : out STD_LOGIC;
    \count_reg[4]_0\ : out STD_LOGIC;
    \count_reg[3]_0\ : out STD_LOGIC;
    \count_reg[2]_0\ : out STD_LOGIC;
    \count_reg[1]_0\ : out STD_LOGIC;
    \count_reg[0]_0\ : out STD_LOGIC;
    \count_reg[3]_1\ : out STD_LOGIC;
    CLK : in STD_LOGIC;
    g0_b0_i_14 : in STD_LOGIC_VECTOR ( 14 downto 0 );
    REACTION_TIME_COUNT_EN_OUT : in STD_LOGIC;
    g0_b0_i_14_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of counter_decade_3 : entity is "counter_decade";
end counter_decade_3;

architecture STRUCTURE of counter_decade_3 is
  signal BCD_BUS_OUT : STD_LOGIC_VECTOR ( 19 downto 15 );
  signal \count[0]_i_1__5_n_0\ : STD_LOGIC;
  signal \count[1]_i_1__3_n_0\ : STD_LOGIC;
  signal \count[2]_i_1__4_n_0\ : STD_LOGIC;
  signal \count[3]_i_1__2_n_0\ : STD_LOGIC;
  signal \count[4]_i_1__2_n_0\ : STD_LOGIC;
  signal \^tick_3\ : STD_LOGIC;
  signal \tick__0_i_1__2_n_0\ : STD_LOGIC;
  signal \tick__0_i_2__2_n_0\ : STD_LOGIC;
  signal \tick_i_1__2_n_0\ : STD_LOGIC;
  signal \tick_reg__0_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1__5\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \count[1]_i_1__3\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \count[2]_i_1__4\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \count[3]_i_1__2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \count[4]_i_1__2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \tick__0_i_2__2\ : label is "soft_lutpair31";
begin
  tick_3 <= \^tick_3\;
\SEGMENT_LIGHT_OUT_reg[0]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0015FFFF"
    )
        port map (
      I0 => BCD_BUS_OUT(18),
      I1 => BCD_BUS_OUT(15),
      I2 => BCD_BUS_OUT(16),
      I3 => BCD_BUS_OUT(17),
      I4 => BCD_BUS_OUT(19),
      O => \count_reg[3]_1\
    );
\count[0]_i_1__5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => BCD_BUS_OUT(15),
      O => \count[0]_i_1__5_n_0\
    );
\count[1]_i_1__3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FFEF00"
    )
        port map (
      I0 => BCD_BUS_OUT(19),
      I1 => BCD_BUS_OUT(17),
      I2 => BCD_BUS_OUT(18),
      I3 => BCD_BUS_OUT(15),
      I4 => BCD_BUS_OUT(16),
      O => \count[1]_i_1__3_n_0\
    );
\count[2]_i_1__4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => BCD_BUS_OUT(17),
      I1 => BCD_BUS_OUT(16),
      I2 => BCD_BUS_OUT(15),
      O => \count[2]_i_1__4_n_0\
    );
\count[3]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3CCCC8CC"
    )
        port map (
      I0 => BCD_BUS_OUT(19),
      I1 => BCD_BUS_OUT(18),
      I2 => BCD_BUS_OUT(16),
      I3 => BCD_BUS_OUT(15),
      I4 => BCD_BUS_OUT(17),
      O => \count[3]_i_1__2_n_0\
    );
\count[4]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => BCD_BUS_OUT(19),
      I1 => BCD_BUS_OUT(17),
      I2 => BCD_BUS_OUT(15),
      I3 => BCD_BUS_OUT(16),
      I4 => BCD_BUS_OUT(18),
      O => \count[4]_i_1__2_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[0]_i_1__5_n_0\,
      Q => BCD_BUS_OUT(15)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[1]_i_1__3_n_0\,
      Q => BCD_BUS_OUT(16)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[2]_i_1__4_n_0\,
      Q => BCD_BUS_OUT(17)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[3]_i_1__2_n_0\,
      Q => BCD_BUS_OUT(18)
    );
\count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[4]_i_1__2_n_0\,
      Q => BCD_BUS_OUT(19)
    );
g0_b0_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => BCD_BUS_OUT(15),
      I1 => g0_b0_i_14(10),
      I2 => g0_b0_i_14_0(1),
      I3 => g0_b0_i_14(5),
      I4 => g0_b0_i_14_0(0),
      I5 => g0_b0_i_14(0),
      O => \count_reg[0]_0\
    );
g0_b0_i_19: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => BCD_BUS_OUT(16),
      I1 => g0_b0_i_14(11),
      I2 => g0_b0_i_14_0(1),
      I3 => g0_b0_i_14(6),
      I4 => g0_b0_i_14_0(0),
      I5 => g0_b0_i_14(1),
      O => \count_reg[1]_0\
    );
g0_b0_i_23: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => BCD_BUS_OUT(17),
      I1 => g0_b0_i_14(12),
      I2 => g0_b0_i_14_0(1),
      I3 => g0_b0_i_14(7),
      I4 => g0_b0_i_14_0(0),
      I5 => g0_b0_i_14(2),
      O => \count_reg[2]_0\
    );
g0_b0_i_24: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => BCD_BUS_OUT(18),
      I1 => g0_b0_i_14(13),
      I2 => g0_b0_i_14_0(1),
      I3 => g0_b0_i_14(8),
      I4 => g0_b0_i_14_0(0),
      I5 => g0_b0_i_14(3),
      O => \count_reg[3]_0\
    );
g0_b0_i_25: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => BCD_BUS_OUT(19),
      I1 => g0_b0_i_14(14),
      I2 => g0_b0_i_14_0(1),
      I3 => g0_b0_i_14(9),
      I4 => g0_b0_i_14_0(0),
      I5 => g0_b0_i_14(4),
      O => \count_reg[4]_0\
    );
\tick__0_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFFFF01000000"
    )
        port map (
      I0 => BCD_BUS_OUT(19),
      I1 => \tick__0_i_2__2_n_0\,
      I2 => BCD_BUS_OUT(17),
      I3 => BCD_BUS_OUT(18),
      I4 => REACTION_TIME_COUNT_EN_OUT,
      I5 => \^tick_3\,
      O => \tick__0_i_1__2_n_0\
    );
\tick__0_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => BCD_BUS_OUT(16),
      I1 => BCD_BUS_OUT(15),
      O => \tick__0_i_2__2_n_0\
    );
\tick_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \tick_reg__0_n_0\,
      I1 => \^tick_3\,
      O => \tick_i_1__2_n_0\
    );
tick_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \tick_i_1__2_n_0\,
      Q => \^tick_3\,
      R => '0'
    );
\tick_reg__0\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \tick__0_i_1__2_n_0\,
      Q => \tick_reg__0_n_0\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity counter_decade_4 is
  port (
    CLK : out STD_LOGIC;
    \count_reg[2]_0\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \count_reg[4]_0\ : out STD_LOGIC;
    \count_reg[3]_0\ : out STD_LOGIC;
    \count_reg[0]_0\ : out STD_LOGIC;
    \count_reg[0]_1\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    REACTION_TIME_COUNT_EN_OUT : in STD_LOGIC;
    g0_b0_i_5 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    g0_b0_i_5_0 : in STD_LOGIC;
    g0_b0_i_4 : in STD_LOGIC;
    \SEGMENT_LIGHT_OUT_reg[0]_i_1\ : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of counter_decade_4 : entity is "counter_decade";
end counter_decade_4;

architecture STRUCTURE of counter_decade_4 is
  signal BCD_BUS_OUT : STD_LOGIC_VECTOR ( 24 downto 23 );
  signal \^clk\ : STD_LOGIC;
  signal \SEGMENT_LIGHT_OUT_reg[0]_i_6_n_0\ : STD_LOGIC;
  signal \count[0]_i_1__6_n_0\ : STD_LOGIC;
  signal \count[1]_i_1__4_n_0\ : STD_LOGIC;
  signal \count[2]_i_1__5_n_0\ : STD_LOGIC;
  signal \count[3]_i_1__3_n_0\ : STD_LOGIC;
  signal \count[4]_i_1__3_n_0\ : STD_LOGIC;
  signal \^count_reg[2]_0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \tick__0_i_1__3_n_0\ : STD_LOGIC;
  signal \tick__0_i_2__3_n_0\ : STD_LOGIC;
  signal \tick_i_1__3_n_0\ : STD_LOGIC;
  signal \tick_reg__0_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \SEGMENT_LIGHT_OUT_reg[0]_i_6\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \count[1]_i_1__4\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \count[2]_i_1__5\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \count[3]_i_1__3\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \count[4]_i_1__3\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \tick__0_i_2__3\ : label is "soft_lutpair34";
begin
  CLK <= \^clk\;
  \count_reg[2]_0\(2 downto 0) <= \^count_reg[2]_0\(2 downto 0);
\SEGMENT_LIGHT_OUT_reg[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFE2"
    )
        port map (
      I0 => \SEGMENT_LIGHT_OUT_reg[0]_i_6_n_0\,
      I1 => g0_b0_i_5(0),
      I2 => \SEGMENT_LIGHT_OUT_reg[0]_i_1\,
      I3 => g0_b0_i_5(1),
      O => \count_reg[0]_0\
    );
\SEGMENT_LIGHT_OUT_reg[0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0015FFFF"
    )
        port map (
      I0 => BCD_BUS_OUT(23),
      I1 => \^count_reg[2]_0\(0),
      I2 => \^count_reg[2]_0\(1),
      I3 => \^count_reg[2]_0\(2),
      I4 => BCD_BUS_OUT(24),
      O => \SEGMENT_LIGHT_OUT_reg[0]_i_6_n_0\
    );
\count[0]_i_1__6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^count_reg[2]_0\(0),
      O => \count[0]_i_1__6_n_0\
    );
\count[1]_i_1__4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FFEF00"
    )
        port map (
      I0 => BCD_BUS_OUT(24),
      I1 => \^count_reg[2]_0\(2),
      I2 => BCD_BUS_OUT(23),
      I3 => \^count_reg[2]_0\(0),
      I4 => \^count_reg[2]_0\(1),
      O => \count[1]_i_1__4_n_0\
    );
\count[2]_i_1__5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \^count_reg[2]_0\(2),
      I1 => \^count_reg[2]_0\(1),
      I2 => \^count_reg[2]_0\(0),
      O => \count[2]_i_1__5_n_0\
    );
\count[3]_i_1__3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3CCCC8CC"
    )
        port map (
      I0 => BCD_BUS_OUT(24),
      I1 => BCD_BUS_OUT(23),
      I2 => \^count_reg[2]_0\(1),
      I3 => \^count_reg[2]_0\(0),
      I4 => \^count_reg[2]_0\(2),
      O => \count[3]_i_1__3_n_0\
    );
\count[4]_i_1__3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => BCD_BUS_OUT(24),
      I1 => \^count_reg[2]_0\(2),
      I2 => \^count_reg[2]_0\(0),
      I3 => \^count_reg[2]_0\(1),
      I4 => BCD_BUS_OUT(23),
      O => \count[4]_i_1__3_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \count_reg[0]_1\,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[0]_i_1__6_n_0\,
      Q => \^count_reg[2]_0\(0)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \count_reg[0]_1\,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[1]_i_1__4_n_0\,
      Q => \^count_reg[2]_0\(1)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \count_reg[0]_1\,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[2]_i_1__5_n_0\,
      Q => \^count_reg[2]_0\(2)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \count_reg[0]_1\,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[3]_i_1__3_n_0\,
      Q => BCD_BUS_OUT(23)
    );
\count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \count_reg[0]_1\,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[4]_i_1__3_n_0\,
      Q => BCD_BUS_OUT(24)
    );
g0_b0_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFE2FFFFFFE20000"
    )
        port map (
      I0 => BCD_BUS_OUT(23),
      I1 => g0_b0_i_5(0),
      I2 => Q(0),
      I3 => g0_b0_i_5(1),
      I4 => g0_b0_i_5(2),
      I5 => g0_b0_i_4,
      O => \count_reg[3]_0\
    );
g0_b0_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => BCD_BUS_OUT(24),
      I1 => g0_b0_i_5(0),
      I2 => Q(1),
      I3 => g0_b0_i_5(1),
      I4 => g0_b0_i_5(2),
      I5 => g0_b0_i_5_0,
      O => \count_reg[4]_0\
    );
\tick__0_i_1__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFFFF01000000"
    )
        port map (
      I0 => BCD_BUS_OUT(24),
      I1 => \tick__0_i_2__3_n_0\,
      I2 => \^count_reg[2]_0\(2),
      I3 => BCD_BUS_OUT(23),
      I4 => REACTION_TIME_COUNT_EN_OUT,
      I5 => \^clk\,
      O => \tick__0_i_1__3_n_0\
    );
\tick__0_i_2__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^count_reg[2]_0\(1),
      I1 => \^count_reg[2]_0\(0),
      O => \tick__0_i_2__3_n_0\
    );
\tick_i_1__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \tick_reg__0_n_0\,
      I1 => \^clk\,
      O => \tick_i_1__3_n_0\
    );
tick_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => \count_reg[0]_1\,
      CE => '1',
      D => \tick_i_1__3_n_0\,
      Q => \^clk\,
      R => '0'
    );
\tick_reg__0\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \count_reg[0]_1\,
      CE => '1',
      D => \tick__0_i_1__3_n_0\,
      Q => \tick_reg__0_n_0\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity counter_decade_5 is
  port (
    Q : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \count_reg[3]_0\ : out STD_LOGIC;
    REACTION_TIME_COUNT_EN_OUT : in STD_LOGIC;
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of counter_decade_5 : entity is "counter_decade";
end counter_decade_5;

architecture STRUCTURE of counter_decade_5 is
  signal \^q\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \count[0]_i_1_n_0\ : STD_LOGIC;
  signal \count[1]_i_1__5_n_0\ : STD_LOGIC;
  signal \count[2]_i_1__6_n_0\ : STD_LOGIC;
  signal \count[3]_i_1__5_n_0\ : STD_LOGIC;
  signal \count[4]_i_1__4_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \SEGMENT_LIGHT_OUT_reg[0]_i_7\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \count[1]_i_1__5\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \count[2]_i_1__6\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \count[3]_i_1__5\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \count[4]_i_1__4\ : label is "soft_lutpair35";
begin
  Q(4 downto 0) <= \^q\(4 downto 0);
\SEGMENT_LIGHT_OUT_reg[0]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0015FFFF"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(4),
      O => \count_reg[3]_0\
    );
\count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \count[0]_i_1_n_0\
    );
\count[1]_i_1__5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00EFFF00"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(0),
      O => \count[1]_i_1__5_n_0\
    );
\count[2]_i_1__6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      O => \count[2]_i_1__6_n_0\
    );
\count[3]_i_1__5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3CCCCC8C"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(3),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(2),
      O => \count[3]_i_1__5_n_0\
    );
\count[4]_i_1__4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \^q\(3),
      O => \count[4]_i_1__4_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[0]_i_1_n_0\,
      Q => \^q\(0)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[1]_i_1__5_n_0\,
      Q => \^q\(1)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[2]_i_1__6_n_0\,
      Q => \^q\(2)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[3]_i_1__5_n_0\,
      Q => \^q\(3)
    );
\count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => REACTION_TIME_COUNT_EN_OUT,
      CLR => AR(0),
      D => \count[4]_i_1__4_n_0\,
      Q => \^q\(4)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dotiey is
  port (
    count_reg : out STD_LOGIC_VECTOR ( 3 downto 0 );
    LED_OBUF : out STD_LOGIC_VECTOR ( 0 to 0 );
    clk_var_hz_switchable : in STD_LOGIC;
    DOTIEY_COUNTDOWN_EN_OUT : in STD_LOGIC
  );
end dotiey;

architecture STRUCTURE of dotiey is
  signal \^led_obuf\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal TIMER_FINISHED_i_1_n_0 : STD_LOGIC;
  signal TIMER_FINISHED_i_2_n_0 : STD_LOGIC;
  signal count : STD_LOGIC;
  signal \^count_reg\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal minusOp : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[2]_i_1__0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \count[3]_i_2\ : label is "soft_lutpair38";
begin
  LED_OBUF(0) <= \^led_obuf\(0);
  count_reg(3 downto 0) <= \^count_reg\(3 downto 0);
TIMER_FINISHED_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00010000"
    )
        port map (
      I0 => \^count_reg\(3),
      I1 => \^count_reg\(1),
      I2 => \^count_reg\(0),
      I3 => \^count_reg\(2),
      I4 => DOTIEY_COUNTDOWN_EN_OUT,
      I5 => \^led_obuf\(0),
      O => TIMER_FINISHED_i_1_n_0
    );
TIMER_FINISHED_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => DOTIEY_COUNTDOWN_EN_OUT,
      O => TIMER_FINISHED_i_2_n_0
    );
TIMER_FINISHED_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_var_hz_switchable,
      CE => '1',
      CLR => TIMER_FINISHED_i_2_n_0,
      D => TIMER_FINISHED_i_1_n_0,
      Q => \^led_obuf\(0)
    );
\count[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^count_reg\(0),
      O => minusOp(0)
    );
\count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^count_reg\(1),
      I1 => \^count_reg\(0),
      O => minusOp(1)
    );
\count[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
        port map (
      I0 => \^count_reg\(2),
      I1 => \^count_reg\(1),
      I2 => \^count_reg\(0),
      O => minusOp(2)
    );
\count[3]_i_1__4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \^count_reg\(3),
      I1 => \^count_reg\(0),
      I2 => \^count_reg\(1),
      I3 => \^count_reg\(2),
      I4 => DOTIEY_COUNTDOWN_EN_OUT,
      O => count
    );
\count[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA9"
    )
        port map (
      I0 => \^count_reg\(3),
      I1 => \^count_reg\(1),
      I2 => \^count_reg\(0),
      I3 => \^count_reg\(2),
      O => minusOp(3)
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_var_hz_switchable,
      CE => count,
      CLR => TIMER_FINISHED_i_2_n_0,
      D => minusOp(0),
      Q => \^count_reg\(0)
    );
\count_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_var_hz_switchable,
      CE => count,
      D => minusOp(1),
      PRE => TIMER_FINISHED_i_2_n_0,
      Q => \^count_reg\(1)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_var_hz_switchable,
      CE => count,
      CLR => TIMER_FINISHED_i_2_n_0,
      D => minusOp(2),
      Q => \^count_reg\(2)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_var_hz_switchable,
      CE => count,
      CLR => TIMER_FINISHED_i_2_n_0,
      D => minusOp(3),
      Q => \^count_reg\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fsm is
  port (
    Q : out STD_LOGIC_VECTOR ( 2 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \out\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \TEMP_OUT_reg[4]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    REACTION_TIME_COUNT_RSET_OUT : out STD_LOGIC;
    DOTIEY_COUNTDOWN_EN_OUT : out STD_LOGIC;
    REACTION_TIME_COUNT_EN_OUT : out STD_LOGIC;
    clk_var_hz_switchable : out STD_LOGIC;
    \SEGMENT_LIGHT_OUT_reg[0]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \SEGMENT_LIGHT_OUT_reg[0]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    g0_b0_0 : in STD_LOGIC;
    g0_b0_1 : in STD_LOGIC;
    g0_b0_2 : in STD_LOGIC;
    g0_b0_3 : in STD_LOGIC;
    g0_b0_4 : in STD_LOGIC;
    g0_b0_5 : in STD_LOGIC;
    g0_b0_6 : in STD_LOGIC;
    \SEGMENT_LIGHT_OUT_reg[0]_1\ : in STD_LOGIC;
    \SEGMENT_LIGHT_OUT_reg[0]_2\ : in STD_LOGIC;
    LED_OBUF : in STD_LOGIC_VECTOR ( 5 downto 0 );
    CLK100MHZ_IBUF_BUFG : in STD_LOGIC;
    CLK : in STD_LOGIC
  );
end fsm;

architecture STRUCTURE of fsm is
  signal CLK_VAR_HZ_SWITCHABLE_OUT_i_1_n_0 : STD_LOGIC;
  signal \ENCODED_DISPLAY_INPUT_SELECT_OUT[0]_i_1_n_0\ : STD_LOGIC;
  signal \ENCODED_DISPLAY_INPUT_SELECT_OUT[1]_i_1_n_0\ : STD_LOGIC;
  signal \ENCODED_DISPLAY_INPUT_SELECT_OUT[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_10_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_7_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_8_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_9_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^reaction_time_count_en_out\ : STD_LOGIC;
  signal REACTION_TIME_COUNT_EN_OUT_i_1_n_0 : STD_LOGIC;
  signal REACTION_TIME_COUNT_RSET_OUT_i_1_n_0 : STD_LOGIC;
  signal REACTION_TIME_COUNT_RSET_OUT_i_2_n_0 : STD_LOGIC;
  signal REACTION_TIME_COUNT_RSET_OUT_i_3_n_0 : STD_LOGIC;
  signal SEG_OUT : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \TEMP_OUT[4]_i_1_n_0\ : STD_LOGIC;
  signal \clk_cycle_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \clk_cycle_count[1]_i_1_n_0\ : STD_LOGIC;
  signal \clk_cycle_count[1]_i_2_n_0\ : STD_LOGIC;
  signal \clk_cycle_count[1]_i_3_n_0\ : STD_LOGIC;
  signal \clk_cycle_count[1]_i_4_n_0\ : STD_LOGIC;
  signal \clk_cycle_count_reg_n_0_[0]\ : STD_LOGIC;
  signal \clk_cycle_count_reg_n_0_[1]\ : STD_LOGIC;
  signal \^clk_var_hz_switchable\ : STD_LOGIC;
  signal last_triggers : STD_LOGIC;
  signal \last_triggers[1]_i_1_n_0\ : STD_LOGIC;
  signal \last_triggers__0\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of CLK_VAR_HZ_SWITCHABLE_OUT_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ENCODED_DISPLAY_INPUT_SELECT_OUT[0]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \ENCODED_DISPLAY_INPUT_SELECT_OUT[1]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \ENCODED_DISPLAY_INPUT_SELECT_OUT[2]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_4\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_5\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_7\ : label is "soft_lutpair1";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "iSTATE:000,iSTATE0:010,iSTATE1:011,iSTATE2:001,iSTATE3:110,iSTATE4:100,iSTATE5:101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "iSTATE:000,iSTATE0:010,iSTATE1:011,iSTATE2:001,iSTATE3:110,iSTATE4:100,iSTATE5:101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "iSTATE:000,iSTATE0:010,iSTATE1:011,iSTATE2:001,iSTATE3:110,iSTATE4:100,iSTATE5:101";
  attribute SOFT_HLUTNM of \LED_OBUF[7]_inst_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \LED_OBUF[8]_inst_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \LED_OBUF[9]_inst_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of REACTION_TIME_COUNT_EN_OUT_i_1 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \clk_cycle_count[1]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \clk_cycle_count[1]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of g0_b0 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of g0_b1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of g0_b2 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of g0_b3 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of g0_b4 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of g0_b5 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of g0_b6 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of g0_b7 : label is "soft_lutpair7";
begin
  Q(2 downto 0) <= \^q\(2 downto 0);
  REACTION_TIME_COUNT_EN_OUT <= \^reaction_time_count_en_out\;
  clk_var_hz_switchable <= \^clk_var_hz_switchable\;
CLK_VAR_HZ_SWITCHABLE_OUT_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => CLK,
      I1 => \state__0\(0),
      I2 => \state__0\(2),
      I3 => \state__0\(1),
      I4 => \^clk_var_hz_switchable\,
      O => CLK_VAR_HZ_SWITCHABLE_OUT_i_1_n_0
    );
CLK_VAR_HZ_SWITCHABLE_OUT_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => CLK_VAR_HZ_SWITCHABLE_OUT_i_1_n_0,
      Q => \^clk_var_hz_switchable\,
      R => '0'
    );
DOTIEY_COUNTDOWN_EN_OUT_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => REACTION_TIME_COUNT_RSET_OUT_i_2_n_0,
      D => \TEMP_OUT[4]_i_1_n_0\,
      Q => DOTIEY_COUNTDOWN_EN_OUT,
      R => REACTION_TIME_COUNT_RSET_OUT_i_1_n_0
    );
\ENCODED_DISPLAY_INPUT_SELECT_OUT[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"46"
    )
        port map (
      I0 => \state__0\(1),
      I1 => \state__0\(2),
      I2 => \state__0\(0),
      O => \ENCODED_DISPLAY_INPUT_SELECT_OUT[0]_i_1_n_0\
    );
\ENCODED_DISPLAY_INPUT_SELECT_OUT[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"64"
    )
        port map (
      I0 => \state__0\(2),
      I1 => \state__0\(1),
      I2 => \state__0\(0),
      O => \ENCODED_DISPLAY_INPUT_SELECT_OUT[1]_i_1_n_0\
    );
\ENCODED_DISPLAY_INPUT_SELECT_OUT[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"95"
    )
        port map (
      I0 => \state__0\(2),
      I1 => \state__0\(1),
      I2 => \state__0\(0),
      O => \ENCODED_DISPLAY_INPUT_SELECT_OUT[2]_i_1_n_0\
    );
\ENCODED_DISPLAY_INPUT_SELECT_OUT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => REACTION_TIME_COUNT_RSET_OUT_i_2_n_0,
      D => \ENCODED_DISPLAY_INPUT_SELECT_OUT[0]_i_1_n_0\,
      Q => \^q\(0),
      R => REACTION_TIME_COUNT_RSET_OUT_i_1_n_0
    );
\ENCODED_DISPLAY_INPUT_SELECT_OUT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => REACTION_TIME_COUNT_RSET_OUT_i_2_n_0,
      D => \ENCODED_DISPLAY_INPUT_SELECT_OUT[1]_i_1_n_0\,
      Q => \^q\(1),
      R => REACTION_TIME_COUNT_RSET_OUT_i_1_n_0
    );
\ENCODED_DISPLAY_INPUT_SELECT_OUT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => REACTION_TIME_COUNT_RSET_OUT_i_2_n_0,
      D => \ENCODED_DISPLAY_INPUT_SELECT_OUT[2]_i_1_n_0\,
      Q => \^q\(2),
      R => REACTION_TIME_COUNT_RSET_OUT_i_1_n_0
    );
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABABBBBAA8A8888"
    )
        port map (
      I0 => \FSM_sequential_state[0]_i_2_n_0\,
      I1 => \FSM_sequential_state[2]_i_3_n_0\,
      I2 => \FSM_sequential_state[2]_i_4_n_0\,
      I3 => \FSM_sequential_state[2]_i_5_n_0\,
      I4 => \FSM_sequential_state[2]_i_6_n_0\,
      I5 => \state__0\(0),
      O => \FSM_sequential_state[0]_i_1_n_0\
    );
\FSM_sequential_state[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55553330"
    )
        port map (
      I0 => \FSM_sequential_state[0]_i_3_n_0\,
      I1 => \FSM_sequential_state[0]_i_4_n_0\,
      I2 => LED_OBUF(2),
      I3 => \state__0\(1),
      I4 => \FSM_sequential_state[0]_i_5_n_0\,
      O => \FSM_sequential_state[0]_i_2_n_0\
    );
\FSM_sequential_state[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30DC3000"
    )
        port map (
      I0 => LED_OBUF(2),
      I1 => \state__0\(2),
      I2 => \state__0\(0),
      I3 => LED_OBUF(0),
      I4 => LED_OBUF(3),
      O => \FSM_sequential_state[0]_i_3_n_0\
    );
\FSM_sequential_state[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9D9D999D"
    )
        port map (
      I0 => \state__0\(2),
      I1 => \state__0\(0),
      I2 => LED_OBUF(0),
      I3 => LED_OBUF(4),
      I4 => LED_OBUF(3),
      O => \FSM_sequential_state[0]_i_4_n_0\
    );
\FSM_sequential_state[0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55455555"
    )
        port map (
      I0 => \state__0\(1),
      I1 => LED_OBUF(0),
      I2 => LED_OBUF(4),
      I3 => LED_OBUF(3),
      I4 => \state__0\(0),
      O => \FSM_sequential_state[0]_i_5_n_0\
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABABBBBAA8A8888"
    )
        port map (
      I0 => \FSM_sequential_state[1]_i_2_n_0\,
      I1 => \FSM_sequential_state[2]_i_3_n_0\,
      I2 => \FSM_sequential_state[2]_i_4_n_0\,
      I3 => \FSM_sequential_state[2]_i_5_n_0\,
      I4 => \FSM_sequential_state[2]_i_6_n_0\,
      I5 => \state__0\(1),
      O => \FSM_sequential_state[1]_i_1_n_0\
    );
\FSM_sequential_state[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA08FFFFAA080000"
    )
        port map (
      I0 => \state__0\(0),
      I1 => LED_OBUF(3),
      I2 => LED_OBUF(0),
      I3 => \state__0\(2),
      I4 => \state__0\(1),
      I5 => \FSM_sequential_state[1]_i_3_n_0\,
      O => \FSM_sequential_state[1]_i_2_n_0\
    );
\FSM_sequential_state[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"30303030DC00DCDC"
    )
        port map (
      I0 => LED_OBUF(2),
      I1 => \state__0\(2),
      I2 => \state__0\(0),
      I3 => LED_OBUF(3),
      I4 => LED_OBUF(4),
      I5 => LED_OBUF(0),
      O => \FSM_sequential_state[1]_i_3_n_0\
    );
\FSM_sequential_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABABBBBAA8A8888"
    )
        port map (
      I0 => \FSM_sequential_state[2]_i_2_n_0\,
      I1 => \FSM_sequential_state[2]_i_3_n_0\,
      I2 => \FSM_sequential_state[2]_i_4_n_0\,
      I3 => \FSM_sequential_state[2]_i_5_n_0\,
      I4 => \FSM_sequential_state[2]_i_6_n_0\,
      I5 => \state__0\(2),
      O => \FSM_sequential_state[2]_i_1_n_0\
    );
\FSM_sequential_state[2]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => LED_OBUF(5),
      I1 => \last_triggers__0\(5),
      I2 => LED_OBUF(4),
      I3 => \last_triggers__0\(4),
      I4 => \last_triggers__0\(3),
      I5 => LED_OBUF(3),
      O => \FSM_sequential_state[2]_i_10_n_0\
    );
\FSM_sequential_state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000AAF0E0"
    )
        port map (
      I0 => \FSM_sequential_state[2]_i_7_n_0\,
      I1 => LED_OBUF(2),
      I2 => \state__0\(0),
      I3 => \state__0\(1),
      I4 => \state__0\(2),
      I5 => LED_OBUF(0),
      O => \FSM_sequential_state[2]_i_2_n_0\
    );
\FSM_sequential_state[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \state__0\(1),
      I1 => \state__0\(2),
      I2 => \clk_cycle_count_reg_n_0_[0]\,
      I3 => \clk_cycle_count_reg_n_0_[1]\,
      O => \FSM_sequential_state[2]_i_3_n_0\
    );
\FSM_sequential_state[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF110F"
    )
        port map (
      I0 => \FSM_sequential_state[2]_i_8_n_0\,
      I1 => LED_OBUF(2),
      I2 => LED_OBUF(0),
      I3 => \state__0\(0),
      I4 => \state__0\(2),
      I5 => \state__0\(1),
      O => \FSM_sequential_state[2]_i_4_n_0\
    );
\FSM_sequential_state[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FFF40000000400"
    )
        port map (
      I0 => LED_OBUF(0),
      I1 => LED_OBUF(1),
      I2 => \state__0\(0),
      I3 => \state__0\(1),
      I4 => \state__0\(2),
      I5 => \FSM_sequential_state[2]_i_8_n_0\,
      O => \FSM_sequential_state[2]_i_5_n_0\
    );
\FSM_sequential_state[2]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \FSM_sequential_state[2]_i_9_n_0\,
      I1 => \FSM_sequential_state[2]_i_10_n_0\,
      O => \FSM_sequential_state[2]_i_6_n_0\
    );
\FSM_sequential_state[2]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => LED_OBUF(3),
      I1 => LED_OBUF(4),
      O => \FSM_sequential_state[2]_i_7_n_0\
    );
\FSM_sequential_state[2]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => LED_OBUF(4),
      I1 => LED_OBUF(3),
      I2 => LED_OBUF(5),
      I3 => LED_OBUF(0),
      O => \FSM_sequential_state[2]_i_8_n_0\
    );
\FSM_sequential_state[2]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => \last_triggers__0\(0),
      I1 => LED_OBUF(0),
      I2 => LED_OBUF(1),
      I3 => \last_triggers__0\(1),
      I4 => LED_OBUF(2),
      I5 => \last_triggers__0\(2),
      O => \FSM_sequential_state[2]_i_9_n_0\
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \FSM_sequential_state[0]_i_1_n_0\,
      Q => \state__0\(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \FSM_sequential_state[1]_i_1_n_0\,
      Q => \state__0\(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \FSM_sequential_state[2]_i_1_n_0\,
      Q => \state__0\(2),
      R => '0'
    );
\LED_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \state__0\(1),
      I2 => \state__0\(2),
      O => \TEMP_OUT_reg[4]_0\(0)
    );
\LED_OBUF[8]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2C"
    )
        port map (
      I0 => \state__0\(2),
      I1 => \state__0\(1),
      I2 => \state__0\(0),
      O => \TEMP_OUT_reg[4]_0\(1)
    );
\LED_OBUF[9]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"38"
    )
        port map (
      I0 => \state__0\(1),
      I1 => \state__0\(0),
      I2 => \state__0\(2),
      O => \TEMP_OUT_reg[4]_0\(2)
    );
REACTION_TIME_COUNT_EN_OUT_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8003"
    )
        port map (
      I0 => \^reaction_time_count_en_out\,
      I1 => \state__0\(2),
      I2 => \state__0\(1),
      I3 => \state__0\(0),
      O => REACTION_TIME_COUNT_EN_OUT_i_1_n_0
    );
REACTION_TIME_COUNT_EN_OUT_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => REACTION_TIME_COUNT_EN_OUT_i_1_n_0,
      Q => \^reaction_time_count_en_out\,
      R => '0'
    );
REACTION_TIME_COUNT_RSET_OUT_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \state__0\(1),
      I1 => \state__0\(2),
      O => REACTION_TIME_COUNT_RSET_OUT_i_1_n_0
    );
REACTION_TIME_COUNT_RSET_OUT_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7C"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \state__0\(1),
      I2 => \state__0\(2),
      O => REACTION_TIME_COUNT_RSET_OUT_i_2_n_0
    );
REACTION_TIME_COUNT_RSET_OUT_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \state__0\(1),
      I1 => \state__0\(0),
      O => REACTION_TIME_COUNT_RSET_OUT_i_3_n_0
    );
REACTION_TIME_COUNT_RSET_OUT_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => REACTION_TIME_COUNT_RSET_OUT_i_2_n_0,
      D => REACTION_TIME_COUNT_RSET_OUT_i_3_n_0,
      Q => REACTION_TIME_COUNT_RSET_OUT,
      R => REACTION_TIME_COUNT_RSET_OUT_i_1_n_0
    );
\SEGMENT_LIGHT_OUT_reg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEAE"
    )
        port map (
      I0 => \^q\(1),
      I1 => \SEGMENT_LIGHT_OUT_reg[0]_1\,
      I2 => \SEGMENT_LIGHT_OUT_reg[0]_0\(1),
      I3 => \SEGMENT_LIGHT_OUT_reg[0]_2\,
      I4 => \^q\(0),
      I5 => \^q\(2),
      O => E(0)
    );
\TEMP_OUT[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \state__0\(2),
      I2 => \state__0\(1),
      O => \TEMP_OUT[4]_i_1_n_0\
    );
\TEMP_OUT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => \TEMP_OUT[4]_i_1_n_0\,
      D => '1',
      Q => \TEMP_OUT_reg[4]_0\(3),
      R => '0'
    );
\clk_cycle_count[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BF00BFBF40D14040"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \state__0\(2),
      I2 => \state__0\(1),
      I3 => \clk_cycle_count[1]_i_4_n_0\,
      I4 => \FSM_sequential_state[2]_i_6_n_0\,
      I5 => \clk_cycle_count_reg_n_0_[0]\,
      O => \clk_cycle_count[0]_i_1_n_0\
    );
\clk_cycle_count[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFAAEFEF20AA2020"
    )
        port map (
      I0 => \clk_cycle_count[1]_i_2_n_0\,
      I1 => \clk_cycle_count[1]_i_3_n_0\,
      I2 => \state__0\(1),
      I3 => \clk_cycle_count[1]_i_4_n_0\,
      I4 => \FSM_sequential_state[2]_i_6_n_0\,
      I5 => \clk_cycle_count_reg_n_0_[1]\,
      O => \clk_cycle_count[1]_i_1_n_0\
    );
\clk_cycle_count[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"008D8D00"
    )
        port map (
      I0 => \state__0\(2),
      I1 => \state__0\(1),
      I2 => \state__0\(0),
      I3 => \clk_cycle_count_reg_n_0_[0]\,
      I4 => \clk_cycle_count_reg_n_0_[1]\,
      O => \clk_cycle_count[1]_i_2_n_0\
    );
\clk_cycle_count[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \state__0\(2),
      O => \clk_cycle_count[1]_i_3_n_0\
    );
\clk_cycle_count[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBBFFBBBBFBFFFF"
    )
        port map (
      I0 => LED_OBUF(0),
      I1 => LED_OBUF(3),
      I2 => LED_OBUF(2),
      I3 => \state__0\(1),
      I4 => \state__0\(0),
      I5 => \state__0\(2),
      O => \clk_cycle_count[1]_i_4_n_0\
    );
\clk_cycle_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \clk_cycle_count[0]_i_1_n_0\,
      Q => \clk_cycle_count_reg_n_0_[0]\,
      R => '0'
    );
\clk_cycle_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \clk_cycle_count[1]_i_1_n_0\,
      Q => \clk_cycle_count_reg_n_0_[1]\,
      R => '0'
    );
g0_b0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00035C12"
    )
        port map (
      I0 => SEG_OUT(0),
      I1 => \SEGMENT_LIGHT_OUT_reg[0]\(0),
      I2 => \SEGMENT_LIGHT_OUT_reg[0]\(1),
      I3 => SEG_OUT(3),
      I4 => SEG_OUT(4),
      O => \out\(0)
    );
g0_b0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000755540002000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \SEGMENT_LIGHT_OUT_reg[0]_0\(0),
      I3 => \SEGMENT_LIGHT_OUT_reg[0]_0\(1),
      I4 => \^q\(1),
      I5 => g0_b0_0,
      O => SEG_OUT(0)
    );
g0_b0_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B888B888B8BBB888"
    )
        port map (
      I0 => g0_b0_4,
      I1 => \^q\(2),
      I2 => g0_b0_5,
      I3 => \^q\(1),
      I4 => g0_b0_6,
      I5 => \^q\(0),
      O => SEG_OUT(3)
    );
g0_b0_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => g0_b0_1,
      I1 => \^q\(0),
      I2 => g0_b0_2,
      I3 => \^q\(1),
      I4 => g0_b0_3,
      I5 => \^q\(2),
      O => SEG_OUT(4)
    );
g0_b1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005460"
    )
        port map (
      I0 => SEG_OUT(0),
      I1 => \SEGMENT_LIGHT_OUT_reg[0]\(0),
      I2 => \SEGMENT_LIGHT_OUT_reg[0]\(1),
      I3 => SEG_OUT(3),
      I4 => SEG_OUT(4),
      O => \out\(1)
    );
g0_b2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005404"
    )
        port map (
      I0 => SEG_OUT(0),
      I1 => \SEGMENT_LIGHT_OUT_reg[0]\(0),
      I2 => \SEGMENT_LIGHT_OUT_reg[0]\(1),
      I3 => SEG_OUT(3),
      I4 => SEG_OUT(4),
      O => \out\(2)
    );
g0_b3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0003C492"
    )
        port map (
      I0 => SEG_OUT(0),
      I1 => \SEGMENT_LIGHT_OUT_reg[0]\(0),
      I2 => \SEGMENT_LIGHT_OUT_reg[0]\(1),
      I3 => SEG_OUT(3),
      I4 => SEG_OUT(4),
      O => \out\(3)
    );
g0_b4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000266BA"
    )
        port map (
      I0 => SEG_OUT(0),
      I1 => \SEGMENT_LIGHT_OUT_reg[0]\(0),
      I2 => \SEGMENT_LIGHT_OUT_reg[0]\(1),
      I3 => SEG_OUT(3),
      I4 => SEG_OUT(4),
      O => \out\(4)
    );
g0_b5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00024C8E"
    )
        port map (
      I0 => SEG_OUT(0),
      I1 => \SEGMENT_LIGHT_OUT_reg[0]\(0),
      I2 => \SEGMENT_LIGHT_OUT_reg[0]\(1),
      I3 => SEG_OUT(3),
      I4 => SEG_OUT(4),
      O => \out\(5)
    );
g0_b6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00065483"
    )
        port map (
      I0 => SEG_OUT(0),
      I1 => \SEGMENT_LIGHT_OUT_reg[0]\(0),
      I2 => \SEGMENT_LIGHT_OUT_reg[0]\(1),
      I3 => SEG_OUT(3),
      I4 => SEG_OUT(4),
      O => \out\(6)
    );
g0_b7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00019FFF"
    )
        port map (
      I0 => SEG_OUT(0),
      I1 => \SEGMENT_LIGHT_OUT_reg[0]\(0),
      I2 => \SEGMENT_LIGHT_OUT_reg[0]\(1),
      I3 => SEG_OUT(3),
      I4 => SEG_OUT(4),
      O => \out\(7)
    );
\last_triggers[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FBBB0888"
    )
        port map (
      I0 => LED_OBUF(1),
      I1 => \FSM_sequential_state[2]_i_6_n_0\,
      I2 => \state__0\(1),
      I3 => \state__0\(2),
      I4 => \last_triggers__0\(1),
      O => \last_triggers[1]_i_1_n_0\
    );
\last_triggers[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => \FSM_sequential_state[2]_i_6_n_0\,
      I1 => \state__0\(1),
      I2 => \state__0\(2),
      O => last_triggers
    );
\last_triggers_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => last_triggers,
      D => LED_OBUF(0),
      Q => \last_triggers__0\(0),
      R => '0'
    );
\last_triggers_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => '1',
      D => \last_triggers[1]_i_1_n_0\,
      Q => \last_triggers__0\(1),
      R => '0'
    );
\last_triggers_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => last_triggers,
      D => LED_OBUF(2),
      Q => \last_triggers__0\(2),
      R => '0'
    );
\last_triggers_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => last_triggers,
      D => LED_OBUF(3),
      Q => \last_triggers__0\(3),
      R => '0'
    );
\last_triggers_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => last_triggers,
      D => LED_OBUF(4),
      Q => \last_triggers__0\(4),
      R => '0'
    );
\last_triggers_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK100MHZ_IBUF_BUFG,
      CE => last_triggers,
      D => LED_OBUF(5),
      Q => \last_triggers__0\(5),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity lfsr is
  port (
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    CLK : in STD_LOGIC
  );
end lfsr;

architecture STRUCTURE of lfsr is
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \p_0_out__0\ : STD_LOGIC_VECTOR ( 7 to 7 );
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
\current_rand_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \^q\(1),
      Q => \^q\(0),
      R => '0'
    );
\current_rand_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \^q\(2),
      Q => \^q\(1),
      R => '0'
    );
\current_rand_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \^q\(3),
      Q => \^q\(2),
      R => '0'
    );
\current_rand_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \^q\(4),
      Q => \^q\(3),
      R => '0'
    );
\current_rand_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \^q\(5),
      Q => \^q\(4),
      R => '0'
    );
\current_rand_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \^q\(6),
      Q => \^q\(5),
      R => '0'
    );
\current_rand_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \^q\(7),
      Q => \^q\(6),
      R => '0'
    );
\current_rand_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \p_0_out__0\(7),
      Q => \^q\(7),
      R => '0'
    );
p_0_out: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(4),
      I2 => \^q\(0),
      I3 => \^q\(6),
      O => \p_0_out__0\(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity seven_seg_decoder is
  port (
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    D : in STD_LOGIC_VECTOR ( 7 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end seven_seg_decoder;

architecture STRUCTURE of seven_seg_decoder is
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \SEGMENT_LIGHT_OUT_reg[0]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \SEGMENT_LIGHT_OUT_reg[0]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SEGMENT_LIGHT_OUT_reg[1]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SEGMENT_LIGHT_OUT_reg[1]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SEGMENT_LIGHT_OUT_reg[2]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SEGMENT_LIGHT_OUT_reg[2]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SEGMENT_LIGHT_OUT_reg[3]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SEGMENT_LIGHT_OUT_reg[3]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SEGMENT_LIGHT_OUT_reg[4]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SEGMENT_LIGHT_OUT_reg[4]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SEGMENT_LIGHT_OUT_reg[5]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SEGMENT_LIGHT_OUT_reg[5]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SEGMENT_LIGHT_OUT_reg[6]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SEGMENT_LIGHT_OUT_reg[6]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SEGMENT_LIGHT_OUT_reg[7]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SEGMENT_LIGHT_OUT_reg[7]\ : label is "VCC:GE GND:CLR";
begin
\SEGMENT_LIGHT_OUT_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(7),
      G => E(0),
      GE => '1',
      Q => Q(7)
    );
\SEGMENT_LIGHT_OUT_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(6),
      G => E(0),
      GE => '1',
      Q => Q(6)
    );
\SEGMENT_LIGHT_OUT_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(5),
      G => E(0),
      GE => '1',
      Q => Q(5)
    );
\SEGMENT_LIGHT_OUT_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(4),
      G => E(0),
      GE => '1',
      Q => Q(4)
    );
\SEGMENT_LIGHT_OUT_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(3),
      G => E(0),
      GE => '1',
      Q => Q(3)
    );
\SEGMENT_LIGHT_OUT_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(2),
      G => E(0),
      GE => '1',
      Q => Q(2)
    );
\SEGMENT_LIGHT_OUT_reg[6]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(1),
      G => E(0),
      GE => '1',
      Q => Q(1)
    );
\SEGMENT_LIGHT_OUT_reg[7]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(0),
      G => E(0),
      GE => '1',
      Q => Q(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity segment_display is
  port (
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    D : in STD_LOGIC_VECTOR ( 7 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end segment_display;

architecture STRUCTURE of segment_display is
begin
ff1: entity work.seven_seg_decoder
     port map (
      D(7 downto 0) => D(7 downto 0),
      E(0) => E(0),
      Q(7 downto 0) => Q(7 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity timer_8_num_selectable is
  port (
    \count_reg[2]\ : out STD_LOGIC_VECTOR ( 5 downto 0 );
    \count_reg[4]\ : out STD_LOGIC;
    \count_reg[3]\ : out STD_LOGIC;
    \count_reg[2]_0\ : out STD_LOGIC;
    \count_reg[1]\ : out STD_LOGIC;
    \count_reg[0]\ : out STD_LOGIC;
    \count_reg[0]_0\ : out STD_LOGIC;
    \count_reg[1]_0\ : out STD_LOGIC;
    CLK : in STD_LOGIC;
    REACTION_TIME_COUNT_EN_OUT : in STD_LOGIC;
    g0_b0_i_5 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end timer_8_num_selectable;

architecture STRUCTURE of timer_8_num_selectable is
  signal BCD_BUS_OUT : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal ff1_n_6 : STD_LOGIC;
  signal ff2_n_6 : STD_LOGIC;
  signal ff3_n_1 : STD_LOGIC;
  signal ff3_n_2 : STD_LOGIC;
  signal ff3_n_6 : STD_LOGIC;
  signal ff5_n_5 : STD_LOGIC;
  signal tick_0 : STD_LOGIC;
  signal tick_1 : STD_LOGIC;
  signal tick_2 : STD_LOGIC;
  signal tick_3 : STD_LOGIC;
  signal tick_4 : STD_LOGIC;
begin
ff0: entity work.counter_decade
     port map (
      AR(0) => AR(0),
      CLK => CLK,
      Q(4 downto 0) => BCD_BUS_OUT(4 downto 0),
      REACTION_TIME_COUNT_EN_OUT => REACTION_TIME_COUNT_EN_OUT,
      \SEGMENT_LIGHT_OUT_reg[0]_i_1\(1 downto 0) => g0_b0_i_5(1 downto 0),
      \SEGMENT_LIGHT_OUT_reg[0]_i_1_0\ => ff2_n_6,
      \SEGMENT_LIGHT_OUT_reg[0]_i_2_0\ => ff1_n_6,
      \count_reg[1]_0\ => \count_reg[1]_0\,
      tick_0 => tick_0
    );
ff1: entity work.counter_decade_1
     port map (
      AR(0) => AR(0),
      CLK => tick_0,
      Q(4 downto 0) => BCD_BUS_OUT(9 downto 5),
      REACTION_TIME_COUNT_EN_OUT => REACTION_TIME_COUNT_EN_OUT,
      \count_reg[3]_0\ => ff1_n_6,
      tick_1 => tick_1
    );
ff2: entity work.counter_decade_2
     port map (
      AR(0) => AR(0),
      CLK => tick_1,
      Q(4 downto 0) => BCD_BUS_OUT(14 downto 10),
      REACTION_TIME_COUNT_EN_OUT => REACTION_TIME_COUNT_EN_OUT,
      \SEGMENT_LIGHT_OUT_reg[0]_i_2\(0) => g0_b0_i_5(0),
      \SEGMENT_LIGHT_OUT_reg[0]_i_2_0\ => ff3_n_6,
      \count_reg[0]_0\ => ff2_n_6,
      tick_2 => tick_2
    );
ff3: entity work.counter_decade_3
     port map (
      AR(0) => AR(0),
      CLK => tick_2,
      REACTION_TIME_COUNT_EN_OUT => REACTION_TIME_COUNT_EN_OUT,
      \count_reg[0]_0\ => \count_reg[0]\,
      \count_reg[1]_0\ => \count_reg[1]\,
      \count_reg[2]_0\ => \count_reg[2]_0\,
      \count_reg[3]_0\ => ff3_n_2,
      \count_reg[3]_1\ => ff3_n_6,
      \count_reg[4]_0\ => ff3_n_1,
      g0_b0_i_14(14 downto 0) => BCD_BUS_OUT(14 downto 0),
      g0_b0_i_14_0(1 downto 0) => g0_b0_i_5(1 downto 0),
      tick_3 => tick_3
    );
ff4: entity work.counter_decade_4
     port map (
      AR(0) => AR(0),
      CLK => tick_4,
      Q(1 downto 0) => BCD_BUS_OUT(29 downto 28),
      REACTION_TIME_COUNT_EN_OUT => REACTION_TIME_COUNT_EN_OUT,
      \SEGMENT_LIGHT_OUT_reg[0]_i_1\ => ff5_n_5,
      \count_reg[0]_0\ => \count_reg[0]_0\,
      \count_reg[0]_1\ => tick_3,
      \count_reg[2]_0\(2 downto 0) => \count_reg[2]\(2 downto 0),
      \count_reg[3]_0\ => \count_reg[3]\,
      \count_reg[4]_0\ => \count_reg[4]\,
      g0_b0_i_4 => ff3_n_2,
      g0_b0_i_5(2 downto 0) => g0_b0_i_5(2 downto 0),
      g0_b0_i_5_0 => ff3_n_1
    );
ff5: entity work.counter_decade_5
     port map (
      AR(0) => AR(0),
      CLK => tick_4,
      Q(4 downto 3) => BCD_BUS_OUT(29 downto 28),
      Q(2 downto 0) => \count_reg[2]\(5 downto 3),
      REACTION_TIME_COUNT_EN_OUT => REACTION_TIME_COUNT_EN_OUT,
      \count_reg[3]_0\ => ff5_n_5
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity main is
  port (
    CLK100MHZ : in STD_LOGIC;
    LED : out STD_LOGIC_VECTOR ( 15 downto 0 );
    AN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    SEVEN_SEG : out STD_LOGIC_VECTOR ( 7 downto 0 );
    BTNC : in STD_LOGIC;
    BTNR : in STD_LOGIC;
    BTNL : in STD_LOGIC;
    BTNU : in STD_LOGIC;
    BTND : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of main : entity is true;
end main;

architecture STRUCTURE of main is
  signal AN_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal BCD_BUS_OUT : STD_LOGIC_VECTOR ( 27 downto 20 );
  signal CLK100MHZ_IBUF : STD_LOGIC;
  signal CLK100MHZ_IBUF_BUFG : STD_LOGIC;
  signal COUNT_OUT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal DOTIEY_COUNTDOWN_EN_OUT : STD_LOGIC;
  signal ENCODED_DISPLAY_INPUT_SELECT_OUT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal LED_OBUF : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal RAND_OUT : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal REACTION_TIME_COUNT_EN_OUT : STD_LOGIC;
  signal REACTION_TIME_COUNT_RSET_OUT : STD_LOGIC;
  signal SEG_OUT : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal SEVEN_SEG_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal SLOWCLK_OUT : STD_LOGIC;
  signal clk_var_hz : STD_LOGIC;
  signal clk_var_hz_switchable : STD_LOGIC;
  signal count_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ff0_n_10 : STD_LOGIC;
  signal ff0_n_11 : STD_LOGIC;
  signal ff0_n_3 : STD_LOGIC;
  signal ff0_n_4 : STD_LOGIC;
  signal ff0_n_5 : STD_LOGIC;
  signal ff0_n_6 : STD_LOGIC;
  signal ff0_n_7 : STD_LOGIC;
  signal ff0_n_8 : STD_LOGIC;
  signal ff0_n_9 : STD_LOGIC;
  signal ff3_n_2 : STD_LOGIC;
  signal ff3_n_6 : STD_LOGIC;
  signal ff3_n_7 : STD_LOGIC;
  signal ff3_n_8 : STD_LOGIC;
  signal ff3_n_9 : STD_LOGIC;
  signal ff4_n_10 : STD_LOGIC;
  signal ff4_n_11 : STD_LOGIC;
  signal ff4_n_12 : STD_LOGIC;
  signal ff4_n_6 : STD_LOGIC;
  signal ff4_n_7 : STD_LOGIC;
  signal ff4_n_8 : STD_LOGIC;
  signal ff4_n_9 : STD_LOGIC;
begin
\AN_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => AN_OBUF(0),
      O => AN(0)
    );
\AN_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => AN_OBUF(1),
      O => AN(1)
    );
\AN_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => AN_OBUF(2),
      O => AN(2)
    );
\AN_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => AN_OBUF(3),
      O => AN(3)
    );
\AN_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => AN_OBUF(4),
      O => AN(4)
    );
\AN_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => AN_OBUF(5),
      O => AN(5)
    );
\AN_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => AN_OBUF(6),
      O => AN(6)
    );
\AN_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => AN_OBUF(7),
      O => AN(7)
    );
BTNC_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => BTNC,
      O => LED_OBUF(0)
    );
BTND_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => BTND,
      O => LED_OBUF(5)
    );
BTNL_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => BTNL,
      O => LED_OBUF(3)
    );
BTNR_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => BTNR,
      O => LED_OBUF(2)
    );
BTNU_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => BTNU,
      O => LED_OBUF(4)
    );
CLK100MHZ_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => CLK100MHZ_IBUF,
      O => CLK100MHZ_IBUF_BUFG
    );
CLK100MHZ_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => CLK100MHZ,
      O => CLK100MHZ_IBUF
    );
\LED_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(0),
      O => LED(0)
    );
\LED_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => LED(10)
    );
\LED_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(11),
      O => LED(11)
    );
\LED_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => LED(12)
    );
\LED_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => LED(13)
    );
\LED_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => LED(14)
    );
\LED_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => LED(15)
    );
\LED_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(1),
      O => LED(1)
    );
\LED_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(2),
      O => LED(2)
    );
\LED_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(3),
      O => LED(3)
    );
\LED_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(4),
      O => LED(4)
    );
\LED_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(5),
      O => LED(5)
    );
\LED_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => LED(6)
    );
\LED_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(7),
      O => LED(7)
    );
\LED_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(8),
      O => LED(8)
    );
\LED_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(9),
      O => LED(9)
    );
\SEVEN_SEG_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEVEN_SEG_OBUF(0),
      O => SEVEN_SEG(0)
    );
\SEVEN_SEG_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEVEN_SEG_OBUF(1),
      O => SEVEN_SEG(1)
    );
\SEVEN_SEG_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEVEN_SEG_OBUF(2),
      O => SEVEN_SEG(2)
    );
\SEVEN_SEG_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEVEN_SEG_OBUF(3),
      O => SEVEN_SEG(3)
    );
\SEVEN_SEG_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEVEN_SEG_OBUF(4),
      O => SEVEN_SEG(4)
    );
\SEVEN_SEG_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEVEN_SEG_OBUF(5),
      O => SEVEN_SEG(5)
    );
\SEVEN_SEG_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEVEN_SEG_OBUF(6),
      O => SEVEN_SEG(6)
    );
\SEVEN_SEG_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEVEN_SEG_OBUF(7),
      O => SEVEN_SEG(7)
    );
ff0: entity work.fsm
     port map (
      CLK => clk_var_hz,
      CLK100MHZ_IBUF_BUFG => CLK100MHZ_IBUF_BUFG,
      DOTIEY_COUNTDOWN_EN_OUT => DOTIEY_COUNTDOWN_EN_OUT,
      E(0) => ff0_n_3,
      LED_OBUF(5 downto 0) => LED_OBUF(5 downto 0),
      Q(2 downto 0) => ENCODED_DISPLAY_INPUT_SELECT_OUT(2 downto 0),
      REACTION_TIME_COUNT_EN_OUT => REACTION_TIME_COUNT_EN_OUT,
      REACTION_TIME_COUNT_RSET_OUT => REACTION_TIME_COUNT_RSET_OUT,
      \SEGMENT_LIGHT_OUT_reg[0]\(1 downto 0) => SEG_OUT(2 downto 1),
      \SEGMENT_LIGHT_OUT_reg[0]_0\(1 downto 0) => COUNT_OUT(2 downto 1),
      \SEGMENT_LIGHT_OUT_reg[0]_1\ => ff4_n_12,
      \SEGMENT_LIGHT_OUT_reg[0]_2\ => ff4_n_11,
      \TEMP_OUT_reg[4]_0\(3) => LED_OBUF(11),
      \TEMP_OUT_reg[4]_0\(2 downto 0) => LED_OBUF(9 downto 7),
      clk_var_hz_switchable => clk_var_hz_switchable,
      g0_b0_0 => ff3_n_6,
      g0_b0_1 => ff4_n_6,
      g0_b0_2 => ff3_n_9,
      g0_b0_3 => ff3_n_8,
      g0_b0_4 => ff3_n_2,
      g0_b0_5 => ff3_n_7,
      g0_b0_6 => ff4_n_7,
      \out\(7) => ff0_n_4,
      \out\(6) => ff0_n_5,
      \out\(5) => ff0_n_6,
      \out\(4) => ff0_n_7,
      \out\(3) => ff0_n_8,
      \out\(2) => ff0_n_9,
      \out\(1) => ff0_n_10,
      \out\(0) => ff0_n_11
    );
ff1: entity work.clk_divider
     port map (
      CLK => SLOWCLK_OUT,
      CLK100MHZ_IBUF_BUFG => CLK100MHZ_IBUF_BUFG
    );
ff12: entity work.segment_display
     port map (
      D(7) => ff0_n_4,
      D(6) => ff0_n_5,
      D(5) => ff0_n_6,
      D(4) => ff0_n_7,
      D(3) => ff0_n_8,
      D(2) => ff0_n_9,
      D(1) => ff0_n_10,
      D(0) => ff0_n_11,
      E(0) => ff0_n_3,
      Q(7 downto 0) => SEVEN_SEG_OBUF(7 downto 0)
    );
ff13: entity work.lfsr
     port map (
      CLK => clk_var_hz,
      Q(7 downto 0) => RAND_OUT(7 downto 0)
    );
ff14: entity work.clk_divider_0
     port map (
      CLK => clk_var_hz,
      CLK100MHZ_IBUF_BUFG => CLK100MHZ_IBUF_BUFG,
      Q(7 downto 0) => RAND_OUT(7 downto 0)
    );
ff3: entity work.counter_3b
     port map (
      AN_OBUF(7 downto 0) => AN_OBUF(7 downto 0),
      BCD_BUS_OUT(5 downto 3) => BCD_BUS_OUT(27 downto 25),
      BCD_BUS_OUT(2 downto 0) => BCD_BUS_OUT(22 downto 20),
      CLK => SLOWCLK_OUT,
      \ENCODED_DISPLAY_INPUT_SELECT_OUT_reg[0]\ => ff3_n_7,
      \ENCODED_DISPLAY_INPUT_SELECT_OUT_reg[1]\ => ff3_n_2,
      \ENCODED_DISPLAY_INPUT_SELECT_OUT_reg[2]\(1 downto 0) => SEG_OUT(2 downto 1),
      Q(2 downto 0) => ENCODED_DISPLAY_INPUT_SELECT_OUT(2 downto 0),
      count_reg(3 downto 0) => count_reg(3 downto 0),
      \count_reg[0]_0\ => ff3_n_6,
      \count_reg[1]_0\ => ff3_n_9,
      \count_reg[2]_0\(2 downto 0) => COUNT_OUT(2 downto 0),
      \count_reg[2]_1\ => ff3_n_8,
      g0_b0_i_1 => ff4_n_10,
      g0_b0_i_2_0 => ff4_n_9,
      g0_b0_i_3_0 => ff4_n_8
    );
ff4: entity work.timer_8_num_selectable
     port map (
      AR(0) => REACTION_TIME_COUNT_RSET_OUT,
      CLK => SLOWCLK_OUT,
      REACTION_TIME_COUNT_EN_OUT => REACTION_TIME_COUNT_EN_OUT,
      \count_reg[0]\ => ff4_n_10,
      \count_reg[0]_0\ => ff4_n_11,
      \count_reg[1]\ => ff4_n_9,
      \count_reg[1]_0\ => ff4_n_12,
      \count_reg[2]\(5 downto 3) => BCD_BUS_OUT(27 downto 25),
      \count_reg[2]\(2 downto 0) => BCD_BUS_OUT(22 downto 20),
      \count_reg[2]_0\ => ff4_n_8,
      \count_reg[3]\ => ff4_n_7,
      \count_reg[4]\ => ff4_n_6,
      g0_b0_i_5(2 downto 0) => COUNT_OUT(2 downto 0)
    );
ff9: entity work.dotiey
     port map (
      DOTIEY_COUNTDOWN_EN_OUT => DOTIEY_COUNTDOWN_EN_OUT,
      LED_OBUF(0) => LED_OBUF(1),
      clk_var_hz_switchable => clk_var_hz_switchable,
      count_reg(3 downto 0) => count_reg(3 downto 0)
    );
end STRUCTURE;
