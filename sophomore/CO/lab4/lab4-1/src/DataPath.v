`include "Defines.vh"
`timescale 1ns / 1ps

module DataPath(
    input wire Branch, //Beq指令
    input wire Jump, //J指令
    input wire [31:0] Data_in, //存储器输�?
    input wire [1:0] MemtoReg, //Regs写入数据源控�?
    input wire ALUSrc_B, //ALU端口B输入选择
    input wire [1:0] ImmSel, //ImmGen操作控制
    input wire [31:0]inst_field, //指令数据域[31:7]
    input wire [2:0] ALU_operation, //ALU操作控制
    input wire clk, //寄存器时�?
    input wire rst, //寄存器复�?
    input wire RegWrite, //寄存器写�?
    output [31:0] ALU_out, //ALU运算输出
    output [31:0] Data_out, //CPU数据输出
    output [31:0] PC_out, //PC指针输出
    `RegFile_Regs_output
    ); 

    // Module wires definition
    wire [31:0] Imm_out;      
    wire [31:0] add_32_0_c;
    wire [31:0] add_32_1_c;
    wire [31:0] MUX2T1_32_1_o;
    wire [31:0] MUX4T1_32_0_o;
    wire [31:0] MUX2T1_32_3_o;
    wire [31:0] MUX2T1_32_0_o;
    wire [31:0] Rs1_data;
    wire [31:0] Rs2_data;
    wire [31:0] res;
    wire zero;
    wire [31:0] Q;

    // Module instances
    ImmGen Immgen (
        // Input
        .ImmSel(ImmSel),
        .inst_field(inst_field),
        // Output
        .Imm_out(Imm_out)
    );

    add_32 add_32_0 (
        // Input
        .a(Q),
        .b(32'b100),
        // Output
        .c(add_32_0_c)
    );

    add_32 add_32_1 (
        // Input
        .a(Q),
        .b(Imm_out),
        // Output
        .c(add_32_1_c)
    );

    MUX2T1_32 MUX2T1_32_1 (
        // Input
        .I0(add_32_0_c),
        .I1(add_32_1_c),
        .s(Branch & zero),
        // Output
        .o(MUX2T1_32_1_o)
    );

    MUX4T1_32 MUX4T1_32_0 (
        // Input
        .s(MemtoReg),
        .I0(res),
        .I1(Data_in),
        .I2(add_32_0_c),
        .I3(add_32_0_c),
        // Output
        .o(MUX4T1_32_0_o)
    );

    MUX2T1_32 MUX2T1_32_3 (
        // Input
        .I0(MUX2T1_32_1_o),
        .I1(add_32_1_c),
        .s(Jump),
        // Output
        .o(MUX2T1_32_3_o)
    );

    MUX2T1_32 MUX2T1_32_0 (
        // Input
        .I0(Rs2_data),
        .I1(Imm_out),
        .s(ALUSrc_B),
        // Output
        .o(MUX2T1_32_0_o)
    );

    Regs Regs (
        // Input
        .clk(clk),
        .rst(rst),
        .Rs1_addr(inst_field[19:15]),
        .Rs2_addr(inst_field[24:20]),
        .Wt_addr(inst_field[11:7]),
        .Wt_data(MUX4T1_32_0_o),
        .RegWrite(RegWrite),
        // Output
        .Rs1_data(Rs1_data),
        .Rs2_data(Rs2_data),
        `RegFile_Regs_Arguments
    );

    ALU ALU (
        // Input
        .A(Rs1_data),
        .ALU_operation(ALU_operation),
        .B(MUX2T1_32_0_o),
        // Output
        .res(res),
        .zero(zero)
    );

    REG32 PC (
        // Input
        .clk(clk),
        .rst(rst),
        .CE(1'b1),
        .D(MUX2T1_32_3_o),
        // Output
        .Q(Q)
    );

    // Output
    assign ALU_out = res;
    assign Data_out = Rs2_data;
    assign PC_out = Q;

endmodule