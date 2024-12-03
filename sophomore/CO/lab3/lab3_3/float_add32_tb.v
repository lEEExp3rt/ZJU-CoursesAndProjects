`timescale 1ns / 1ps

module float_add32_tb();
	// Inputs
	reg clk;
	reg rst;
	reg [31:0] A;
	reg [31:0] B;
	reg en;

	// Outputs
	wire [31:0] result;
	wire finish;

	// Instantiate the Unit Under Test (UUT)
	float_add32 addf (
		.clk(clk), 
		.rst(rst), 
		.A(A), 
		.B(B), 
		.en(en), 
		.result(result), 
		.finish(finish)
	);
	
	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		A = 32'hc0000000; 
        B = 32'hc0000000; 
        en = 0;

		#10;
		rst = 0; 
		A = 32'hc0a00000; //-5.0
		B = 32'hc0900000; //-4.5
		en = 1;           // c1180000 (-9.5)
		#20;
		en = 0;
		
		#80;		
		A = 32'h40a00000; //+5.0
		B = 32'h40900000; //+4.5
		en = 1;           //41180000 (+9.5)
		#20;
		en = 0;

		#80;		
		A = 32'hC13F0000; //-11.9375
		B = 32'h42B14000; //+88.625
		en = 1;           //42996000 (+76.6875)
		#20;
		en = 0;

		#100;		
		A = 32'hC4FD1200; //-2024.5625
		B = 32'h42DE6000; //+111.1875
		en = 1;           //C4EF2C00 (-1913.375)
		#20;
		en = 0;
		
		#180;           
		$stop();
	end
endmodule