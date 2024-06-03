`timescale 1ns / 1ps

module Random_tb();
    reg clk;
    reg rst;
    wire rand;
    Random UUT(
        .clk(clk),
        .rst(rst),
        .rand(rand)
    );

    initial begin
        clk <= 1'b0;
        rst <= 1'b1;
        repeat(20) begin
            #10;
            clk = ~clk;
        end
        #10 $finish;
    end

endmodule
