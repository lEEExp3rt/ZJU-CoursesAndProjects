# Lab0：VIVADO介绍 && 模块封装

[TOC]

---

## 任务一：VIVADO工具学习

利用VIVADO完成water_LED的全流程设计

### 创建工程

如下，选择对应参数的板子型号，并创建工程，名为**LAB0**

![创建工程](.\image-20240229192238985.png)

### 创建源文件

创建`Design Source`名为`Water_LED`，并输入如下代码：

```verilog
`timescale 1ns / 1ps

module Water_LED(
   input CLK_i,
   input RSTn_i,
   output reg [3:0]LED_o
    );
   reg [31:0]C0;
    
 always @(posedge CLK_i) 
    if(!RSTn_i) begin
      LED_o <= 4'b1;
      C0 <= 32'h0;
    end
    else begin
        if(C0 == 32'd100_000_000) begin
          C0 <= 32'h0;
          if(LED_o == 4'b1000)
              LED_o <= 4'b1;
          else LED_o <= LED_o << 1;
        end
        else  begin 
          C0 <= C0 + 1'b1; 
          LED_o <= LED_o; 
        end
     end

endmodule
```

![源代码](.\image-20240229192737540.png)

### 添加仿真文件

根据步骤添加仿真文件，添加以下仿真代码：

```verilog
`timescale 1ns / 1ps

module Water_LED_tb;
   reg CLK_i;
   reg RSTn_i;
   wire  [3:0]LED_o;
   
   Water_LED Water_LED_U(
             .CLK_i(CLK_i),
             .RSTn_i(RSTn_i),
             .LED_o(LED_o)
   );
   
   always #5 CLK_i = ~CLK_i;
   
   initial begin
       CLK_i = 0;
       RSTn_i = 0;
       #100 RSTn_i = 1;
       
   end
endmodule
```

### 仿真结果

进行仿真后得到如下结果：

![仿真结果](.\image-20240229193345018.png)

### RTL分析

点击`RTL Analysis`下的`Schematic`后得到如下结果：

![RTL分析](.\image-20240229193658281.png)

> :open_mouth:第一次发现VIVADO还能画出电路图

### 综合设计

根据相关步骤，进行综合设计

### 引脚约束

采用脚本约束法，根据以下<a id="constraint">管脚约束脚本</a>进行设置：

```verilog
set_property PACKAGE_PIN C12 [get_ports RSTn_i]
set_property IOSTANDARD LVCMOS33 [get_ports RSTn_i]
set_property PACKAGE_PIN H17 [get_ports {LED_o[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_o[0]}]
set_property PACKAGE_PIN K15 [get_ports {LED_o[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_o[1]}]
set_property PACKAGE_PIN J13 [get_ports {LED_o[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_o[2]}]
set_property PACKAGE_PIN N14 [get_ports {LED_o[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_o[3]}]
set_property PACKAGE_PIN E3 [get_ports CLK_i]
set_property IOSTANDARD LVCMOS33 [get_ports CLK_i]
```

### 生成比特流

引脚约束后重新声称比特流，结果如下：

![生成比特流](.\image-20240229194926061.png)

### 下板验证

连接设备后获得下板结果：

![下板验证](.\image-20240229195404541.png)

---

## 任务二：自定义模块化设计学习

利用VIVADO完成多路选择器**MUX2T1_5**的设计和封装

### 创建源文件

模块代码如下：

```verilog
module MUX2T1_5(input[4:0]I0,
				input[4:0]I1,
				input s,
				output[4:0]o
    );
    
   assign o = s ? I1 : I0;

endmodule
```

![模块代码](.\image-20240229202343742.png)

### 仿真文件与结果

仿真激励代码：

```verilog
module MUX2T1_5_tb();
     reg [4:0] I0;
	 reg [4:0] I1;
	 reg s;
	 
	 wire [4:0]o;
	 initial begin
	    s = 0;
	    I0 = 0;
	    I1 = 1;
	    #50;
	    s = 0;
	    #50;
	    s = 1;
	    #50;
	    I0 = 4'h5;
	    I1 = 4'hA;
	    #50;
	    s = 0;
	    #50;
	    s = 1;
	    #50;
	    s = 0;
	    #100 $stop;
	 end
	  MUX2T1_5 MUX(
	           .I0(I0),
	           .I1(I1),
	           .s(s),
	           .o(o)
	  );
endmodule
```

仿真结果：

![仿真结果](.\image-20240229202714420.png)

### 模块封装

根据一系列封装操作进行封装，结果如下：

![模块封装](.\image-20240229203408720.png)

就完成了**包含源文件**的模块封装

---

## 任务三：基本逻辑模块的原理学习、Xilinx IP 的生成

### 任务1：基本模块功能

#### MUX2T1_5

见[MUX2T1_5](#MUX2T1_5)

#### MUX2T1_8

```verilog
module MUX2T1_8(input[7:0]I0,
                input[7:0]I1,
                input s,
                output[7:0]o
    );
    assign o = s ? I1 : I0;
endmodule
```

#### MUX2T1_32

```verilog
module MUX2T1_32(input[31:0]I0,
                 input[31:0]I1,
                input s,
                 output[31:0]o
    );
    assign o = s ? I1 : I0;
endmodule
```

#### MUX4T1_5

见[MUX4T1_5](#MUX4T1_5)

#### MUX4T1_32

```verilog
module MUX4T1_32(        input [1:0]s,
                         input [31:0]I0,
                         input [31:0]I1,
                         input [31:0]I2,
                         input [31:0]I3,
                         output reg[31:0]o

    );
    always@*
                case(s)
                    2'b00: o = I0;
                    2'b01: o = I1;
                    2'b10: o = I2;
                    2'b11: o = I3;
                endcase
endmodule
```

#### MUX8T1_8

见[MUX8T1_8](#MUX8T1_8)

####  add_32

```verilog
module add_32(    input [31:0] a, 
				  input [31:0] b, 
				  output [31:0]c
    );
    assign c = a + b;
endmodule
```

#### addc_32

```verilog
module addc_32(  input [31:0] A, 
				 input [31:0] B, 
				 input C0,
				 output [32:0] S
    );
    wire B_Notation = C0 ^ 1'b0;	  
    assign S = {1'b0,A} + {B_Notation,B} + C0;
endmodule
```

#### and_32

```verilog
module and32(    input [31:0] A,
				 input [31:0] B,
				 output [31:0] res
    );
    assign res = A & B;
endmodule
```

#### Ext_imm16

```verilog
module Ext_imm16( input [15:0] imm_16,
				  output[31:0] Imm_32

    );
    assign Imm_32 = {{16{imm_16[15]}},imm_16[15:0]};
endmodule
```

#### nor_32

```verilog
module nor32(
    input [31:0] A;
    input [31:0] B;
    output [31:0] res
);
    assign res = ~(A | B);
endmodule
```

#### or_bit_32

```verilog
module or_bit_32(       input [31:0] A,
						output o
    );
    assign o = (A==0)? 1: 0;
endmodule
```

#### or_32

```verilog
module or_32(    input [31:0] A,
				input [31:0] B,
				output [31:0] res
    );
    assign res = A | B;
endmodule
```

#### SignalExt_32

```verilog
module SignalExt_32(      input S,
						  output [31:0]So
    );
    assign So = {32{S}};
endmodule
```

#### srl_32

```verilog
module srl_32(    input [31:0] A,
				 input [31:0] B,
				 output [31:0] res
    );
    assign res = A >> B[4:0];
endmodule
```

#### xor_32

```verilog
module xor_32(
    input [31:0] A;
    input [31:0] B;
    output [31:0] res
);
    assign res = A ^ B;
endmodule
```

### 任务2：存储器ROM、RAM的生成及初始化

#### ROM_D IP Core

根据相关步骤创建ROM的IP核

![ROM-IP](.\image-20240301111101915.png)

初始化的`ROM.coe`代码如下：

```verilog
memory_initialization_radix=16;
memory_initialization_vector=
00000000, 11111111, 22222222, 33333333, 44444444, 55555555, 66666666, 77777777, 88888888, 99999999, aaaaaaaa, bbbbbbbb, 
cccccccc, dddddddd, eeeeeeee, ffffffff, 557EF7E0, D7BDFBD9, D7DBFDB9, DFCFFCFB, DFCFBFFF, F7F3DFFF, FFFFDF3D, FFFF9DB9, FFFFBCFB, DFCFFCFB, DFCFBFFF, D7DB9FFF, D7DBFDB9, D7BDFBD9, FFFF07E0, 007E0FFF, 03bdf020, 03def820, 08002300;
```

####  RAM_B IP Core

根据相关步骤创建RAM的IP核，结果如下：

![RAM-IP](.\image-20240301125103563.png)

---

## 任务四：利用自定义模块构建实验平台

采用Verilog编码的设计方法，调用自定义模块，完成多选器控制LED的设计并利用*NEXYS_A7*实验板进行硬件验证

### 模块代码

![muxctrl](.\image-20240301142907214.png)

#### muxctrl

```verilog
module muxctrl(
    input  wire [4:0]I0,
    input  wire [4:0]I1,
    input  wire [1:0]s,
    input  wire s1,
    input  wire [2:0]s2,
    output wire [4:0]o_0
    );
    wire [4:0] MUX2T1_5_0_o;
    wire [4:0] MUX2T1_5_1_o;
    wire [7:0] MUX8T1_8_0_o;
    MUX2T1_5 MUX2T1_5_0
           (.I0(I0),
            .I1(I1),
            .o(MUX2T1_5_0_o),
            .s(s1));
    MUX2T1_5 MUX2T1_5_1
           (.I0(I0),
            .I1(I1),
            .o(MUX2T1_5_1_o),
            .s(1'b1));
    MUX4T1_5 MUX4T1_5_1
           (.I0(MUX8T1_8_0_o[3:0]),
            .I1({MUX2T1_5_1_o[0],MUX2T1_5_0_o[3:0]}),
            .I2(5'b1),
            .I3(5'b0),
            .o(o_0),
            .s(s));
     MUX8T1_8 MUX8T1_8_0
           (.I0({MUX2T1_5_0_o[3:0],MUX2T1_5_1_o[3:0]}),
            .I1({MUX2T1_5_1_o[3:0],MUX2T1_5_0_o[3:0]}),
            .I2(8'b1),
            .I3(8'b1),
            .I4(8'b1),
            .I5(8'b1),
            .I6(8'b1),
            .I7(8'b1),
            .o(MUX8T1_8_0_o),
            .s(s2));
endmodule
```

#### <a id="MUX2T1_5">MUX2T1_5</a>

```verilog
module MUX2T1_5(
    input[4:0]I0,
	input[4:0]I1,
	input s,
	output[4:0]o
    );
   assign o = s ? I1 : I0;
endmodule
```

#### <a id="MUX4T1_5">MUX4T1_5</a>

```verilog
module MUX4T1_5(
    input [1:0]s,
	input [4:0]I0,
	input [4:0]I1,
	input [4:0]I2,
	input [4:0]I3,						
	output reg[4:0]o
    );
    always@*
        case(s)
            2'b00: o = I0;
            2'b01: o = I1;
            2'b10: o = I2;
            2'b11: o = I3;
        endcase
endmodule
```

#### <a id="MUX8T1_8">MUX8T1_8</a>

```verilog
module MUX8T1_8(      
    input [2:0]s,
	input [7:0]I0,
    input [7:0]I1,
	input [7:0]I2,
	input [7:0]I3,
	input [7:0]I4,
	input [7:0]I5,
	input [7:0]I6,
	input [7:0]I7,					
	output reg[7:0]o
    );
    always@*
        case(s)
            3'b000: o = I0;
            3'b001: o = I1;
            3'b010: o = I2;
            3'b011: o = I3;
            3'b100: o = I4;
            3'b101: o = I5;
            3'b110: o = I6;
            3'b111: o = I7;
        endcase
endmodule
```

###  引脚约束

```verilog
#switch
set_property IOSTANDARD LVCMOS33 [get_ports {s[0]}]				
set_property PACKAGE_PIN J15    [get_ports {s[0]}]                 
set_property IOSTANDARD LVCMOS33 [get_ports {s[1]}]				
set_property PACKAGE_PIN L16    [get_ports {s[1]}]                 
set_property IOSTANDARD LVCMOS33 [get_ports  s1]				
set_property PACKAGE_PIN M13    [get_ports  s1]                 
set_property IOSTANDARD LVCMOS33 [get_ports {s2[0]}]				
set_property PACKAGE_PIN R15    [get_ports {s2[0]}]                 
set_property IOSTANDARD LVCMOS33 [get_ports {s2[1]}]				
set_property PACKAGE_PIN R17     [get_ports {s2[1]}]                 
set_property IOSTANDARD LVCMOS33 [get_ports {s2[2]}]				
set_property PACKAGE_PIN T18     [get_ports {s2[2]}]                 
set_property IOSTANDARD LVCMOS33 [get_ports {I0[0]}]				
set_property PACKAGE_PIN U18    [get_ports {I0[0]}]                 
set_property IOSTANDARD LVCMOS33 [get_ports {I0[1]}]				
set_property PACKAGE_PIN R13    [get_ports {I0[1]}]                 
set_property IOSTANDARD LVCMOS18 [get_ports {I0[2]}]				
set_property PACKAGE_PIN T8    [get_ports {I0[2]}]                  
set_property IOSTANDARD LVCMOS18 [get_ports {I0[3]}]				
set_property PACKAGE_PIN U8    [get_ports {I0[3]}]                 
set_property IOSTANDARD LVCMOS33 [get_ports {I0[4]}]			
set_property PACKAGE_PIN R16    [get_ports {I0[4]}]                 
set_property IOSTANDARD LVCMOS33 [get_ports {I1[0]}]			
set_property PACKAGE_PIN T13    [get_ports {I1[0]}]                 
set_property IOSTANDARD LVCMOS33 [get_ports {I1[1]}]			
set_property PACKAGE_PIN H6     [get_ports {I1[1]}]                 
set_property IOSTANDARD LVCMOS33 [get_ports {I1[2]}]			
set_property PACKAGE_PIN U12    [get_ports {I1[2]}]                 
set_property IOSTANDARD LVCMOS33 [get_ports {I1[3]}]			
set_property PACKAGE_PIN U11    [get_ports {I1[3]}]                 
set_property IOSTANDARD LVCMOS33 [get_ports {I1[4]}]			
set_property PACKAGE_PIN V10    [get_ports {I1[4]}]  

set_property IOSTANDARD LVCMOS33 [get_ports {o_0[0]}]
set_property PACKAGE_PIN H17     [get_ports {o_0[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_0[1]}]
set_property PACKAGE_PIN K15    [get_ports {o_0[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_0[2]}]
set_property PACKAGE_PIN J13     [get_ports {o_0[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_0[3]}]
set_property PACKAGE_PIN N14    [get_ports {o_0[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_0[4]}] 			
set_property PACKAGE_PIN R18     [get_ports {o_0[4]}]  
```

### 下板验证

生成比特流：

![生成比特流](.\image-20240301143910295.png)

下板结果：

![下板结果](.\image-20240301181701776.png)

---

## 思考题

### 一

> 说明约束文件代码中的参数的意义作用，说明ROM/RAM的参数意义和应用场景

* 约束文件

	以[管脚约束脚本](#constraint)为例：

	大体上代码分为两种：

	```verilog
	# 1
	set_property PACKAGE_PIN C12 [get_ports RSTn_i]
	set_property PACKAGE_PIN H17 [get_ports {LED_o[0]}]
	set_property PACKAGE_PIN K15 [get_ports {LED_o[1]}]
	set_property PACKAGE_PIN J13 [get_ports {LED_o[2]}]
	set_property PACKAGE_PIN N14 [get_ports {LED_o[3]}]
	set_property PACKAGE_PIN E3 [get_ports CLK_i]
	
	# 2
	set_property IOSTANDARD LVCMOS33 [get_ports RSTn_i]
	set_property IOSTANDARD LVCMOS33 [get_ports {LED_o[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LED_o[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LED_o[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LED_o[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports CLK_i]
	```

	第一部分规定了模块代码中的参数对应的使用引脚，如`RSTn_i`对应引脚`C12`，`LED_o[0]`对应引脚`H17`

	第二部分则是使用的引脚的电平标准为`LVCMOS33`

* ROM

	```verilog
	ROM_B your_instance_name (
	  .a(a), 		// input [9 : 0] a
	  .spo(spo) 	// output [31 : 0] spo
	);
	```

	`[9:0] a`表示存储容量为1024个单元，`[31:0] spo`代表每个存储单元的字长为32bit

	ROM通常用于存储固件、程序代码等其他通常不需要改变的数据

* RAM

	```verilog
	RAM U3 (
	  .clka(clk_m), 	  // input clka
	  .wea(data_ram_we),  // input [0 : 0] wea
	  .addra(ram_addr),      // input [9 : 0] addra
	  .dina(ram_data_in),   // input [31:0] dina
	  .douta(ram_data_out)// output [31:0] douta
	   );
	```

	`clka`代表输入时钟周期，`[9:0] addra`代表输入的位宽为32bit，`[31:0] dina`代表写入的存储单元地址，`[31:0] douta`代表读出的存储单元地址

### 二

> 总结一下自己数逻学习了什么内容，包括理论和实验部分

总体来说，数逻学习了数字逻辑电路的组成和设计

* 理论

	理论部分从最开始的布尔代数开始，到逻辑门，简单的逻辑运算，之后是组合逻辑电路的实现，然后是时序逻辑电路的实现，后续还学了状态模型、电路设计，以及最后部分的寄存器等的实现，总体来说是基本的计算机组成的底层理论原理

* 实验

	实验部分从最开始的电路的基础知识到后面使用Verilog参与对逻辑门、选择器、寄存器、计数器等的实现，以及最后的大程，学会使用Verilog编写相关的电路代码，学会使用VIVADO工具，学会电路分析与设计

### 三

> 查查资料，随便讨论讨论自己对于硬件发展前沿的理解

查阅相关资料后了解到，下一步硬件发展将可能是革命性的，由于经过几代发展的计算机硬件基本建立在半导体材料之上，当下硬件的发展已经逼近物理极限，各种技术都到达一个瓶颈期，因此想要有硬件更大程度的发展，可能是突破半导体材料的一次材料革命后，出现新的技术革命，来带动硬件新一轮的发展

### 四

> 说说自己对于这门课的期望（理论、实验、老师、助教都可以，随便谈谈）

非常期望能够在计算机组成这一门课学到很多新的有用的知识。本人专业为计算机科学与技术，对硬件和软件都有相当浓厚的兴趣。硬件的学习可能某种程度上来说会略显枯燥，但是如果真正掌握其中硬件的组成原理对于我个人来说非常具有成就感，即完全读透的感觉是非常的爽快。对硬件能够侃侃而谈是我的目标，同时这也会加深我对计算机科学这一学科的深层次理解。希望通过这门课能够学到真正有用的东西。

同时，希望自己能够不受考试过多的约束而更加灵活、自由地学习这门课。上学期数字逻辑设计开始之时我还没有这样的觉悟，以至于到课程中后期变成疲于应付实验课和理论课的双重压力，而没有学好学透彻，最后沦为考试的阶下囚。这学期希望能够更加熟练掌握相关知识，提前做好学习准备

希望老师助教能够更加耐心解答，尤其是有些步骤如果跳步，可能对像我一样的计算机小白非常unfriendly，需要自己课后花更多时间去重新学习:happy:
