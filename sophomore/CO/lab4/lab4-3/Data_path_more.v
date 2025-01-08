`include "Defines.vh"
`timescale 1ns / 1ps

module Data_path_more(
    input [1:0] Jump, //J指令
    input Branch, //Beq指令
    input BranchN, //Bne指令
    input ALUSrc_B, //ALU端口B输入选择
    input [3:0] ALU_Control, //ALU操作控制
    input clk, //寄存器时�???
    input [1:0] MemtoReg, //Regs写入数据源控�???
    input [31:0] Data_in, //存储器输�???
    input [2:0] ImmSel, //ImmGen操作控制
    input [31:0] inst_field, //指令数据域[31:7]
    input rst, //寄存器复�???
    input RegWrite, //寄存器写信号
    output wire [31:0] PC_out, //PC指针输出
    output [31:0] ALU_out, //ALU运算输出
    output [31:0] Data_out, //CPU数据输出
    `RegFile_Regs_output
    );

    // Wires Definition.
    // ImmGen_0 wires definition.
    wire [31:0] imm_out;
    // add_32_0 wires definition.
    wire [31:0] add_32_0_c;
    // add_32_1 wires definition.
    wire [31:0] add_32_1_c;
    // MUX4T1_32_0 wires definition.
    wire [31:0] MUX4T1_32_0_o;
    // MUX2T1_32_1 wires definition.
    wire [31:0] MUX2T1_32_1_o;
    // MUX4T1_32_1 wires definition.
    wire [31:0] MUX4T1_32_1_o;
    // MUX2T1_32_0 wire definition.
    wire [31:0] MUX2T1_32_0_o;
    // Regs_0 wires definition.
    wire [31:0] Rs1_data;
    wire [31:0] Rs2_data;
    // PC wires definition.
    wire [31:0] Q;
    // ALU_0 wires definition.
    wire [31:0] res;
    wire zero;

    // Module definition.
    // ImmGen_0
    ImmGen ImmGen_0 (
        // Input.
        .ImmSel(ImmSel),
        .inst_field(inst_field),
        // Output.
        .Imm_out(imm_out)
    );

    // add_32_0
    add_32 add_32_0 (
        // Input.
        .a(32'h4),
        .b(Q),
        // Output.
        .c(add_32_0_c)
    );

    // add_32_1
    add_32 add_32_1 (
        // Input.
        .a(Q),
        .b(imm_out),
        // Output.
        .c(add_32_1_c)
    );

    // MUX4T1_32_0
    MUX4T1_32 MUX4T1_32_0 (
        // Input.
        .s(MemtoReg),
        .I0(res),
        .I1(Data_in),
        .I2(add_32_0_c),
        .I3(imm_out),
        // Output.
        .o(MUX4T1_32_0_o)
    );

    // MUX2T1_32_1
    MUX2T1_32 MUX2T1_32_1 (
        // Input.
        .s((Branch & zero) | (BranchN & !zero)),
        .I0(add_32_0_c),
        .I1(add_32_1_c),
        // Output.
        .o(MUX2T1_32_1_o)
    );

    // MUX4T1_32_1
    MUX4T1_32 MUX4T1_32_1 (
        // Input.
        .s(Jump),
        .I0(MUX2T1_32_1_o),
        .I1(add_32_1_c),
        .I2(res),
        .I3(MUX2T1_32_1_o),
        // Output.
        .o(MUX4T1_32_1_o)
    );

    // MUX2T1_32_0
    //assign MUX2T1_32_0_o = (ALUSrc_B ? imm_out : Rs2_data);
    MUX2T1_32 MUX2T1_32_0 (
        // Input.
        .s(ALUSrc_B),
        .I0(Rs2_data),
        .I1(imm_out),
        // Output.
        .o(MUX2T1_32_0_o)
    );

    // Regs_0
    Regs Regs_0 (
        // Input.
        .clk(clk),
        .rst(rst),
        .Rs1_addr(inst_field[19:15]),
        .Rs2_addr(inst_field[24:20]),
        .Wt_addr(inst_field[11:7]),
        .Wt_data(MUX4T1_32_0_o),
        .RegWrite(RegWrite),
        // Output.
        .Rs1_data(Rs1_data),
        .Rs2_data(Rs2_data),
        `RegFile_Regs_Arguments
    );

    // PC
    REG32 PC (
        // Input.
        .clk(clk),
        .rst(rst),
        .CE(1'b1),
        .D(MUX4T1_32_1_o),
        // Output.
        .Q(Q)
    );

    // ALU_0
    ALU ALU_0 (
        // Input.
        .A(Rs1_data),
        .B(MUX2T1_32_0_o),
        .ALU_operation(ALU_Control),
        // Output.
        .res(res),
        .zero(zero)
    );

    // Output.
    assign PC_out = Q;
    assign ALU_out = res;
    assign Data_out = Rs2_data;

endmodule