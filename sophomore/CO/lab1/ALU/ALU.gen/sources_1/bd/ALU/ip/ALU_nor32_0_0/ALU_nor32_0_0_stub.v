// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Thu Mar  7 20:16:21 2024
// Host        : LAPTOP-SDV26TG8 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/lqy/Desktop/ALU/ALU.gen/sources_1/bd/ALU/ip/ALU_nor32_0_0/ALU_nor32_0_0_stub.v
// Design      : ALU_nor32_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "nor32,Vivado 2023.1" *)
module ALU_nor32_0_0(A, B, res)
/* synthesis syn_black_box black_box_pad_pin="A[31:0],B[31:0],res[31:0]" */;
  input [31:0]A;
  input [31:0]B;
  output [31:0]res;
endmodule
