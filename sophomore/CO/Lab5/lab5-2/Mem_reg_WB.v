`timescale 1ns / 1ps

module Mem_reg_WB(
    input clk_MemWB,
    input rst_MemWB,
    input en_MemWB,
    input [31:0] PC4_in_MemWB,
    input [4:0] Rd_addr_MemWB,
    input [31:0] ALU_in_MemWB,
    input [31:0] DMem_data_MemWB,
    input [1:0] MemtoReg_in_MemWB,
    input RegWrite_in_MemWB,
    output [31:0] PC4_out_MemWB,
    output [4:0] Rd_addr_out_MemWB,
    output [31:0] ALU_out_MemWB,
    output [31:0] DMem_data_out_MemWB,
    output [1:0] MemtoReg_out_MemWB,
    output RegWrite_out_MemWB
    );

    reg [31:0] PC4;
    reg [4:0] Rd_addr;
    reg [31:0] ALU;
    reg [31:0] DMem_data;
    reg [1:0] MemtoReg;
    reg RegWrite;

    always @(posedge clk_MemWB or posedge rst_MemWB) begin
        if (rst_MemWB) begin
            PC4 <= 32'b0;
            Rd_addr <= 5'b0;
            ALU <= 32'b0;
            DMem_data <= 32'b0;
            MemtoReg <= 2'b0;
            RegWrite <= 1'b0;
        end else if (en_MemWB) begin
            PC4 <= PC4_in_MemWB;
            Rd_addr <= Rd_addr_MemWB;
            ALU <= ALU_in_MemWB;
            DMem_data <= DMem_data_MemWB;
            MemtoReg <= MemtoReg_in_MemWB;
            RegWrite <= RegWrite_in_MemWB;
        end
    end

    assign PC4_out_MemWB = PC4;
    assign Rd_addr_out_MemWB = Rd_addr;
    assign ALU_out_MemWB = ALU;
    assign DMem_data_out_MemWB = DMem_data;
    assign MemtoReg_out_MemWB = MemtoReg;
    assign RegWrite_out_MemWB = RegWrite;

endmodule