`timescale 1ns / 1ps

module SCPU_ctrl(
    input [4:0] OPcode, // Opcode------inst[6:2]
    input [2:0] Fun3, // Function-----inst[14:12]
    input Fun7, // Function-----inst[30]
    input MIO_ready, // CPU Wait not use
    output reg [1:0] ImmSel, // 立即数选择控制
    output reg ALUSrc_B, // 源操作数2选择
    output reg [1:0] MemtoReg, // 写回数据选择控制
    output reg Jump, // jal
    output reg Branch, // beq
    output reg BranchN, // bne
    output reg RegWrite, // 寄存器写使能
    output reg MemRW, // 存储器读写使能
    output reg [2:0] ALU_Control, // alu控制
    output CPU_MIO // not use
    );

    reg [1:0] ALUop;
    wire [3:0] Fun;
    assign Fun = {Fun3,Fun7};
    `define CPU_ctrl_signals {ImmSel, ALUSrc_B, MemtoReg, RegWrite, MemRW, Branch, BranchN, Jump, ALUop}
    always@(*) begin
        case(OPcode)
            5'b01100: begin `CPU_ctrl_signals = {2'b00, 1'b0, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 2'b10}; end // ALU
            5'b00000: begin `CPU_ctrl_signals = {2'b00, 1'b1, 2'b01, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 2'b00}; end // load
            5'b01000: begin `CPU_ctrl_signals = {2'b01, 1'b1, 2'b00, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00}; end // store
            5'b11000: begin 
                case(Fun3[0])
                    1'b0: begin `CPU_ctrl_signals = {2'b10, 1'b0, 2'b00, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 2'b01}; end // beq
                    1'b1: begin `CPU_ctrl_signals = {2'b10, 1'b0, 2'b00, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 2'b01}; end // bne
                endcase
            end 
            5'b11011: begin `CPU_ctrl_signals = {2'b11, 1'b0, 2'b10, 1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 2'b00}; end // jump
            5'b00100: begin `CPU_ctrl_signals = {2'b00, 1'b1, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 2'b11}; end // ALU(addi;;;;)
            default: begin `CPU_ctrl_signals = {2'b00, 1'b1, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 2'b11}; end
        endcase
    end

    always@(*) begin
        case(ALUop)
            2'b00: ALU_Control = 3'b010; // add计算地址
            2'b01: ALU_Control = 3'b110; // sub比较条件
            2'b10:
                case(Fun)
                    4'b0000: ALU_Control = 3'b010 ; // add
                    4'b0001: ALU_Control = 3'b110; // sub
                    4'b1110: ALU_Control = 3'b000; // and
                    4'b1100: ALU_Control = 3'b001; // or
                    4'b0100: ALU_Control = 3'b111; // slt
                    4'b1010: ALU_Control = 3'b101; // srl
                    4'b1000: ALU_Control = 3'b011; // xor
                    default: ALU_Control = 3'bxxx;  
                endcase
            2'b11:
                case(Fun3)
                    3'b000: ALU_Control = 3'b010; // addi    
                    3'b010: ALU_Control = 3'b111; // slti
                    3'b100: ALU_Control = 3'b011; //  xori
                    3'b110: ALU_Control = 3'b001; // ori
                    3'b111: ALU_Control = 3'b000; // andi
                    3'b101: ALU_Control = 3'b101; // srli
                    default: ALU_Control = 3'bxxx;
                endcase
        endcase
    end

    assign CPU_MIO = MIO_ready;

endmodule