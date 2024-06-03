-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Thu Mar  7 20:14:42 2024
-- Host        : LAPTOP-SDV26TG8 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/lqy/Desktop/ALU/ALU.gen/sources_1/bd/ALU/ip/ALU_SignalExt_32_0_0/ALU_SignalExt_32_0_0_sim_netlist.vhdl
-- Design      : ALU_SignalExt_32_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ALU_SignalExt_32_0_0 is
  port (
    S : in STD_LOGIC;
    So : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ALU_SignalExt_32_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ALU_SignalExt_32_0_0 : entity is "ALU_SignalExt_32_0_0,SignalExt_32,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of ALU_SignalExt_32_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of ALU_SignalExt_32_0_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of ALU_SignalExt_32_0_0 : entity is "SignalExt_32,Vivado 2023.1";
end ALU_SignalExt_32_0_0;

architecture STRUCTURE of ALU_SignalExt_32_0_0 is
  signal \^s\ : STD_LOGIC;
begin
  So(31) <= \^s\;
  So(30) <= \^s\;
  So(29) <= \^s\;
  So(28) <= \^s\;
  So(27) <= \^s\;
  So(26) <= \^s\;
  So(25) <= \^s\;
  So(24) <= \^s\;
  So(23) <= \^s\;
  So(22) <= \^s\;
  So(21) <= \^s\;
  So(20) <= \^s\;
  So(19) <= \^s\;
  So(18) <= \^s\;
  So(17) <= \^s\;
  So(16) <= \^s\;
  So(15) <= \^s\;
  So(14) <= \^s\;
  So(13) <= \^s\;
  So(12) <= \^s\;
  So(11) <= \^s\;
  So(10) <= \^s\;
  So(9) <= \^s\;
  So(8) <= \^s\;
  So(7) <= \^s\;
  So(6) <= \^s\;
  So(5) <= \^s\;
  So(4) <= \^s\;
  So(3) <= \^s\;
  So(2) <= \^s\;
  So(1) <= \^s\;
  So(0) <= \^s\;
  \^s\ <= S;
end STRUCTURE;
