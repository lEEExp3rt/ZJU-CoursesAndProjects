-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Thu Mar  7 20:16:19 2024
-- Host        : LAPTOP-SDV26TG8 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top ALU_or_bit_32_0_0 -prefix
--               ALU_or_bit_32_0_0_ ALU_or_bit_32_0_0_stub.vhdl
-- Design      : ALU_or_bit_32_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_or_bit_32_0_0 is
  Port ( 
    A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    o : out STD_LOGIC
  );

end ALU_or_bit_32_0_0;

architecture stub of ALU_or_bit_32_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "A[31:0],o";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "or_bit_32,Vivado 2023.1";
begin
end;
