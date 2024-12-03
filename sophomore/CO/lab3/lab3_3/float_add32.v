`timescale 1ns / 1ps

module float_add32(
    input clk,
    input rst,
    input en,
    input [31:0] A,
    input [31:0] B,
    
    output [31:0] result,
    output finish
    );

    reg [31:0] a;
    reg [31:0] b;
    reg [8:0] exp;
    reg [31:0] ans;
    
    always @(posedge rst) begin
       a = 32'b0;
       b = 32'b0;
       ans = 32'b0;
    end

    always @(posedge en) begin
        exp = {1'b1, a[30:23]} - {1'b0, b[30:23]};
        if (exp[8]) begin
            a = A;
            b = B;
        end else begin
            a = B;
            b = a;
        end
        /* a.exp >= b.exp */
        ans = 32'b0;
    end

    always @(posedge clk) begin
        
    end
    
endmodule