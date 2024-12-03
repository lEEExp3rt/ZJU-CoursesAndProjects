`timescale 1ns / 1ps

module ALU(
    input [3:0] ALU_operation,
    input [31:0] A,
    input [31:0] B,
    output [31:0] res,
    output zero
    );

    reg [31:0] ans;
    wire [31:0] sub;
    assign sub = A + ~B + 1;

    always @(*)
    begin
        case(ALU_operation)
            4'b0010: ans <= A + B; // Add
            4'b0110: ans <= sub; // Sub
            4'b1110: ans <= A << B[4:0]; // Sll
            4'b0111: ans <= A[31] ^ B[31] ? (A[31] ? 32'b1 : 32'b0) : (sub[31] ? 32'b1 : 32'b0); // Slti
            4'b1001: ans <= (A < B) ? 32'b1 : 32'b0; // Sltu
            4'b1100: ans <= A ^ B; // Xor
            4'b1101: ans <= A >> B[4:0]; // Srl
            4'b1111: ans <= $signed(A) >>> B[4:0]; // Sra
            4'b0001: ans <= A | B; // Or
            4'b0000: ans <= A & B; // And
            default : ans <= 32'hx;
        endcase
    end
    assign res = ans;
    assign zero = (res == 0);
endmodule

/*
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
            3'b101: ans <= A >> B[4:0]; // Srl
            3'b110: ans <= A + ~B + 1; // Sub
            3'b111: ans <= A < B ? 32'b1 : 32'b0; // Slt
        endcase
    end
    assign res = ans;
    assign zero = (res == 0) ? 1 : 0;
endmodule
*/