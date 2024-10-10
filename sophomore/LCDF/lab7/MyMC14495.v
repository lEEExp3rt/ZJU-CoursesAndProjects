/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : MyMC14495                                                    **
 **                                                                          **
 *****************************************************************************/

module MyMC14495( D0,
                  D1,
                  D2,
                  D3,
                  LE,
                  a,
                  b,
                  c,
                  d,
                  e,
                  f,
                  g,
                  p,
                  point );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input D0;
   input D1;
   input D2;
   input D3;
   input LE;
   input point;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output a;
   output b;
   output c;
   output d;
   output e;
   output f;
   output g;
   output p;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_logisimNet0;
   wire s_logisimNet1;
   wire s_logisimNet10;
   wire s_logisimNet11;
   wire s_logisimNet12;
   wire s_logisimNet13;
   wire s_logisimNet14;
   wire s_logisimNet15;
   wire s_logisimNet16;
   wire s_logisimNet17;
   wire s_logisimNet18;
   wire s_logisimNet19;
   wire s_logisimNet2;
   wire s_logisimNet20;
   wire s_logisimNet21;
   wire s_logisimNet22;
   wire s_logisimNet23;
   wire s_logisimNet24;
   wire s_logisimNet25;
   wire s_logisimNet26;
   wire s_logisimNet27;
   wire s_logisimNet28;
   wire s_logisimNet29;
   wire s_logisimNet3;
   wire s_logisimNet30;
   wire s_logisimNet31;
   wire s_logisimNet32;
   wire s_logisimNet33;
   wire s_logisimNet34;
   wire s_logisimNet35;
   wire s_logisimNet36;
   wire s_logisimNet37;
   wire s_logisimNet38;
   wire s_logisimNet39;
   wire s_logisimNet4;
   wire s_logisimNet40;
   wire s_logisimNet41;
   wire s_logisimNet42;
   wire s_logisimNet43;
   wire s_logisimNet44;
   wire s_logisimNet45;
   wire s_logisimNet5;
   wire s_logisimNet6;
   wire s_logisimNet7;
   wire s_logisimNet8;
   wire s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet0  = LE;
   assign s_logisimNet11 = D1;
   assign s_logisimNet2  = D3;
   assign s_logisimNet3  = D2;
   assign s_logisimNet40 = point;
   assign s_logisimNet5  = D0;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign a = s_logisimNet33;
   assign b = s_logisimNet4;
   assign c = s_logisimNet44;
   assign d = s_logisimNet35;
   assign e = s_logisimNet41;
   assign f = s_logisimNet20;
   assign g = s_logisimNet31;
   assign p = s_logisimNet17;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet17 = ~s_logisimNet40;

   // NOT Gate
   assign s_logisimNet12 = ~s_logisimNet5;

   // NOT Gate
   assign s_logisimNet13 = ~s_logisimNet11;

   // NOT Gate
   assign s_logisimNet8 = ~s_logisimNet3;

   // NOT Gate
   assign s_logisimNet1 = ~s_logisimNet2;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      AD12 (.input1(s_logisimNet12),
            .input2(s_logisimNet11),
            .input3(s_logisimNet8),
            .input4(s_logisimNet1),
            .result(s_logisimNet26));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet0),
               .input2(s_logisimNet34),
               .result(s_logisimNet44));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_3 (.input1(s_logisimNet42),
               .input2(s_logisimNet26),
               .input3(s_logisimNet23),
               .result(s_logisimNet34));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      AD13 (.input1(s_logisimNet5),
            .input2(s_logisimNet11),
            .input3(s_logisimNet2),
            .result(s_logisimNet21));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      AD14 (.input1(s_logisimNet12),
            .input2(s_logisimNet3),
            .input3(s_logisimNet2),
            .result(s_logisimNet23));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      AD15 (.input1(s_logisimNet12),
            .input2(s_logisimNet11),
            .input3(s_logisimNet3),
            .result(s_logisimNet15));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      AD16 (.input1(s_logisimNet5),
            .input2(s_logisimNet13),
            .input3(s_logisimNet3),
            .input4(s_logisimNet1),
            .result(s_logisimNet19));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimNet0),
               .input2(s_logisimNet38),
               .result(s_logisimNet4));

   OR_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_9 (.input1(s_logisimNet21),
               .input2(s_logisimNet23),
               .input3(s_logisimNet15),
               .input4(s_logisimNet19),
               .result(s_logisimNet38));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      AD17 (.input1(s_logisimNet5),
            .input2(s_logisimNet11),
            .input3(s_logisimNet8),
            .input4(s_logisimNet2),
            .result(s_logisimNet6));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      AD18 (.input1(s_logisimNet5),
            .input2(s_logisimNet13),
            .input3(s_logisimNet3),
            .input4(s_logisimNet2),
            .result(s_logisimNet14));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      AD19 (.input1(s_logisimNet12),
            .input2(s_logisimNet13),
            .input3(s_logisimNet3),
            .input4(s_logisimNet1),
            .result(s_logisimNet30));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      AD20 (.input1(s_logisimNet5),
            .input2(s_logisimNet8),
            .input3(s_logisimNet13),
            .input4(s_logisimNet1),
            .result(s_logisimNet7));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_14 (.input1(s_logisimNet0),
                .input2(s_logisimNet45),
                .result(s_logisimNet33));

   OR_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_15 (.input1(s_logisimNet6),
                .input2(s_logisimNet14),
                .input3(s_logisimNet30),
                .input4(s_logisimNet7),
                .result(s_logisimNet45));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      AD0 (.input1(s_logisimNet12),
           .input2(s_logisimNet13),
           .input3(s_logisimNet3),
           .input4(s_logisimNet2),
           .result(s_logisimNet22));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_17 (.input1(s_logisimNet0),
                .input2(s_logisimNet37),
                .result(s_logisimNet31));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      AD1 (.input1(s_logisimNet5),
           .input2(s_logisimNet11),
           .input3(s_logisimNet3),
           .input4(s_logisimNet1),
           .result(s_logisimNet18));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_19 (.input1(s_logisimNet22),
                .input2(s_logisimNet18),
                .input3(s_logisimNet39),
                .result(s_logisimNet37));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      AD2 (.input1(s_logisimNet13),
           .input2(s_logisimNet8),
           .input3(s_logisimNet1),
           .result(s_logisimNet39));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      AD3 (.input1(s_logisimNet5),
           .input2(s_logisimNet11),
           .input3(s_logisimNet1),
           .result(s_logisimNet32));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_22 (.input1(s_logisimNet0),
                .input2(s_logisimNet24),
                .result(s_logisimNet20));

   OR_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_23 (.input1(s_logisimNet32),
                .input2(s_logisimNet27),
                .input3(s_logisimNet9),
                .input4(s_logisimNet14),
                .result(s_logisimNet24));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      AD4 (.input1(s_logisimNet11),
           .input2(s_logisimNet8),
           .input3(s_logisimNet1),
           .result(s_logisimNet27));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      AD5 (.input1(s_logisimNet5),
           .input2(s_logisimNet8),
           .input3(s_logisimNet1),
           .result(s_logisimNet9));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      AD6 (.input1(s_logisimNet5),
           .input2(s_logisimNet13),
           .input3(s_logisimNet8),
           .result(s_logisimNet10));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_27 (.input1(s_logisimNet0),
                .input2(s_logisimNet25),
                .result(s_logisimNet41));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_28 (.input1(s_logisimNet10),
                .input2(s_logisimNet16),
                .input3(s_logisimNet43),
                .result(s_logisimNet25));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      AD7 (.input1(s_logisimNet13),
           .input2(s_logisimNet3),
           .input3(s_logisimNet1),
           .result(s_logisimNet16));

   AND_GATE #(.BubblesMask(2'b00))
      AD8 (.input1(s_logisimNet5),
           .input2(s_logisimNet1),
           .result(s_logisimNet43));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      AD9 (.input1(s_logisimNet12),
           .input2(s_logisimNet11),
           .input3(s_logisimNet8),
           .input4(s_logisimNet2),
           .result(s_logisimNet28));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_32 (.input1(s_logisimNet0),
                .input2(s_logisimNet36),
                .result(s_logisimNet35));

   OR_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_33 (.input1(s_logisimNet28),
                .input2(s_logisimNet29),
                .input3(s_logisimNet30),
                .input4(s_logisimNet7),
                .result(s_logisimNet36));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      AD10 (.input1(s_logisimNet5),
            .input2(s_logisimNet11),
            .input3(s_logisimNet3),
            .result(s_logisimNet29));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      AD11 (.input1(s_logisimNet11),
            .input2(s_logisimNet3),
            .input3(s_logisimNet2),
            .result(s_logisimNet42));


endmodule
