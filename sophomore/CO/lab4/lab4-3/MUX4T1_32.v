`timescale 1ns / 1ps

module MUX4T1_32(
    input [1:0]s,
	input [31:0]I0,
	input [31:0]I1,
	input [31:0]I2,
	input [31:0]I3,						
	output [31:0]o
    );
    assign o = s[1] ? (s[0] ? I3 : I2) : (s[0] ? I1 : I0);
endmodule