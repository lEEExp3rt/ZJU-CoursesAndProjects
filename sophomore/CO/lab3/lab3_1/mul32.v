`timescale 1ns / 1ps

module mul32(
    input clk,
    input rst,
    input [31: 0] multiplicand,
    input [31: 0] multiplier,
    input start,
    
    output [63: 0] product,
    output finish
    );
    reg [63: 0] ans;
    integer i;
    always @(posedge rst) begin
        ans = 0;
        i = 0;
    end
    always @(posedge start) begin
        ans[31:0] = multiplier;
        i = 0;
    end
    always @(posedge clk) begin
        if (start && !rst && i < 32) begin
            if (product[0])
                ans[63:32] = ans[63:32] + multiplicand;
            ans = ans >> 1;
            i = i + 1;
        end
    end
    assign product = ans;
    assign finish = (i == 32);
endmodule