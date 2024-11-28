`timescale 1ns / 1ps

module BranchTargetBuffer(
    input clk, rst,
    input [31:0] PC_IF,
    input [31:0] PC_ID,
    input [31:0] jump_PC_ID,
    input Branch_ID, // If branch is actually taken.
    input B_valid, // If this branch is a branch instruction.
    input stall, // If stall is asserted, do not update BTB.

    output [31:0] predictedPC, // Predicted PC.
    output predict, // Predicted branch taken or not, if taken, predictedPC will be next PC.
    output flush
);

    // Branch Prediction Table, BHT + BTB.
    //    10    9         8   7                        0 
    //  ┌─────┬─────────────┬────────────────────────────┐
    //  │Valid│    State    │        Target Index        │
    //  └─────┴─────────────┴────────────────────────────┘
    parameter BTB_SIZE = 256;
    parameter ENTRY_SIZE = 11;
    reg [ENTRY_SIZE-1:0] btb [0:BTB_SIZE-1];
    integer i; // Initializer index.

    wire [7:0] IF_index, ID_index; // Index of PC in BTB.
    assign IF_index = PC_IF[9:2];
    assign ID_index = PC_ID[9:2];

    // Update BTB.
    always @ (posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < BTB_SIZE; i = i + 1) begin
                btb[i] <= 11'b0;
            end
        end else if (!stall) begin
            // Update states.
            if (B_valid) begin
                btb[ID_index][10] = 1'b1; // Set valid bit.
                if (btb[ID_index][9] == btb[ID_index][8]) begin btb[ID_index][8] = Branch_ID; end // 11 && 00.
                else begin btb[ID_index][9:8] = {2{Branch_ID}}; end // 01 && 10.
            end

            // Update branch target.
            if (Branch_ID) begin 
                btb[ID_index][7:0] = jump_PC_ID[9:2];
            end
        end
    end

    // Make prediction based on BTB.
    assign predictedPC = btb[IF_index][7:0] << 2 | 32'h00000000; // Extend pc index to pc.
    assign predict = btb[IF_index][10] & btb[IF_index][9]; // To take prediction or not.
    assign flush = (!stall) && B_valid && ((btb[ID_index][9] != Branch_ID) || (Branch_ID && (btb[ID_index][7:0] != jump_PC_ID[9:2]))); // Flush.

endmodule