`timescale 1ns / 1ps

module Pipeline_WB(
    input [1:0] MemtoReg_in_WB,
    input [31:0] ALU_in_WB,
    input [31:0] DMem_data_WB,
    input [31:0] PC4_in_WB,
    output [31:0] Data_out_WB
    );

    assign Data_out_WB = (MemtoReg_in_WB[1]? PC4_in_WB: (MemtoReg_in_WB[0]? DMem_data_WB: ALU_in_WB));

endmodule