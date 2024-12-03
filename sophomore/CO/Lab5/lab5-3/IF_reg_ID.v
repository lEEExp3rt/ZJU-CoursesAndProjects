`timescale 1ns / 1ps

module IF_reg_ID( 
    input clk_IFID, // 寄存器时钟
    input rst_IFID, // 寄存器复位
    input en_IFID, // 寄存器使能
    input [31:0] PC_in_IFID, // PC输入
    input [31:0] inst_in_IFID, // 指令输入
    input NOP_IFID, // 插入NOP使能
    output [31:0] PC_out_IFID, // PC输出
    output [31:0] inst_out_IFID, // 指令输出
    output valid_IFID // 寄存器有效
    ); 

    reg [31:0] PC;
    reg [31:0] inst;
    reg valid;

    always @(posedge clk_IFID or posedge rst_IFID) begin
        if (rst_IFID) begin
            PC <= 32'h00000000;
            inst <= 32'h00000000;
            valid <= 1'b1;
        end else if (NOP_IFID) begin
            PC <= 32'h00000000;
            inst <= 32'h00000013;
            valid <= 1'b0;
        end else if (en_IFID) begin
            PC <= PC_in_IFID;
            inst <= inst_in_IFID;
            valid <= 1'b1;
        end
    end

    assign PC_out_IFID = PC;
    assign inst_out_IFID = inst;
    assign valid_IFID = valid;

endmodule