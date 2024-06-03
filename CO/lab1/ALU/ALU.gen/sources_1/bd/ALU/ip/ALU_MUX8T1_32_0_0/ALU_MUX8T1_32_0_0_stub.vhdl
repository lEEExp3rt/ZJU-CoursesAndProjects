-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Thu Mar  7 20:14:42 2024
-- Host        : LAPTOP-SDV26TG8 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/lqy/Desktop/ALU/ALU.gen/sources_1/bd/ALU/ip/ALU_MUX8T1_32_0_0/ALU_MUX8T1_32_0_0_stub.vhdl
-- Design      : ALU_MUX8T1_32_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_MUX8T1_32_0_0 is
  Port ( 
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

end ALU_MUX8T1_32_0_0;

architecture stub of ALU_MUX8T1_32_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s[2:0],I0[31:0],I1[31:0],I2[31:0],I3[31:0],I4[31:0],I5[31:0],I6[31:0],I7[31:0],o[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "MUX8T1_32,Vivado 2023.1";
begin
end;
