-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Thu Mar  7 20:16:19 2024
-- Host        : LAPTOP-SDV26TG8 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ALU_or_bit_32_0_0_sim_netlist.vhdl
-- Design      : ALU_or_bit_32_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_or_bit_32 is
  port (
    o : out STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_or_bit_32;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_or_bit_32 is
  signal o_INST_0_i_1_n_0 : STD_LOGIC;
  signal o_INST_0_i_2_n_0 : STD_LOGIC;
  signal o_INST_0_i_3_n_0 : STD_LOGIC;
  signal o_INST_0_i_4_n_0 : STD_LOGIC;
  signal o_INST_0_i_5_n_0 : STD_LOGIC;
  signal o_INST_0_i_6_n_0 : STD_LOGIC;
begin
o_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => o_INST_0_i_1_n_0,
      I1 => o_INST_0_i_2_n_0,
      I2 => o_INST_0_i_3_n_0,
      I3 => o_INST_0_i_4_n_0,
      I4 => o_INST_0_i_5_n_0,
      I5 => o_INST_0_i_6_n_0,
      O => o
    );
o_INST_0_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => A(0),
      I1 => A(1),
      O => o_INST_0_i_1_n_0
    );
o_INST_0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => A(4),
      I1 => A(5),
      I2 => A(2),
      I3 => A(3),
      I4 => A(7),
      I5 => A(6),
      O => o_INST_0_i_2_n_0
    );
o_INST_0_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => A(10),
      I1 => A(11),
      I2 => A(8),
      I3 => A(9),
      I4 => A(13),
      I5 => A(12),
      O => o_INST_0_i_3_n_0
    );
o_INST_0_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => A(16),
      I1 => A(17),
      I2 => A(14),
      I3 => A(15),
      I4 => A(19),
      I5 => A(18),
      O => o_INST_0_i_4_n_0
    );
o_INST_0_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => A(22),
      I1 => A(23),
      I2 => A(20),
      I3 => A(21),
      I4 => A(25),
      I5 => A(24),
      O => o_INST_0_i_5_n_0
    );
o_INST_0_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => A(28),
      I1 => A(29),
      I2 => A(26),
      I3 => A(27),
      I4 => A(31),
      I5 => A(30),
      O => o_INST_0_i_6_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    o : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "ALU_or_bit_32_0_0,or_bit_32,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "or_bit_32,Vivado 2023.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_or_bit_32
     port map (
      A(31 downto 0) => A(31 downto 0),
      o => o
    );
end STRUCTURE;
