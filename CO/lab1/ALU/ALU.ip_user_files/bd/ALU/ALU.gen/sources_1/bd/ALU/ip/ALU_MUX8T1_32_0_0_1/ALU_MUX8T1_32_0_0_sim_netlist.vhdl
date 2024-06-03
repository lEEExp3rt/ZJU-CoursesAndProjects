-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Thu Mar  7 20:14:41 2024
-- Host        : LAPTOP-SDV26TG8 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top ALU_MUX8T1_32_0_0 -prefix
--               ALU_MUX8T1_32_0_0_ ALU_MUX8T1_32_0_0_sim_netlist.vhdl
-- Design      : ALU_MUX8T1_32_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ALU_MUX8T1_32_0_0_MUX8T1_32 is
  port (
    o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I7 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I6 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I5 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I4 : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end ALU_MUX8T1_32_0_0_MUX8T1_32;

architecture STRUCTURE of ALU_MUX8T1_32_0_0_MUX8T1_32 is
  signal \o[0]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[0]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[10]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[10]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[11]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[11]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[12]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[12]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[13]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[13]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[14]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[14]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[15]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[15]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[16]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[16]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[17]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[17]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[18]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[18]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[19]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[19]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[1]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[1]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[20]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[20]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[21]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[21]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[22]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[22]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[23]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[23]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[24]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[24]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[25]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[25]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[26]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[26]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[27]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[27]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[28]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[28]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[29]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[29]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[2]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[2]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[30]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[30]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[31]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[31]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[3]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[3]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[4]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[4]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[5]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[5]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[6]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[6]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[7]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[7]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[8]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[8]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \o[9]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \o[9]_INST_0_i_2_n_0\ : STD_LOGIC;
begin
\o[0]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[0]_INST_0_i_1_n_0\,
      I1 => \o[0]_INST_0_i_2_n_0\,
      O => o(0),
      S => s(2)
    );
\o[0]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(0),
      I1 => I2(0),
      I2 => s(1),
      I3 => I1(0),
      I4 => s(0),
      I5 => I0(0),
      O => \o[0]_INST_0_i_1_n_0\
    );
\o[0]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(0),
      I1 => I6(0),
      I2 => s(1),
      I3 => I5(0),
      I4 => s(0),
      I5 => I4(0),
      O => \o[0]_INST_0_i_2_n_0\
    );
\o[10]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[10]_INST_0_i_1_n_0\,
      I1 => \o[10]_INST_0_i_2_n_0\,
      O => o(10),
      S => s(2)
    );
\o[10]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(10),
      I1 => I2(10),
      I2 => s(1),
      I3 => I1(10),
      I4 => s(0),
      I5 => I0(10),
      O => \o[10]_INST_0_i_1_n_0\
    );
\o[10]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(10),
      I1 => I6(10),
      I2 => s(1),
      I3 => I5(10),
      I4 => s(0),
      I5 => I4(10),
      O => \o[10]_INST_0_i_2_n_0\
    );
\o[11]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[11]_INST_0_i_1_n_0\,
      I1 => \o[11]_INST_0_i_2_n_0\,
      O => o(11),
      S => s(2)
    );
\o[11]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(11),
      I1 => I2(11),
      I2 => s(1),
      I3 => I1(11),
      I4 => s(0),
      I5 => I0(11),
      O => \o[11]_INST_0_i_1_n_0\
    );
\o[11]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(11),
      I1 => I6(11),
      I2 => s(1),
      I3 => I5(11),
      I4 => s(0),
      I5 => I4(11),
      O => \o[11]_INST_0_i_2_n_0\
    );
\o[12]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[12]_INST_0_i_1_n_0\,
      I1 => \o[12]_INST_0_i_2_n_0\,
      O => o(12),
      S => s(2)
    );
\o[12]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(12),
      I1 => I2(12),
      I2 => s(1),
      I3 => I1(12),
      I4 => s(0),
      I5 => I0(12),
      O => \o[12]_INST_0_i_1_n_0\
    );
\o[12]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(12),
      I1 => I6(12),
      I2 => s(1),
      I3 => I5(12),
      I4 => s(0),
      I5 => I4(12),
      O => \o[12]_INST_0_i_2_n_0\
    );
\o[13]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[13]_INST_0_i_1_n_0\,
      I1 => \o[13]_INST_0_i_2_n_0\,
      O => o(13),
      S => s(2)
    );
\o[13]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(13),
      I1 => I2(13),
      I2 => s(1),
      I3 => I1(13),
      I4 => s(0),
      I5 => I0(13),
      O => \o[13]_INST_0_i_1_n_0\
    );
\o[13]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(13),
      I1 => I6(13),
      I2 => s(1),
      I3 => I5(13),
      I4 => s(0),
      I5 => I4(13),
      O => \o[13]_INST_0_i_2_n_0\
    );
\o[14]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[14]_INST_0_i_1_n_0\,
      I1 => \o[14]_INST_0_i_2_n_0\,
      O => o(14),
      S => s(2)
    );
\o[14]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(14),
      I1 => I2(14),
      I2 => s(1),
      I3 => I1(14),
      I4 => s(0),
      I5 => I0(14),
      O => \o[14]_INST_0_i_1_n_0\
    );
\o[14]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(14),
      I1 => I6(14),
      I2 => s(1),
      I3 => I5(14),
      I4 => s(0),
      I5 => I4(14),
      O => \o[14]_INST_0_i_2_n_0\
    );
\o[15]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[15]_INST_0_i_1_n_0\,
      I1 => \o[15]_INST_0_i_2_n_0\,
      O => o(15),
      S => s(2)
    );
\o[15]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(15),
      I1 => I2(15),
      I2 => s(1),
      I3 => I1(15),
      I4 => s(0),
      I5 => I0(15),
      O => \o[15]_INST_0_i_1_n_0\
    );
\o[15]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(15),
      I1 => I6(15),
      I2 => s(1),
      I3 => I5(15),
      I4 => s(0),
      I5 => I4(15),
      O => \o[15]_INST_0_i_2_n_0\
    );
\o[16]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[16]_INST_0_i_1_n_0\,
      I1 => \o[16]_INST_0_i_2_n_0\,
      O => o(16),
      S => s(2)
    );
\o[16]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(16),
      I1 => I2(16),
      I2 => s(1),
      I3 => I1(16),
      I4 => s(0),
      I5 => I0(16),
      O => \o[16]_INST_0_i_1_n_0\
    );
\o[16]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(16),
      I1 => I6(16),
      I2 => s(1),
      I3 => I5(16),
      I4 => s(0),
      I5 => I4(16),
      O => \o[16]_INST_0_i_2_n_0\
    );
\o[17]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[17]_INST_0_i_1_n_0\,
      I1 => \o[17]_INST_0_i_2_n_0\,
      O => o(17),
      S => s(2)
    );
\o[17]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(17),
      I1 => I2(17),
      I2 => s(1),
      I3 => I1(17),
      I4 => s(0),
      I5 => I0(17),
      O => \o[17]_INST_0_i_1_n_0\
    );
\o[17]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(17),
      I1 => I6(17),
      I2 => s(1),
      I3 => I5(17),
      I4 => s(0),
      I5 => I4(17),
      O => \o[17]_INST_0_i_2_n_0\
    );
\o[18]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[18]_INST_0_i_1_n_0\,
      I1 => \o[18]_INST_0_i_2_n_0\,
      O => o(18),
      S => s(2)
    );
\o[18]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(18),
      I1 => I2(18),
      I2 => s(1),
      I3 => I1(18),
      I4 => s(0),
      I5 => I0(18),
      O => \o[18]_INST_0_i_1_n_0\
    );
\o[18]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(18),
      I1 => I6(18),
      I2 => s(1),
      I3 => I5(18),
      I4 => s(0),
      I5 => I4(18),
      O => \o[18]_INST_0_i_2_n_0\
    );
\o[19]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[19]_INST_0_i_1_n_0\,
      I1 => \o[19]_INST_0_i_2_n_0\,
      O => o(19),
      S => s(2)
    );
\o[19]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(19),
      I1 => I2(19),
      I2 => s(1),
      I3 => I1(19),
      I4 => s(0),
      I5 => I0(19),
      O => \o[19]_INST_0_i_1_n_0\
    );
\o[19]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(19),
      I1 => I6(19),
      I2 => s(1),
      I3 => I5(19),
      I4 => s(0),
      I5 => I4(19),
      O => \o[19]_INST_0_i_2_n_0\
    );
\o[1]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[1]_INST_0_i_1_n_0\,
      I1 => \o[1]_INST_0_i_2_n_0\,
      O => o(1),
      S => s(2)
    );
\o[1]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(1),
      I1 => I2(1),
      I2 => s(1),
      I3 => I1(1),
      I4 => s(0),
      I5 => I0(1),
      O => \o[1]_INST_0_i_1_n_0\
    );
\o[1]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(1),
      I1 => I6(1),
      I2 => s(1),
      I3 => I5(1),
      I4 => s(0),
      I5 => I4(1),
      O => \o[1]_INST_0_i_2_n_0\
    );
\o[20]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[20]_INST_0_i_1_n_0\,
      I1 => \o[20]_INST_0_i_2_n_0\,
      O => o(20),
      S => s(2)
    );
\o[20]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(20),
      I1 => I2(20),
      I2 => s(1),
      I3 => I1(20),
      I4 => s(0),
      I5 => I0(20),
      O => \o[20]_INST_0_i_1_n_0\
    );
\o[20]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(20),
      I1 => I6(20),
      I2 => s(1),
      I3 => I5(20),
      I4 => s(0),
      I5 => I4(20),
      O => \o[20]_INST_0_i_2_n_0\
    );
\o[21]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[21]_INST_0_i_1_n_0\,
      I1 => \o[21]_INST_0_i_2_n_0\,
      O => o(21),
      S => s(2)
    );
\o[21]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(21),
      I1 => I2(21),
      I2 => s(1),
      I3 => I1(21),
      I4 => s(0),
      I5 => I0(21),
      O => \o[21]_INST_0_i_1_n_0\
    );
\o[21]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(21),
      I1 => I6(21),
      I2 => s(1),
      I3 => I5(21),
      I4 => s(0),
      I5 => I4(21),
      O => \o[21]_INST_0_i_2_n_0\
    );
\o[22]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[22]_INST_0_i_1_n_0\,
      I1 => \o[22]_INST_0_i_2_n_0\,
      O => o(22),
      S => s(2)
    );
\o[22]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(22),
      I1 => I2(22),
      I2 => s(1),
      I3 => I1(22),
      I4 => s(0),
      I5 => I0(22),
      O => \o[22]_INST_0_i_1_n_0\
    );
\o[22]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(22),
      I1 => I6(22),
      I2 => s(1),
      I3 => I5(22),
      I4 => s(0),
      I5 => I4(22),
      O => \o[22]_INST_0_i_2_n_0\
    );
\o[23]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[23]_INST_0_i_1_n_0\,
      I1 => \o[23]_INST_0_i_2_n_0\,
      O => o(23),
      S => s(2)
    );
\o[23]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(23),
      I1 => I2(23),
      I2 => s(1),
      I3 => I1(23),
      I4 => s(0),
      I5 => I0(23),
      O => \o[23]_INST_0_i_1_n_0\
    );
\o[23]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(23),
      I1 => I6(23),
      I2 => s(1),
      I3 => I5(23),
      I4 => s(0),
      I5 => I4(23),
      O => \o[23]_INST_0_i_2_n_0\
    );
\o[24]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[24]_INST_0_i_1_n_0\,
      I1 => \o[24]_INST_0_i_2_n_0\,
      O => o(24),
      S => s(2)
    );
\o[24]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(24),
      I1 => I2(24),
      I2 => s(1),
      I3 => I1(24),
      I4 => s(0),
      I5 => I0(24),
      O => \o[24]_INST_0_i_1_n_0\
    );
\o[24]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(24),
      I1 => I6(24),
      I2 => s(1),
      I3 => I5(24),
      I4 => s(0),
      I5 => I4(24),
      O => \o[24]_INST_0_i_2_n_0\
    );
\o[25]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[25]_INST_0_i_1_n_0\,
      I1 => \o[25]_INST_0_i_2_n_0\,
      O => o(25),
      S => s(2)
    );
\o[25]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(25),
      I1 => I2(25),
      I2 => s(1),
      I3 => I1(25),
      I4 => s(0),
      I5 => I0(25),
      O => \o[25]_INST_0_i_1_n_0\
    );
\o[25]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(25),
      I1 => I6(25),
      I2 => s(1),
      I3 => I5(25),
      I4 => s(0),
      I5 => I4(25),
      O => \o[25]_INST_0_i_2_n_0\
    );
\o[26]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[26]_INST_0_i_1_n_0\,
      I1 => \o[26]_INST_0_i_2_n_0\,
      O => o(26),
      S => s(2)
    );
\o[26]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(26),
      I1 => I2(26),
      I2 => s(1),
      I3 => I1(26),
      I4 => s(0),
      I5 => I0(26),
      O => \o[26]_INST_0_i_1_n_0\
    );
\o[26]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(26),
      I1 => I6(26),
      I2 => s(1),
      I3 => I5(26),
      I4 => s(0),
      I5 => I4(26),
      O => \o[26]_INST_0_i_2_n_0\
    );
\o[27]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[27]_INST_0_i_1_n_0\,
      I1 => \o[27]_INST_0_i_2_n_0\,
      O => o(27),
      S => s(2)
    );
\o[27]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(27),
      I1 => I2(27),
      I2 => s(1),
      I3 => I1(27),
      I4 => s(0),
      I5 => I0(27),
      O => \o[27]_INST_0_i_1_n_0\
    );
\o[27]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(27),
      I1 => I6(27),
      I2 => s(1),
      I3 => I5(27),
      I4 => s(0),
      I5 => I4(27),
      O => \o[27]_INST_0_i_2_n_0\
    );
\o[28]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[28]_INST_0_i_1_n_0\,
      I1 => \o[28]_INST_0_i_2_n_0\,
      O => o(28),
      S => s(2)
    );
\o[28]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(28),
      I1 => I2(28),
      I2 => s(1),
      I3 => I1(28),
      I4 => s(0),
      I5 => I0(28),
      O => \o[28]_INST_0_i_1_n_0\
    );
\o[28]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(28),
      I1 => I6(28),
      I2 => s(1),
      I3 => I5(28),
      I4 => s(0),
      I5 => I4(28),
      O => \o[28]_INST_0_i_2_n_0\
    );
\o[29]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[29]_INST_0_i_1_n_0\,
      I1 => \o[29]_INST_0_i_2_n_0\,
      O => o(29),
      S => s(2)
    );
\o[29]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(29),
      I1 => I2(29),
      I2 => s(1),
      I3 => I1(29),
      I4 => s(0),
      I5 => I0(29),
      O => \o[29]_INST_0_i_1_n_0\
    );
\o[29]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(29),
      I1 => I6(29),
      I2 => s(1),
      I3 => I5(29),
      I4 => s(0),
      I5 => I4(29),
      O => \o[29]_INST_0_i_2_n_0\
    );
\o[2]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[2]_INST_0_i_1_n_0\,
      I1 => \o[2]_INST_0_i_2_n_0\,
      O => o(2),
      S => s(2)
    );
\o[2]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(2),
      I1 => I2(2),
      I2 => s(1),
      I3 => I1(2),
      I4 => s(0),
      I5 => I0(2),
      O => \o[2]_INST_0_i_1_n_0\
    );
\o[2]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(2),
      I1 => I6(2),
      I2 => s(1),
      I3 => I5(2),
      I4 => s(0),
      I5 => I4(2),
      O => \o[2]_INST_0_i_2_n_0\
    );
\o[30]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[30]_INST_0_i_1_n_0\,
      I1 => \o[30]_INST_0_i_2_n_0\,
      O => o(30),
      S => s(2)
    );
\o[30]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(30),
      I1 => I2(30),
      I2 => s(1),
      I3 => I1(30),
      I4 => s(0),
      I5 => I0(30),
      O => \o[30]_INST_0_i_1_n_0\
    );
\o[30]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(30),
      I1 => I6(30),
      I2 => s(1),
      I3 => I5(30),
      I4 => s(0),
      I5 => I4(30),
      O => \o[30]_INST_0_i_2_n_0\
    );
\o[31]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[31]_INST_0_i_1_n_0\,
      I1 => \o[31]_INST_0_i_2_n_0\,
      O => o(31),
      S => s(2)
    );
\o[31]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(31),
      I1 => I2(31),
      I2 => s(1),
      I3 => I1(31),
      I4 => s(0),
      I5 => I0(31),
      O => \o[31]_INST_0_i_1_n_0\
    );
\o[31]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(31),
      I1 => I6(31),
      I2 => s(1),
      I3 => I5(31),
      I4 => s(0),
      I5 => I4(31),
      O => \o[31]_INST_0_i_2_n_0\
    );
\o[3]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[3]_INST_0_i_1_n_0\,
      I1 => \o[3]_INST_0_i_2_n_0\,
      O => o(3),
      S => s(2)
    );
\o[3]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(3),
      I1 => I2(3),
      I2 => s(1),
      I3 => I1(3),
      I4 => s(0),
      I5 => I0(3),
      O => \o[3]_INST_0_i_1_n_0\
    );
\o[3]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(3),
      I1 => I6(3),
      I2 => s(1),
      I3 => I5(3),
      I4 => s(0),
      I5 => I4(3),
      O => \o[3]_INST_0_i_2_n_0\
    );
\o[4]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[4]_INST_0_i_1_n_0\,
      I1 => \o[4]_INST_0_i_2_n_0\,
      O => o(4),
      S => s(2)
    );
\o[4]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(4),
      I1 => I2(4),
      I2 => s(1),
      I3 => I1(4),
      I4 => s(0),
      I5 => I0(4),
      O => \o[4]_INST_0_i_1_n_0\
    );
\o[4]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(4),
      I1 => I6(4),
      I2 => s(1),
      I3 => I5(4),
      I4 => s(0),
      I5 => I4(4),
      O => \o[4]_INST_0_i_2_n_0\
    );
\o[5]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[5]_INST_0_i_1_n_0\,
      I1 => \o[5]_INST_0_i_2_n_0\,
      O => o(5),
      S => s(2)
    );
\o[5]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(5),
      I1 => I2(5),
      I2 => s(1),
      I3 => I1(5),
      I4 => s(0),
      I5 => I0(5),
      O => \o[5]_INST_0_i_1_n_0\
    );
\o[5]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(5),
      I1 => I6(5),
      I2 => s(1),
      I3 => I5(5),
      I4 => s(0),
      I5 => I4(5),
      O => \o[5]_INST_0_i_2_n_0\
    );
\o[6]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[6]_INST_0_i_1_n_0\,
      I1 => \o[6]_INST_0_i_2_n_0\,
      O => o(6),
      S => s(2)
    );
\o[6]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(6),
      I1 => I2(6),
      I2 => s(1),
      I3 => I1(6),
      I4 => s(0),
      I5 => I0(6),
      O => \o[6]_INST_0_i_1_n_0\
    );
\o[6]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(6),
      I1 => I6(6),
      I2 => s(1),
      I3 => I5(6),
      I4 => s(0),
      I5 => I4(6),
      O => \o[6]_INST_0_i_2_n_0\
    );
\o[7]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[7]_INST_0_i_1_n_0\,
      I1 => \o[7]_INST_0_i_2_n_0\,
      O => o(7),
      S => s(2)
    );
\o[7]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(7),
      I1 => I2(7),
      I2 => s(1),
      I3 => I1(7),
      I4 => s(0),
      I5 => I0(7),
      O => \o[7]_INST_0_i_1_n_0\
    );
\o[7]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(7),
      I1 => I6(7),
      I2 => s(1),
      I3 => I5(7),
      I4 => s(0),
      I5 => I4(7),
      O => \o[7]_INST_0_i_2_n_0\
    );
\o[8]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[8]_INST_0_i_1_n_0\,
      I1 => \o[8]_INST_0_i_2_n_0\,
      O => o(8),
      S => s(2)
    );
\o[8]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(8),
      I1 => I2(8),
      I2 => s(1),
      I3 => I1(8),
      I4 => s(0),
      I5 => I0(8),
      O => \o[8]_INST_0_i_1_n_0\
    );
\o[8]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(8),
      I1 => I6(8),
      I2 => s(1),
      I3 => I5(8),
      I4 => s(0),
      I5 => I4(8),
      O => \o[8]_INST_0_i_2_n_0\
    );
\o[9]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \o[9]_INST_0_i_1_n_0\,
      I1 => \o[9]_INST_0_i_2_n_0\,
      O => o(9),
      S => s(2)
    );
\o[9]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I3(9),
      I1 => I2(9),
      I2 => s(1),
      I3 => I1(9),
      I4 => s(0),
      I5 => I0(9),
      O => \o[9]_INST_0_i_1_n_0\
    );
\o[9]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => I7(9),
      I1 => I6(9),
      I2 => s(1),
      I3 => I5(9),
      I4 => s(0),
      I5 => I4(9),
      O => \o[9]_INST_0_i_2_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ALU_MUX8T1_32_0_0 is
  port (
    s : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I4 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I5 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I6 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I7 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    o : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ALU_MUX8T1_32_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ALU_MUX8T1_32_0_0 : entity is "ALU_MUX8T1_32_0_0,MUX8T1_32,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of ALU_MUX8T1_32_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of ALU_MUX8T1_32_0_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of ALU_MUX8T1_32_0_0 : entity is "MUX8T1_32,Vivado 2023.1";
end ALU_MUX8T1_32_0_0;

architecture STRUCTURE of ALU_MUX8T1_32_0_0 is
begin
inst: entity work.ALU_MUX8T1_32_0_0_MUX8T1_32
     port map (
      I0(31 downto 0) => I0(31 downto 0),
      I1(31 downto 0) => I1(31 downto 0),
      I2(31 downto 0) => I2(31 downto 0),
      I3(31 downto 0) => I3(31 downto 0),
      I4(31 downto 0) => I4(31 downto 0),
      I5(31 downto 0) => I5(31 downto 0),
      I6(31 downto 0) => I6(31 downto 0),
      I7(31 downto 0) => I7(31 downto 0),
      o(31 downto 0) => o(31 downto 0),
      s(2 downto 0) => s(2 downto 0)
    );
end STRUCTURE;
