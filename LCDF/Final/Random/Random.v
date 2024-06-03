/*
 * Module: Random
 * This module is used to generate a series of random data
 * The random data consists of only 0 and 1.
 */
module Random(
    input clk,
    input rst,
    output reg rand
    );
always@(posedge clk)begin
    if (rst == 1'b1) begin
        rand <= {$random} % 2;
    end else begin
        rand <= rand;
    end
//    rand <= {$random(rst)} % 2;
end
endmodule
