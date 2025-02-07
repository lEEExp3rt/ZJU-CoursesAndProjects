`timescale 1ns / 1ps

module div32_tb();
      reg clk;
      reg rst;
      reg [31:0] dividend;
      reg [31:0] divisor;
      reg start;
      
      wire [31:0] quotient;
      wire [31:0] remainder;
      wire finish;
      div32   u_div(
         .clk(clk),
         .rst(rst),
         .dividend(dividend),
         .divisor(divisor),
         .start(start),
         .quotient(quotient),
         .remainder(remainder),
         .finish(finish)
      );
      always #5 clk = ~clk;
      
      initial begin
       clk =0;
       rst = 1;
       start = 0;
       dividend = 32'd0;
       divisor  = 32'd0;
       #10
       rst = 0;
       start = 1;
       dividend = 32'd8;
       divisor  = 32'd4;
       #335
       start = 0;

       #335
       start = 1;
       dividend = 32'd100;  
       divisor  = 32'd10;   
       #335
       start = 0;

       #335     
       start = 1;
       dividend = 32'd9;
       divisor  = 32'd4; 
       #335
       start = 0;

       #340   
       start = 1;         
       dividend = 32'd100; 
       divisor  = 32'd99;  
       #350
       start = 0;

       #340
       start = 1;
       dividend = 32'd20240321;
       divisor = 32'd1931;
       #335
       start = 0;

       #350 $stop();   
      
      end

endmodule