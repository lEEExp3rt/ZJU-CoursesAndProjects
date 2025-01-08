`timescale 1ns / 1ps

module IF_reg_ID(
    input clk_IFID,
    input rst_IFID,
    input en_IFID,
    input [31:0] PC_in_IFID,
    input [31:0] inst_in_IFID,
    output [31:0] PC_out_IFID,
    output [31:0] inst_out_IFID
    );

    reg [31:0] PC;
    reg [31:0] inst;

    always @(posedge clk_IFID or posedge rst_IFID) begin
        if (rst_IFID) begin
            PC <= 32'b0;
            inst <= 32'b0;
        end else if (en_IFID) begin
            PC <= PC_in_IFID;
            inst <= inst_in_IFID;
        end
    end

    assign PC_out_IFID = PC;
    assign inst_out_IFID = inst;

endmodule