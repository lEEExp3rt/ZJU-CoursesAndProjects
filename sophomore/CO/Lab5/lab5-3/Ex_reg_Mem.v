`timescale 1ns / 1ps

module Ex_reg_Mem(
    input clk_EXMem,
    input rst_EXMem,
    input en_EXMem,
    input [31:0] PC_imm_EXMem, // NEW
    input [31:0] PC_in_EXMem,
    input [31:0] PC4_in_EXMem,
    input [31:0] Inst_in_EXMem, // NEW
    input [4:0] Rd_addr_EXMem,
    input zero_in_EXMem,
    input [31:0] ALU_in_EXMem,
    input [31:0] Rs2_in_EXMem,
    input Branch_in_EXMem,
    input BranchN_in_EXMem,
    input MemRW_in_EXMem,
    input Jump_in_EXMem,
    input [1:0] MemtoReg_in_EXMem,
    input RegWrite_in_EXMem,
    input valid_in_EXMem, // STALL
    output [31:0] PC_out_EXMem,
    output [31:0] PC4_out_EXMem,
    output [31:0] PC_imm_out_EXMem, // NEW
    output [31:0] Inst_out_EXMem, // NEW
    output [4:0] Rd_addr_out_EXMem,
    output zero_out_EXMem,
    output [31:0] ALU_out_EXMem,
    output [31:0] Rs2_out_EXMem,
    output Branch_out_EXMem,
    output BranchN_out_EXMem,
    output MemRW_out_EXMem,
    output Jump_out_EXMem,
    output [1:0] MemtoReg_out_EXMem,
    output RegWrite_out_EXMem,
    output valid_out_EXMem // STALL
    );

    reg [31:0] PC_imm;
    reg [31:0] PC;
    reg [31:0] PC4;
    reg [31:0] Inst;
    reg [4:0] Rd_addr;
    reg zero;
    reg [31:0] ALU;
    reg [31:0] Rs2;
    reg Branch;
    reg BranchN;
    reg MemRW;
    reg Jump;
    reg [1:0] MemtoReg;
    reg RegWrite;
    reg valid;

    always @ (posedge clk_EXMem or posedge rst_EXMem) begin
        if (rst_EXMem) begin
            PC_imm <= 32'b0;
            PC <= 32'b0;
            PC4 <= 32'b0;
            Inst <= 32'b0;
            Rd_addr <= 4'b0;
            zero <= 1'b0;
            ALU <= 32'b0;
            Rs2 <= 32'b0;
            Branch <= 1'b0;
            BranchN <= 1'b0;
            MemRW <= 1'b0;
            Jump <= 1'b0;
            MemtoReg <= 2'b0;
            RegWrite <= 1'b0;
            valid <= 1'b1;
        /*end else if (!valid_in_EXMem) begin
            valid <= 1'b0;
            */
        end else if (en_EXMem) begin
            PC_imm <= PC_imm_EXMem;
            PC <= PC_in_EXMem;
            PC4 <= PC4_in_EXMem;
            Inst <= Inst_in_EXMem;
            Rd_addr <= Rd_addr_EXMem;
            zero <= zero_in_EXMem;  
            ALU <= ALU_in_EXMem;
            Rs2 <= Rs2_in_EXMem;
            Branch <= Branch_in_EXMem;
            BranchN <= BranchN_in_EXMem;
            MemRW <= MemRW_in_EXMem;
            Jump <= Jump_in_EXMem;
            MemtoReg <= MemtoReg_in_EXMem;
            RegWrite <= RegWrite_in_EXMem;
            valid <= 1'b1;
        end
    end

    assign PC_imm_out_EXMem = PC_imm;
    assign PC_out_EXMem = PC;
    assign PC4_out_EXMem = PC4;
    assign Inst_out_EXMem = Inst;
    assign Rd_addr_out_EXMem = Rd_addr;
    assign zero_out_EXMem = zero;
    assign ALU_out_EXMem = ALU;
    assign Rs2_out_EXMem = Rs2;
    assign Branch_out_EXMem = Branch;
    assign BranchN_out_EXMem = BranchN;
    assign MemRW_out_EXMem = MemRW;
    assign Jump_out_EXMem = Jump;
    assign MemtoReg_out_EXMem = MemtoReg;
    assign RegWrite_out_EXMem = RegWrite;
    assign valid_out_EXMem = valid;

endmodule