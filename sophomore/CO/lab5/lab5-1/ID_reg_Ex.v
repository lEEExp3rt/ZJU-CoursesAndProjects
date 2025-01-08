`timescale 1ns / 1ps

module ID_reg_Ex(
    input clk_IDEX,
    input rst_IDEX,
    input en_IDEX,
    input [31:0] PC_in_IDEX,
    input [4:0] Rd_addr_IDEX,
    input [31:0] Rs1_in_IDEX,
    input [31:0] Rs2_in_IDEX,
    input [31:0] Imm_in_IDEX,
    input ALUSrc_B_in_IDEX,
    input [2:0] ALU_control_in_IDEX,
    input Branch_in_IDEX,
    input BranchN_in_IDEX,
    input MemRW_in_IDEX,
    input Jump_in_IDEX,
    input [1:0] MemtoReg_in_IDEX,
    input RegWrite_in_IDEX,
    output [31:0] PC_out_IDEX,
    output [4:0] Rd_addr_out_IDEX,
    output [31:0] Rs1_out_IDEX,
    output [31:0] Rs2_out_IDEX,
    output [31:0] Imm_out_IDEX,
    output ALUSrc_B_out_IDEX,
    output [2:0] ALU_control_out_IDEX,
    output Branch_out_IDEX,
    output BranchN_out_IDEX,
    output MemRW_out_IDEX,
    output Jump_out_IDEX,
    output [1:0] MemtoReg_out_IDEX,
    output RegWrite_out_IDEX
    );

    reg [31:0] PC;
    reg [4:0] Rd_addr;
    reg [31:0] Rs1;
    reg [31:0] Rs2;
    reg [31:0] Imm;
    reg ALUSrc_B;
    reg [2:0] ALU_control;
    reg Branch;
    reg BranchN;
    reg MemRW;
    reg Jump;
    reg [1:0] MemtoReg;
    reg RegWrite;

    always @ (posedge clk_IDEX or posedge rst_IDEX) begin
        if (rst_IDEX) begin
            PC <= 32'b0;
            Rd_addr <= 4'b0;
            Rs1 <= 32'b0;
            Rs2 <= 32'b0;
            Imm <= 32'b0;
            ALUSrc_B <= 1'b0;
            ALU_control <= 3'b0;
            Branch <= 1'b0;
            BranchN <= 1'b0;
            MemRW <= 1'b0;
            Jump <= 1'b0;
            MemtoReg <= 2'b0;
            RegWrite <= 1'b0;
        end else if (en_IDEX) begin
            PC <= PC_in_IDEX;
            Rd_addr <= Rd_addr_IDEX;
            Rs1 <= Rs1_in_IDEX;
            Rs2 <= Rs2_in_IDEX;
            Imm <= Imm_in_IDEX;
            ALUSrc_B <= ALUSrc_B_in_IDEX;
            ALU_control <= ALU_control_in_IDEX;
            Branch <= Branch_in_IDEX;
            BranchN <= BranchN_in_IDEX;
            MemRW <= MemRW_in_IDEX;
            Jump <= Jump_in_IDEX;
            MemtoReg <= MemtoReg_in_IDEX;
            RegWrite <= RegWrite_in_IDEX;
        end
    end

    assign PC_out_IDEX = PC;
    assign Rd_addr_out_IDEX = Rd_addr;
    assign Rs1_out_IDEX = Rs1;
    assign Rs2_out_IDEX = Rs2;
    assign Imm_out_IDEX = Imm;
    assign ALUSrc_B_out_IDEX = ALUSrc_B;
    assign ALU_control_out_IDEX = ALU_control;
    assign Branch_out_IDEX = Branch;
    assign BranchN_out_IDEX = BranchN;
    assign MemRW_out_IDEX = MemRW;
    assign Jump_out_IDEX = Jump;
    assign MemtoReg_out_IDEX = MemtoReg;
    assign RegWrite_out_IDEX = RegWrite;

endmodule