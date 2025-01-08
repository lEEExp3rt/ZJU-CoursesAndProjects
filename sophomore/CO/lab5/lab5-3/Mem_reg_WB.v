`timescale 1ns / 1ps

module Mem_reg_WB(
    input clk_MemWB,
    input rst_MemWB,
    input en_MemWB,
    input [31:0] PC4_in_MemWB,
    input [31:0] PC_in_MemWB, // NEW
    input [31:0] Inst_in_MemWB, // NEW
    input [4:0] Rd_addr_MemWB,
    input [31:0] ALU_in_MemWB,
    input [31:0] DMem_data_MemWB,
    input [1:0] MemtoReg_in_MemWB,
    input RegWrite_in_MemWB,
    input valid_in_MemWB, // STALL
    output [31:0] PC4_out_MemWB,
    output [31:0] PC_out_MemWB, // NEW
    output [31:0] Inst_out_MemWB, // NEW
    output [4:0] Rd_addr_out_MemWB,
    output [31:0] ALU_out_MemWB,
    output [31:0] DMem_data_out_MemWB,
    output [1:0] MemtoReg_out_MemWB,
    output RegWrite_out_MemWB,
    output valid_out_MemWB // STALL
    );

    reg [31:0] PC4;
    reg [31:0] PC;
    reg [31:0] Inst;
    reg [4:0] Rd_addr;
    reg [31:0] ALU;
    reg [31:0] DMem_data;
    reg [1:0] MemtoReg;
    reg RegWrite;
    reg valid;

    always @(posedge clk_MemWB or posedge rst_MemWB) begin
        if (rst_MemWB) begin
            PC4 <= 32'b0;
            PC <= 32'b0;
            Inst <= 32'b0;
            Rd_addr <= 5'b0;
            ALU <= 32'b0;
            DMem_data <= 32'b0;
            MemtoReg <= 2'b0;
            RegWrite <= 1'b0;
            valid <= 1'b1;
        /*end else if (!valid_in_MemWB) begin
            valid <= 1'b0;
            */
        end else if (en_MemWB) begin
            PC4 <= PC4_in_MemWB;
            PC <= PC4_in_MemWB;
            Inst <= Inst_in_MemWB;
            Rd_addr <= Rd_addr_MemWB;
            ALU <= ALU_in_MemWB;
            DMem_data <= DMem_data_MemWB;
            MemtoReg <= MemtoReg_in_MemWB;
            RegWrite <= RegWrite_in_MemWB;
            valid <= 1'b1;
        end
    end

    assign PC4_out_MemWB = PC4;
    assign PC_out_MemWB = PC;
    assign Inst_out_MemWB = Inst;
    assign Rd_addr_out_MemWB = Rd_addr;
    assign ALU_out_MemWB = ALU;
    assign DMem_data_out_MemWB = DMem_data;
    assign MemtoReg_out_MemWB = MemtoReg;
    assign RegWrite_out_MemWB = RegWrite;
    assign valid_out_MemWB = valid;

endmodule