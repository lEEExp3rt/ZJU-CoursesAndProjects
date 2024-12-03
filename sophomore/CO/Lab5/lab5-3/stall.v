`timescale 1ns / 1ps

module stall(
    input rst_stall, // 复位
    input RegWrite_out_IDEX, // 执行阶段寄存器写控制
    input [4:0] Rd_addr_out_IDEX, // 执行阶段寄存器写地址
    input RegWrite_out_EXMem, // 访存阶段寄存器写控制
    input [4:0] Rd_addr_out_EXMem, // 访存阶段寄存器写地址
    input RegWrite_out_MemWB, // 写回阶段寄存器写控制
    input [4:0] Rd_addr_out_MemWB, // 写回阶段寄存器写地址
    input [4:0] Rs1_addr_ID, // 译码阶段寄存器读地址1
    input [4:0] Rs2_addr_ID, // 译码阶段寄存器读地址2
    input Rs1_used, // Rs1被使用
    input Rs2_used, // Rs2被使用
    input Branch_ID, // 译码阶段beq
    input BranchN_ID, // 译码阶段bne
    input Jump_ID, // 译码阶段jal
    input Branch_out_IDEX, // 执行阶段beq
    input BranchN_out_IDEX, // 执行阶段bne
    input Jump_out_IDEX, // 执行阶段jal
    input Branch_out_EXMem, // 访存阶段beq
    input BranchN_out_EXMem, // 访存阶段bne
    input Jump_out_EXMem, // 访存阶段jal
    input PCSrc, // PC选择
    output en_IF, // 流水线寄存器的使能及NOP信号
    output en_IFID,
    output NOP_IFID,
    output NOP_IDEX
    );

    reg data_stall;
    reg control_stall;
    reg isNOPIFID;

    // Data hazards.
    always @ (*) begin
        /*
        // WB hazard.
        if (RegWrite_out_MemWB && Rs1_used && Rs1_addr_ID && (Rd_addr_out_MemWB == Rs1_addr_ID)) begin
            data_stall = 1;
        end else if (RegWrite_out_MemWB && Rs2_used && Rs2_addr_ID && (Rd_addr_out_MemWB == Rs2_addr_ID)) begin
            data_stall = 1;
        end
        */
        // MEM hazard.
        if (RegWrite_out_EXMem && Rs1_used && Rs1_addr_ID && (Rd_addr_out_EXMem == Rs1_addr_ID)) begin
            data_stall = 1;
        end else if (RegWrite_out_EXMem && Rs2_used && Rs2_addr_ID && (Rd_addr_out_EXMem == Rs2_addr_ID)) begin
            data_stall = 1;
        end
        // EX hazard.
        else if (RegWrite_out_IDEX && Rs1_used && Rs1_addr_ID && (Rd_addr_out_IDEX == Rs1_addr_ID)) begin
            data_stall = 1;
        end else if (RegWrite_out_IDEX && Rs2_used && Rs2_addr_ID && (Rd_addr_out_IDEX == Rs2_addr_ID)) begin
            data_stall = 1;
        end
        // Otherwise.
        else begin data_stall = 0; end
    end

    // Control hazards.
    always @ (*) begin
        // ID.
        if (Branch_ID || BranchN_ID || Jump_ID) begin
            control_stall = 1;
            isNOPIFID = 1;
        end 
        // Ex.
        else if (Branch_out_IDEX || BranchN_out_IDEX || Jump_out_IDEX) begin
            control_stall = 1;
            isNOPIFID = 1;
        end
        // Mem.
        else if (Branch_out_EXMem || BranchN_out_EXMem || Jump_out_EXMem) begin
            control_stall = 1;
            isNOPIFID = 0;
        end
        // Otherwise.
        else begin
            control_stall = 0;
            isNOPIFID = 0;
        end
    end

    // Reset.
    always @ (*) begin
        if (rst_stall) begin
            data_stall <= 0;
            control_stall <= 0;
            isNOPIFID <= 0;
        end
    end

    assign NOP_IDEX = data_stall;
    assign NOP_IFID = data_stall? 0: (isNOPIFID? 1: (control_stall & PCSrc)); //control_stall & PCSrc;
    assign en_IF = data_stall? 0: (control_stall & (~Branch_out_EXMem | ~BranchN_out_EXMem | ~Jump_out_EXMem)? 0: 1); //(~data_stall | ~control_stall);
    assign en_IFID = ~data_stall;

endmodule