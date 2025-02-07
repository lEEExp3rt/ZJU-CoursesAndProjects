/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : Mux4to1b4                                                    **
 **                                                                          **
 *****************************************************************************/

module Mux4to1b4( D0,
                  D1,
                  D2,
                  D3,
                  S,
                  Y );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [3:0] D0;
   input [3:0] D1;
   input [3:0] D2;
   input [3:0] D3;
   input [1:0] S;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [3:0] Y;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [3:0] s_logisimBus19;
   wire [1:0] s_logisimBus34;
   wire [3:0] s_logisimBus40;
   wire [3:0] s_logisimBus47;
   wire [3:0] s_logisimBus48;
   wire [3:0] s_logisimBus49;
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
   wire       s_logisimNet24;
   wire       s_logisimNet25;
   wire       s_logisimNet26;
   wire       s_logisimNet27;
   wire       s_logisimNet28;
   wire       s_logisimNet29;
   wire       s_logisimNet3;
   wire       s_logisimNet30;
   wire       s_logisimNet31;
   wire       s_logisimNet32;
   wire       s_logisimNet33;
   wire       s_logisimNet35;
   wire       s_logisimNet36;
   wire       s_logisimNet37;
   wire       s_logisimNet38;
   wire       s_logisimNet39;
   wire       s_logisimNet4;
   wire       s_logisimNet41;
   wire       s_logisimNet42;
   wire       s_logisimNet43;
   wire       s_logisimNet44;
   wire       s_logisimNet45;
   wire       s_logisimNet46;
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
   assign s_logisimBus19[3:0] = D3;
   assign s_logisimBus34[1:0] = S;
   assign s_logisimBus40[3:0] = D2;
   assign s_logisimBus47[3:0] = D1;
   assign s_logisimBus49[3:0] = D0;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign Y = s_logisimBus48[3:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet39 = ~s_logisimBus34[0];

   // NOT Gate
   assign s_logisimNet22 = ~s_logisimBus34[1];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   AND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimBus34[0]),
               .input2(s_logisimNet22),
               .result(s_logisimNet4));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet39),
               .input2(s_logisimBus34[1]),
               .result(s_logisimNet17));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimBus34[0]),
               .input2(s_logisimBus34[1]),
               .result(s_logisimNet24));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimNet39),
               .input2(s_logisimNet22),
               .result(s_logisimNet6));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet4),
               .input2(s_logisimBus47[3]),
               .result(s_logisimNet12));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimNet17),
               .input2(s_logisimBus40[3]),
               .result(s_logisimNet7));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_logisimNet24),
               .input2(s_logisimBus19[3]),
               .result(s_logisimNet10));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimNet4),
               .input2(s_logisimBus47[0]),
               .result(s_logisimNet44));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_9 (.input1(s_logisimNet17),
               .input2(s_logisimBus40[0]),
               .result(s_logisimNet26));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_10 (.input1(s_logisimNet24),
                .input2(s_logisimBus19[0]),
                .result(s_logisimNet42));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_11 (.input1(s_logisimNet6),
                .input2(s_logisimBus49[1]),
                .result(s_logisimNet14));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_12 (.input1(s_logisimNet4),
                .input2(s_logisimBus47[1]),
                .result(s_logisimNet13));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_13 (.input1(s_logisimNet17),
                .input2(s_logisimBus40[1]),
                .result(s_logisimNet8));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_14 (.input1(s_logisimNet24),
                .input2(s_logisimBus19[1]),
                .result(s_logisimNet11));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_15 (.input1(s_logisimNet6),
                .input2(s_logisimBus49[0]),
                .result(s_logisimNet36));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_16 (.input1(s_logisimNet6),
                .input2(s_logisimBus49[2]),
                .result(s_logisimNet37));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_17 (.input1(s_logisimNet4),
                .input2(s_logisimBus47[2]),
                .result(s_logisimNet45));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_18 (.input1(s_logisimNet17),
                .input2(s_logisimBus40[2]),
                .result(s_logisimNet27));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_19 (.input1(s_logisimNet24),
                .input2(s_logisimBus19[2]),
                .result(s_logisimNet43));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_20 (.input1(s_logisimNet6),
                .input2(s_logisimBus49[3]),
                .result(s_logisimNet15));

   OR_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_21 (.input1(s_logisimNet15),
                .input2(s_logisimNet12),
                .input3(s_logisimNet7),
                .input4(s_logisimNet10),
                .result(s_logisimBus48[3]));

   OR_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_22 (.input1(s_logisimNet36),
                .input2(s_logisimNet44),
                .input3(s_logisimNet26),
                .input4(s_logisimNet42),
                .result(s_logisimBus48[0]));

   OR_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_23 (.input1(s_logisimNet14),
                .input2(s_logisimNet13),
                .input3(s_logisimNet8),
                .input4(s_logisimNet11),
                .result(s_logisimBus48[1]));

   OR_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_24 (.input1(s_logisimNet37),
                .input2(s_logisimNet45),
                .input3(s_logisimNet27),
                .input4(s_logisimNet43),
                .result(s_logisimBus48[2]));


endmodule
