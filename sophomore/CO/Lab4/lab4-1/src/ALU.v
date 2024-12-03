`timescale 1ns / 1ps

module ALU(
    input [2:0] ALU_operation,
    input [31:0] A,
    input [31:0] B,
    output [31:0] res,
    output zero
    );

    reg [31:0] ans;

    always @(*)
    begin
        case(ALU_operation)
            3'b000: ans <= A & B; // And
            3'b001: ans <= A | B; // Or
            3'b010: ans <= A + B; // Add
            3'b011: ans <= A ^ B; // Xor
            3'b100: ans <= ~(A | B); // Nor
            3'b101: ans <= $unsigned(A) >> $unsigned(B); // Srl
            3'b110: ans <= A + ~B + 1; // Sub
            3'b111: ans <= ($signed(A) < $signed(B)) ? 32'b1 : 32'b0; // Slt
        endcase
    end
    assign res = ans;
    assign zero = (res == 0) ? 1 : 0;
endmodule