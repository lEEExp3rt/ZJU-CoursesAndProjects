`include "Defines.vh"
`timescale 1ns / 1ps

module SCPU_more(
    input MIO_ready,
    input [31:0] Data_in,
    input clk,
    input [31:0] inst_in,
    input rst,
    output MemRW,
    output CPU_MIO,
    output [31:0] Addr_out,
    output [31:0] Data_out,
    output [31:0] PC_out,
    `RegFile_Regs_output
    );

    /* Module wires definition */
    // Controller
    wire [2:0] immsel;
    wire alusrc_b;
    wire [1:0] memtoreg;
    wire [1:0] jump;
    wire branch;
    wire branchn;
    wire regwrite;
    wire memrw;
    wire [3:0] alu_control;
    wire cpu_mio;
    // DataPath
    wire [31:0] alu_out;
    wire [31:0] data_out;
    wire [31:0] pc_out;

    /* Module connection */
    SCPU_ctrl_more Controller (
        // Input.
        .OPcode(inst_in[6:2]),
        .Fun3(inst_in[14:12]),
        .Fun7(inst_in[30]),
        .MIO_ready(MIO_ready),
        // Output.
        .ImmSel(immsel),
        .ALUSrc_B(alusrc_b),
        .MemtoReg(memtoreg),
        .Jump(jump),
        .Branch(branch),
        .BranchN(branchn),
        .RegWrite(regwrite),
        .MemRW(memrw),
        .ALU_Control(alu_control),
        .CPU_MIO(cpu_mio)
    );

    Data_path_more DataPath (
        // Input.
        .ALUSrc_B(alusrc_b),
        .ALU_Control(alu_control),
        .Branch(branch),
        .BranchN(branchn),
        .Data_in(Data_in),
        .ImmSel(immsel),
        .Jump(jump),
        .MemtoReg(memtoreg),
        .RegWrite(regwrite),
        .clk(clk),
        .inst_field(inst_in),
        .rst(rst),
        // Output.
        .ALU_out(alu_out),
        .Data_out(data_out),
        .PC_out(pc_out),
        `RegFile_Regs_Arguments
    );

    // Output.
    assign MemRW = memrw;
    assign CPU_MIO = cpu_mio;
    assign Addr_out = alu_out;
    assign Data_out = data_out;
    assign PC_out = pc_out;

endmodule