`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:03:10 12/12/2023 
// Design Name: 
// Module Name:    My74LS161 
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
module My74LS161(
    input wire CR,Ld,CTP,CTT,CP,
	 input wire [3:0] D,
	 output wire Co,
	 output reg [3:0] Q
    );
	 assign Co=(|Q)&CTT;
	 always @ (posedge CP or negedge CR) begin
	   if(~CR) Q=4'b0000;
		else if(~Ld) Q=D;
		else if(CTP&&CTT) Q=Q+4'b0001;
	end
	


endmodule
