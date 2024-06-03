`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:57:31 12/26/2023 
// Design Name: 
// Module Name:    clk_1s 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clk_4s(clk,clk_1);
input wire clk;
output reg clk_1;
reg[31:0] cnt;
initial clk_1 = 0;
always @(posedge clk) begin
    if(cnt<200_000_000)begin
	     cnt<=cnt+1;
	 end else begin
	     cnt<=0;
		  clk_1<=~clk_1;
	 end
end
endmodule

