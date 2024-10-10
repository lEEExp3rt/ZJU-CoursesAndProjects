/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : DisplayNumber                                                **
 **                                                                          **
 *****************************************************************************/

module DisplayNumber( AN,
                      LEs,
                      SEGMENT,
                      clk,
                      hexs,
                      points,
                      rst );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [3:0]  LEs;
   input        clk;
   input [15:0] hexs;
   input [3:0]  points;
   input        rst;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [3:0] AN;
   output [7:0] SEGMENT;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [3:0]  s_logisimBus0;
   wire [3:0]  s_logisimBus1;
   wire [3:0]  s_logisimBus10;
   wire [3:0]  s_logisimBus18;
   wire [15:0] s_logisimBus21;
   wire [7:0]  s_logisimBus22;
   wire [31:0] s_logisimBus23;
   wire        s_logisimNet11;
   wire        s_logisimNet12;
   wire        s_logisimNet13;
   wire        s_logisimNet14;
   wire        s_logisimNet15;
   wire        s_logisimNet16;
   wire        s_logisimNet17;
   wire        s_logisimNet19;
   wire        s_logisimNet20;
   wire        s_logisimNet3;
   wire        s_logisimNet4;
   wire        s_logisimNet5;
   wire        s_logisimNet6;
   wire        s_logisimNet7;
   wire        s_logisimNet8;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus0[3:0]   = points;
   assign s_logisimBus1[3:0]   = LEs;
   assign s_logisimBus21[15:0] = hexs;
   assign s_logisimNet19       = clk;
   assign s_logisimNet20       = rst;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign AN      = s_logisimBus10[3:0];
   assign SEGMENT = s_logisimBus22[7:0];

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   clkdiv   m0 (.clk(s_logisimNet19),
                .div_res(s_logisimBus23[31:0]),
                .rst(s_logisimNet20));

   DisplaySync   m1 (.AN(s_logisimBus10[3:0]),
                     .HEX(s_logisimBus18[3:0]),
                     .LE(s_logisimNet8),
                     .LEs(s_logisimBus1[3:0]),
                     .hexs(s_logisimBus21[15:0]),
                     .point(s_logisimNet3),
                     .points(s_logisimBus0[3:0]),
                     .scan(s_logisimBus23[18:17]));

   MyMC14495   m2 (.D0(s_logisimBus18[0]),
                   .D1(s_logisimBus18[1]),
                   .D2(s_logisimBus18[2]),
                   .D3(s_logisimBus18[3]),
                   .LE(s_logisimNet8),
                   .a(s_logisimBus22[0]),
                   .b(s_logisimBus22[1]),
                   .c(s_logisimBus22[2]),
                   .d(s_logisimBus22[3]),
                   .e(s_logisimBus22[4]),
                   .f(s_logisimBus22[5]),
                   .g(s_logisimBus22[6]),
                   .p(s_logisimBus22[7]),
                   .point(s_logisimNet3));

endmodule
