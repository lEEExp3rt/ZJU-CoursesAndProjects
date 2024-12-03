`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/08 13:34:52
// Design Name: 
// Module Name: ALU_Wrapper
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

module ALU_wrapper(
    input [2:0] ALU_operation,
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] res,
    output reg zero
    );
    /* Logical Functions Here */
    always @(*)
    begin
        case(ALU_operation)
            3'b000: res <= A & B; // And
            3'b001: res <= A | B; // Or
            3'b010: res <= A + B; // Add
            3'b011: res <= A ^ B; // Xor
            3'b100: res <= ~(A | B); // Nor
            3'b101: res <= A >> B; // Srl
            3'b110: res <= A - B; // Sub
            3'b111: res <= (A + B) ? 1'b1 : 1'b0; // Set on less than ???
        endcase
    end
endmodule