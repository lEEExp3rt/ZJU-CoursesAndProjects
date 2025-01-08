`timescale 1ns / 1ps

module SCPU(
    input wire clk,
    input wire rst,
    input wire MIO_ready,
    input wire [31:0] inst_in,
    input wire [31:0] Data_in,

    output wire CPU_MIO,
    output wire MemRW,
    output wire [31:0] PC_out,
    output wire [31:0] Data_out,
    output wire [31:0] Addr_out
    );

    // Controller wires definition
    wire [1:0] immsel;
    wire alusrc_b;
    wire [1:0] memtoreg;
    wire jump;
    wire branch;
    wire regwrite;
    wire memrw;
    wire [2:0] alu_control;
    wire cpu_mio;
    // DataPath wires definition
    wire [31:0] alu_out;
    wire [31:0] data_out;
    wire [31:0] pc_out;

    SCPU_ctrl Controller (
        // Input
        .OPcode(inst_in[6:2]),
        .Fun3(inst_in[14:12]),
        .Fun7(inst_in[30]),
        .MIO_ready(MIO_ready),
        // Output
        .ImmSel(immsel),
        .ALUSrc_B(alusrc_b),
        .MemtoReg(memtoreg),
        .Jump(jump),
        .Branch(branch),
        .RegWrite(regwrite),
        .MemRW(memrw),
        .ALU_Control(alu_control),
        .CPU_MIO(cpu_mio)
    );

    DataPath DataPath (
        // Input
        .ALUSrc_B(alusrc_b),
        .ALU_Control(alu_control),
        .Branch(branch),
        .Data_in(Data_in),
        .ImmSel(immsel),
        .Jump(jump),
        .MemtoReg(memtoreg),
        .RegWrite(regwrite),
        .clk(clk),
        .inst_field(inst_in),
        .rst(rst),
        // Output
        .ALU_out(alu_out),
        .Data_out(data_out),
        .PC_out(pc_out)
    );

    assign MemRW = memrw;
    assign CPU_MIO = cpu_mio;
    assign Addr_out = alu_out;
    assign Data_out = data_out;
    assign PC_out = pc_out;

endmodule