`timescale 1ns / 1ps

module REG32(
    input clk, rst, CE, [31:0] D,
    output reg [31:0] Q
    );
    always @(posedge clk or posedge rst) begin
        if (rst) Q <= 0;
        else if (CE) Q <= D;
    end
endmodule