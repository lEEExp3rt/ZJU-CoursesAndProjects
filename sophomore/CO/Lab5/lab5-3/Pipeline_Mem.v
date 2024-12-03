`timescale 1ns / 1ps

module Pipeline_Mem(
    input Branch_in_Mem,
    input zero_in_Mem,
    input BranchN_in_Mem,
    input Jump_in_Mem,
    output PCSrc
    );

    assign PCSrc = (Branch_in_Mem & zero_in_Mem) | (BranchN_in_Mem & ~zero_in_Mem) | Jump_in_Mem;

endmodule