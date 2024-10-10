// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Thu Mar  7 20:14:41 2024
// Host        : LAPTOP-SDV26TG8 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top ALU_MUX8T1_32_0_0 -prefix
//               ALU_MUX8T1_32_0_0_ ALU_MUX8T1_32_0_0_stub.v
// Design      : ALU_MUX8T1_32_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "MUX8T1_32,Vivado 2023.1" *)
module ALU_MUX8T1_32_0_0(s, I0, I1, I2, I3, I4, I5, I6, I7, o)
/* synthesis syn_black_box black_box_pad_pin="s[2:0],I0[31:0],I1[31:0],I2[31:0],I3[31:0],I4[31:0],I5[31:0],I6[31:0],I7[31:0],o[31:0]" */;
  input [2:0]s;
  input [31:0]I0;
  input [31:0]I1;
  input [31:0]I2;
  input [31:0]I3;
  input [31:0]I4;
  input [31:0]I5;
  input [31:0]I6;
  input [31:0]I7;
  output [31:0]o;
endmodule
