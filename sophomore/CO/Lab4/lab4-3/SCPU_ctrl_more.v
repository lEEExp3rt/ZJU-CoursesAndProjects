`timescale 1ns / 1ps

module SCPU_ctrl_more(
    input [4:0] OPcode, //OPcode
    input [2:0] Fun3, //Function
    input Fun7, //Function
    input MIO_ready, //CPU Wait
    output reg [2:0] ImmSel,
    output reg ALUSrc_B,
    output reg [1:0] MemtoReg,
    output reg [1:0] Jump,
    output reg Branch,
    output reg BranchN,
    output reg RegWrite,
    output reg MemRW,
    output reg [3:0] ALU_Control,
    output CPU_MIO
    ); 

    `define CPU_ctrl_signals {ImmSel, ALUSrc_B, MemtoReg, RegWrite, MemRW, Branch, BranchN, Jump, ALU_Control}
    always@(*) begin
        case(OPcode)
            5'b01100: begin // R-type
                case({Fun3, Fun7})
                    4'b0000: begin `CPU_ctrl_signals = {3'b010, 1'b0, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b0010}; end // add
                    4'b0001: begin `CPU_ctrl_signals = {3'b010, 1'b0, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b0110}; end // sub
                    4'b0010: begin `CPU_ctrl_signals = {3'b010, 1'b0, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b1110}; end // sll
                    4'b0100: begin `CPU_ctrl_signals = {3'b010, 1'b0, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b0111}; end // slt
                    4'b0110: begin `CPU_ctrl_signals = {3'b010, 1'b0, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b1001}; end // sltu
                    4'b1000: begin `CPU_ctrl_signals = {3'b010, 1'b0, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b1100}; end // xor
                    4'b1010: begin `CPU_ctrl_signals = {3'b010, 1'b0, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b1101}; end // srl
                    4'b1011: begin `CPU_ctrl_signals = {3'b010, 1'b0, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b1111}; end // sra
                    4'b1100: begin `CPU_ctrl_signals = {3'b010, 1'b0, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b0001}; end // or
                    4'b1110: begin `CPU_ctrl_signals = {3'b010, 1'b0, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b0000}; end // and
                    default: begin `CPU_ctrl_signals = {3'b010, 1'b0, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b0010}; end
                endcase
            end
            5'b00000: begin `CPU_ctrl_signals = {3'b001, 1'b1, 2'b01, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b0010}; end // I-type, lw
            5'b00100: begin // I-type, ALU
                case(Fun3)
                    3'b000: begin `CPU_ctrl_signals = {3'b001, 1'b1, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b0010}; end // addi
                    3'b010: begin `CPU_ctrl_signals = {3'b001, 1'b1, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b0111}; end // slti
                    3'b011: begin `CPU_ctrl_signals = {3'b001, 1'b1, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b1001}; end // sltiu
                    3'b100: begin `CPU_ctrl_signals = {3'b001, 1'b1, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b1100}; end // xori
                    3'b110: begin `CPU_ctrl_signals = {3'b001, 1'b1, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b0001}; end // ori
                    3'b111: begin `CPU_ctrl_signals = {3'b001, 1'b1, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b0000}; end // andi
                    3'b001: begin `CPU_ctrl_signals = {3'b001, 1'b1, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b1110}; end // slli
                    3'b101: begin
                        case(Fun7)
                            1'b0: begin `CPU_ctrl_signals = {3'b001, 1'b1, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b1101}; end // srli
                            1'b1: begin `CPU_ctrl_signals = {3'b001, 1'b1, 2'b00, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b1111}; end // srai
                        endcase
                    end
                endcase
            end
            5'b11001: begin `CPU_ctrl_signals = {3'b001, 1'b1, 2'b10, 1'b1, 1'b0, 1'b0, 1'b0, 2'b10, 4'b0010}; end // I-type, jalr
            5'b01000: begin // S-type
                case(Fun3)
                    //3'b000: begin `CPU_ctrl_signals = 16'b010_1_xx_0_1_0_0_00_0010; end // sb
                    //3'b001: begin `CPU_ctrl_signals = 16'b010_1_xx_0_1_0_0_00_0010; end // sh
                    3'b010: begin `CPU_ctrl_signals = {3'b010, 1'b1, 2'b00, 1'b0, 1'b1, 1'b0, 1'b0, 2'b00, 4'b0010}; end // sw
                    default: begin `CPU_ctrl_signals = {3'b010, 1'b1, 2'b00, 1'b0, 1'b1, 1'b0, 1'b0, 2'b00, 4'b0010}; end
                endcase
            end
            5'b11000: begin // B-type
                case(Fun3)
                    3'b000: begin `CPU_ctrl_signals = {3'b011, 1'b0, 2'b00, 1'b0, 1'b0, 1'b1, 1'b0, 2'b00, 4'b0110}; end // beq
                    3'b001: begin `CPU_ctrl_signals = {3'b011, 1'b0, 2'b00, 1'b0, 1'b0, 1'b0, 1'b1, 2'b00, 4'b0110}; end // bne
                    //3'b100: begin `CPU_ctrl_signals = 16'b011_0_xx_0_x_1_0_00_0111; end // blt
                    //3'b101: begin `CPU_ctrl_signals = 16'b011_0_xx_0_x_1_0_00_0111; end // bge
                    //3'b110: begin `CPU_ctrl_signals = 16'b011_0_xx_0_x_1_0_00_1001; end // bltu
                    //3'b111: begin `CPU_ctrl_signals = 16'b011_0_xx_0_x_1_0_00_1001; end // bgeu
                    default: begin `CPU_ctrl_signals = {3'b011, 1'b0, 2'b00, 1'b0, 1'b0, 1'b1, 1'b0, 2'b00, 4'bxxxx}; end
                endcase
            end
            5'b11011: begin `CPU_ctrl_signals = {3'b100, 1'b1, 2'b10, 1'b1, 1'b0, 1'b0, 1'b0, 2'b01, 4'b0010}; end // J-type, jal
            5'b00101: begin `CPU_ctrl_signals = {3'b000, 1'bx, 2'b11, 1'b1, 1'bx, 1'b0, 1'b0, 2'b00, 4'bxxxx}; end // U-type, auipc
            5'b01101: begin `CPU_ctrl_signals = {3'b000, 1'b0, 2'b11, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 4'b0010}; end // U-type, lui
            default: begin  `CPU_ctrl_signals = {3'bxxx, 1'bx, 2'bxx, 1'bx, 1'bx, 1'bx, 1'bx, 2'bxx, 4'bxxxx}; end 
        endcase
    end

    assign CPU_MIO = MIO_ready;

endmodule