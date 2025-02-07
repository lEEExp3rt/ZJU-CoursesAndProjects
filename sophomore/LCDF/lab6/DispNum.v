/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : DispNum                                                      **
 **                                                                          **
 *****************************************************************************/

module DispNum( AN,
                BTN,
                BTN_X,
                SEGMENT,
                SW );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [1:0] BTN;
   input [7:0] SW;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [3:0] AN;
   output       BTN_X;
   output [7:0] SEGMENT;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [7:0] s_logisimBus19;
   wire [3:0] s_logisimBus24;
   wire [7:0] s_logisimBus25;
   wire [1:0] s_logisimBus6;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet2;
   wire       s_logisimNet20;
   wire       s_logisimNet21;
   wire       s_logisimNet22;
   wire       s_logisimNet23;
   wire       s_logisimNet26;
   wire       s_logisimNet3;
   wire       s_logisimNet4;
   wire       s_logisimNet5;
   wire       s_logisimNet7;
   wire       s_logisimNet8;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus25[7:0] = SW;
   assign s_logisimBus6[1:0]  = BTN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign AN      = s_logisimBus24[3:0];
   assign BTN_X   = s_logisimNet17;
   assign SEGMENT = s_logisimBus19[7:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Ground
   assign  s_logisimNet17  =  1'b0;


   // NOT Gate
   assign s_logisimBus24[0] = ~s_logisimBus25[4];

   // NOT Gate
   assign s_logisimBus24[1] = ~s_logisimBus25[5];

   // NOT Gate
   assign s_logisimBus24[2] = ~s_logisimBus25[6];

   // NOT Gate
   assign s_logisimBus24[3] = ~s_logisimBus25[7];

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   MyMC14495   m0 (.D0(s_logisimBus25[0]),
                   .D1(s_logisimBus25[1]),
                   .D2(s_logisimBus25[2]),
                   .D3(s_logisimBus25[3]),
                   .LE(s_logisimBus6[0]),
                   .a(s_logisimBus19[0]),
                   .b(s_logisimBus19[1]),
                   .c(s_logisimBus19[2]),
                   .d(s_logisimBus19[3]),
                   .e(s_logisimBus19[4]),
                   .f(s_logisimBus19[5]),
                   .g(s_logisimBus19[6]),
                   .p(s_logisimBus19[7]),
                   .point(s_logisimBus6[1]));

endmodule
