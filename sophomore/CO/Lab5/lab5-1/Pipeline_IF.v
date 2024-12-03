`timescale 1ns / 1ps

module Pipeline_IF(
    input clk_IF,
    input rst_IF,
    input en_IF,
    input [31:0] PC_in_IF,
    input PCSrc,
    output [31:0] PC_out_IF
    );

    REG32 PC (
        .clk(clk_IF),
       .rst(rst_IF),
       .CE(en_IF),
       .D(PCSrc? PC_in_IF: 32'b100 + PC_out_IF),
       .Q(PC_out_IF)
    );

endmodule