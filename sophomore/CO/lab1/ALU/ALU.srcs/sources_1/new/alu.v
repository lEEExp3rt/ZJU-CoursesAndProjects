`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/07 20:34:47
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU
   (A,
    ALU_operation,
    B,
    res,
    zero);
  input [31:0]A;
  input [2:0]ALU_operation;
  input [31:0]B;
  output [31:0]res;
  output zero;

  wire [2:0]ALU_operation_1;
  wire [31:0]A_1;
  wire [31:0]B_1;
  wire [31:0]MUX8T1_32_0_o;
  wire [31:0]SignalExt_32_0_So;
  wire [32:0]addc_32_0_S;
  wire [31:0]and32_0_res;
  wire [31:0]nor32_0_res;
  wire [31:0]or32_0_res;
  wire or_bit_32_0_o;
  wire [31:0]srl32_0_res;
  wire [31:0]xlconcat_0_dout;
  wire [30:0]xlconstant_0_dout;
  wire [0:0]xlslice_0_Dout;
  wire [0:0]xlslice_1_Dout;
  wire [0:0]xlslice_2_Dout;
  wire [31:0]xor32_0_res;
  wire [31:0]xor32_1_res;

  assign ALU_operation_1 = ALU_operation[2:0];
  assign A_1 = A[31:0];
  assign B_1 = B[31:0];
  assign res[31:0] = MUX8T1_32_0_o;
  assign zero = or_bit_32_0_o;
  MUX8T1_32 MUX8T1_32_0
       (.I0(and32_0_res),
        .I1(or32_0_res),
        .I2({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,xlslice_0_Dout}),
        .I3(xor32_1_res),
        .I4(nor32_0_res),
        .I5(srl32_0_res),
        .I6({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,xlslice_0_Dout}),
        .I7(xlconcat_0_dout),
        .o(MUX8T1_32_0_o),
        .s(ALU_operation_1));
  SignalExt_32 SignalExt_32_0
       (.S(xlslice_1_Dout),
        .So(SignalExt_32_0_So));
  addc_32 addc_32_0
       (.A(A_1),
        .B(xor32_0_res),
        .C0(xlslice_1_Dout),
        .S(addc_32_0_S));
  and32 and32_0
       (.A(A_1),
        .B(B_1),
        .res(and32_0_res));
  nor32 nor32_0
       (.A(A_1),
        .B(B_1),
        .res(nor32_0_res));
  or32 or32_0
       (.A(A_1),
        .B(B_1),
        .res(or32_0_res));
  or_bit_32 or_bit_32_0
       (.A(MUX8T1_32_0_o),
        .o(or_bit_32_0_o));
  srl32 srl32_0
       (.A(A_1),
        .B(B_1),
        .res(srl32_0_res));
  ALU_xlconcat_0_0 xlconcat_0
       (.In0(xlslice_2_Dout),
        .In1(xlconstant_0_dout),
        .dout(xlconcat_0_dout));
  ALU_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  ALU_xlslice_0_0 xlslice_0
       (.Din(addc_32_0_S[2:0]),
        .Dout(xlslice_0_Dout));
  ALU_xlslice_0_1 xlslice_1
       (.Din({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ALU_operation_1}),
        .Dout(xlslice_1_Dout));
  ALU_xlslice_1_0 xlslice_2
       (.Din(addc_32_0_S),
        .Dout(xlslice_2_Dout));
  xor32 xor32_0
       (.A(SignalExt_32_0_So),
        .B(B_1),
        .res(xor32_0_res));
  xor32 xor32_1
       (.A(A_1),
        .B(B_1),
        .res(xor32_1_res));
endmodule
