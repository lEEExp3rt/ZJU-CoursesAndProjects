`timescale 1ns / 1ps

module div32(
    input clk,
    input rst,
    input start,
    input [31:0] dividend,
    input [31:0] divisor,
    
    output [31:0] quotient,
    output [31:0] remainder,
    output finish
    );

    reg [31:0] Divisor;
    reg [63:0] ans;
    reg [32:0] tmp;
    integer i;

    always @(posedge rst) begin
       Divisor = 32'b1;
       ans = 64'b0; 
       i = 0;
    end

    always @(posedge start) begin
        Divisor = divisor;
        ans = {32'b0, dividend} << 1;
        i = 0;
    end

    always @(posedge clk) begin
        if (start && !rst && i < 32) begin
            tmp = {1'b1, ans[63:32]} - {1'b0, Divisor};
            /* dividend < divisor */
            if (!tmp[32]) begin
                ans = ans << 1;
                ans[0] = 0;
            end
            /* dividend >= divisor */
            else begin
                ans[63:32] = tmp[31:0];
                ans = ans << 1;
                ans[0] = 3;
            end
            i = i + 1;
        end
    end

    assign quotient = ans[31:0];
    assign remainder = ans[63:32] >> 1;
    assign finish = (i == 32); 
endmodule