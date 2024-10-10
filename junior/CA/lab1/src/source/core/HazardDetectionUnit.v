`timescale 1ps/1ps

module HazardDetectionUnit(
    input clk,
    input Branch_ID, rs1use_ID, rs2use_ID,
    input[1:0] hazard_optype_ID,
    input[4:0] rd_EXE, rd_MEM, rs1_ID, rs2_ID, rs2_EXE,

    output PC_EN_IF, reg_FD_EN, reg_FD_stall, reg_FD_flush,
        reg_DE_EN, reg_DE_flush, reg_EM_EN, reg_EM_flush, reg_MW_EN,
    output forward_ctrl_ls,
    output[1:0] forward_ctrl_A, forward_ctrl_B
    );

    // According to the diagram, design the Hazard Detection Unit
    reg [1:0] hazard_optype_EXE, hazard_optype_MEM;
    always @ (posedge clk) begin
        hazard_optype_MEM <= hazard_optype_EXE;
        hazard_optype_EXE <= hazard_optype_ID & {2{~reg_DE_flush}};
    end

    parameter hazard_optype_ALU = 2'b01;
    parameter hazard_optype_LOAD = 2'b10;
    parameter hazard_optype_STORE = 2'b11;

    wire rs1_forward_1     = rs1use_ID & rs1_ID == rd_EXE & rd_EXE != 5'd0 & hazard_optype_EXE == hazard_optype_ALU; // Next rs1 is the same as the current rd in EXE stage.
    wire rs1_forward_2     = rs1use_ID & rs1_ID == rd_MEM & rd_MEM != 5'd0 & hazard_optype_MEM == hazard_optype_ALU; // Next rs1 is the same as the current rd in MEM stage.
    wire rs1_forward_3     = rs1use_ID & rs1_ID == rd_MEM & rd_MEM != 5'd0 & hazard_optype_MEM == hazard_optype_LOAD; // Next rs1 is loaded this MEM stage.
    wire rs1_forward_stall = rs1use_ID & rs1_ID == rd_EXE & rd_EXE != 5'd0 & hazard_optype_EXE == hazard_optype_LOAD & hazard_optype_ID != hazard_optype_STORE; // Next rs1 is not loaded until a stall.

    wire rs2_forward_1     = rs2use_ID & rs2_ID == rd_EXE & rd_EXE != 5'd0 & hazard_optype_EXE == hazard_optype_ALU; // Next rs2 is the same as the current rd in EXE stage.
    wire rs2_forward_2     = rs2use_ID & rs2_ID == rd_MEM & rd_MEM != 5'd0 & hazard_optype_MEM == hazard_optype_ALU; // Next rs2 is the same as the current rd in MEM stage.
    wire rs2_forward_3     = rs2use_ID & rs2_ID == rd_MEM & rd_MEM != 5'd0 & hazard_optype_MEM == hazard_optype_LOAD; // Next rs2 is loaded this MEM stage.
    wire rs2_forward_stall = rs2use_ID & rs2_ID == rd_EXE & rd_EXE != 5'd0 & hazard_optype_EXE == hazard_optype_LOAD & hazard_optype_ID != hazard_optype_STORE; // Next rs2 is not loaded until a stall.

    wire load_stall = rs1_forward_stall | rs2_forward_stall; // A load instruction is stalled if either rs1 or rs2 is loaded.

    assign PC_EN_IF = ~load_stall; // Enable PC_EN_IF if there is no load stall.

    assign reg_FD_EN = 1'b1;
    assign reg_FD_stall = load_stall;
    assign reg_FD_flush = Branch_ID; // Flush the register file if a branch is taken.

    assign reg_DE_EN = 1'b1;
    assign reg_DE_flush = load_stall;

    assign reg_EM_EN = 1'b1;
    assign reg_EM_flush = 1'b0; 

    assign reg_MW_EN = 1'b1;

    assign forward_ctrl_A = {2{rs1_forward_1}} & 2'b01 |
                            {2{rs1_forward_2}} & 2'b10 |
                            {2{rs1_forward_3}} & 2'b11;

    assign forward_ctrl_B = {2{rs2_forward_1}} & 2'b01 |
                            {2{rs2_forward_2}} & 2'b10 |
                            {2{rs2_forward_3}} & 2'b11;

    assign forward_ctrl_ls = rs2_EXE == rd_MEM & hazard_optype_MEM == hazard_optype_LOAD & hazard_optype_EXE == hazard_optype_STORE; // Next rs2 will be loaded and stored in the next cycle.

endmodule