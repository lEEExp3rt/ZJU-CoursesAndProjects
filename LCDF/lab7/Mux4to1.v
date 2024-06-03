/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : Mux4to1                                                      **
 **                                                                          **
 *****************************************************************************/

module Mux4to1( D0,
                D1,
                D2,
                D3,
                S,
                Y );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       D0;
   input       D1;
   input       D2;
   input       D3;
   input [1:0] S;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output Y;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [1:0] s_logisimBus17;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
   wire       s_logisimNet2;
   wire       s_logisimNet3;
   wire       s_logisimNet4;
   wire       s_logisimNet5;
   wire       s_logisimNet6;
   wire       s_logisimNet7;
   wire       s_logisimNet8;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus17[1:0] = S;
   assign s_logisimNet0       = D2;
   assign s_logisimNet1       = D3;
   assign s_logisimNet14      = D0;
   assign s_logisimNet6       = D1;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign Y = s_logisimNet15;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet12 = ~s_logisimBus17[0];

   // NOT Gate
   assign s_logisimNet5 = ~s_logisimBus17[1];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   AND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimBus17[0]),
               .input2(s_logisimNet5),
               .result(s_logisimNet7));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet12),
               .input2(s_logisimBus17[1]),
               .result(s_logisimNet8));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimBus17[0]),
               .input2(s_logisimBus17[1]),
               .result(s_logisimNet9));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimNet12),
               .input2(s_logisimNet5),
               .result(s_logisimNet10));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet7),
               .input2(s_logisimNet6),
               .result(s_logisimNet11));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimNet8),
               .input2(s_logisimNet0),
               .result(s_logisimNet16));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_logisimNet9),
               .input2(s_logisimNet1),
               .result(s_logisimNet3));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimNet10),
               .input2(s_logisimNet14),
               .result(s_logisimNet2));

   OR_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_9 (.input1(s_logisimNet2),
               .input2(s_logisimNet11),
               .input3(s_logisimNet16),
               .input4(s_logisimNet3),
               .result(s_logisimNet15));


endmodule
