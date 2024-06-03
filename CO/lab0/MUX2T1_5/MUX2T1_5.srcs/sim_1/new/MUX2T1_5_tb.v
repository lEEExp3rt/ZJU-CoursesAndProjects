`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/29 20:24:50
// Design Name: 
// Module Name: MUX2T1_5_tb
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
module MUX2T1_5_tb();
     reg [4:0] I0;
	 reg [4:0] I1;
	 reg s;
	 
	 wire [4:0]o;
	 initial begin
	    s = 0;
	    I0 = 0;
	    I1 = 1;
	    #50;
	    s = 0;
	    #50;
	    s = 1;
	    #50;
	    I0 = 4'h5;
	    I1 = 4'hA;
	    #50;
	    s = 0;
	    #50;
	    s = 1;
	    #50;
	    s = 0;
	    #100 $stop;
	 end
	  MUX2T1_5 MUX(
	           .I0(I0),
	           .I1(I1),
	           .s(s),
	           .o(o)
	  );
endmodule