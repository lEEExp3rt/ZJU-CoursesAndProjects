`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/17 12:25:41
// Design Name: 
// Module Name: Top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Top(
	input clock,
	input rstn,
	input [15:0]SW,
	input ps2_clk,
	input ps2_data,
	output [3:0]AN,
	output [7:0]SEG,
	output hs,
	output vs,
	output [3:0] r,
	output [3:0] g,
	output [3:0] b,
	output SEGLED_CLK,
	output SEGLED_CLR,
	output SEGLED_DO,
	output SEGLED_PEN,
  // output LED_CLK,
	//output LED_CLR,
	//output LED_DO,
	//output LED_PEN,
	//inout [4:0]BTN_X,
	//inout [3:0]BTN_Y,
	output buzzer
    );
	 

	
	reg [31:0]clkdiv;
	always@(posedge clock) begin
		clkdiv <= clkdiv + 1'b1;
	end
	assign buzzer = 1'b1;
	wire [15:0] SW_OK;
	AntiJitter #(4) a0[15:0](.clk(clkdiv[15]), .I(SW), .O(SW_OK));
	
	wire [4:0] keyCode;
	wire keyReady;
	
	wire [31:0] segTestData;
	wire [3:0]sout;
   Seg7Device segDevice(.clkIO(clkdiv[3]), .clkScan(clkdiv[15:14]), .clkBlink(clkdiv[25]),
		.data(segTestData), .point(8'h0), .LES(8'h0),
		.sout(sout));
	assign SEGLED_CLK = sout[3];
	assign SEGLED_DO = sout[2];
	assign SEGLED_PEN = sout[1];
	assign SEGLED_CLR = sout[0];
	
 	reg [11:0] vga_data;
 	wire [9:0] col_addr;
 	wire [8:0] row_addr;
	
	vgac v0 (
		.vga_clk(clkdiv[1]), .clrn(SW_OK[0]), .d_in(vga_data), .row_addr(row_addr), .col_addr(col_addr), .r(r), .g(g), .b(b), .hs(hs), .vs(vs)
	);
	
	
	//Definition of Reg and Wire
	reg cover;
	reg finish;
	reg gamebegin;
	initial begin
	  cover=1;
	  finish=0;
	  gamebegin=0;
	end 
	
	wire clk_100ms;
	clk_100ms c1(clock,clk_100ms);
	wire clk_1s;
	clk_1s c2(clock,clk_1s);
	wire clk_4s;
	clk_4s c3(clock,clk_4s);
	wire clk_10ms;
	clk_10ms c7(clock,clk_10ms);
	wire clk_cover,clk_start;
	assign clk_cover=clock&(cover);
	assign clk_start=clock&(~cover)&(~finish);
	
	
	reg[18:0] first;
   wire[11:0] spo_first;
   newbackground b1(.addra(first),.douta(spo_first),.clka(clkdiv[1]));
	always @(posedge clk_cover)begin 
    first<=(col_addr>=0&&col_addr<=639&&row_addr>=0&&row_addr<=479)?col_addr+(479-row_addr)*640:0; //给封面赋值
   end
	
	reg[18:0] Background;
   wire[11:0] spo_Background;
   gamebg b2(.addra(Background),.douta(spo_Background),.clka(clkdiv[1]));
	always @(posedge clock)begin 
    Background<=(col_addr>=0&&col_addr<=639&&row_addr>=0&&row_addr<=479)?col_addr+(479-row_addr)*640:0; //给background赋值
   end
	
	
	
	//nowpostion
	reg[9:0] nowpos1;
	reg flag1;
	reg[9:0] nowpos2;
	reg flag2;
	reg[9:0] nowpos3;
	reg flag3;
	reg[9:0] nowpos4;
	reg flag4;
	
	//block
	reg[13:0] block1_1;
	wire[11:0] spo_block1_1;
	reg[13:0] block1_2;
	wire[11:0] spo_block1_2;
	reg[13:0] block1_3;
	wire[11:0] spo_block1_3;
	reg[13:0] block1_4;
	wire[11:0] spo_block1_4;
	
	reg[13:0] block2_1;
	wire[11:0] spo_block2_1;
	reg[13:0] block2_2;
	wire[11:0] spo_block2_2;
	reg[13:0] block2_3;
	wire[11:0] spo_block2_3;
	reg[13:0] block2_4;
	wire[11:0] spo_block2_4;
	
	reg[13:0] block3_1;
	wire[11:0] spo_block3_1;
	reg[13:0] block3_2;
	wire[11:0] spo_block3_2;
	reg[13:0] block3_3;
	wire[11:0] spo_block3_3;
	reg[13:0] block3_4;
	wire[11:0] spo_block3_4;
	
	reg[13:0] block4_1;
	wire[11:0] spo_block4_1;
	reg[13:0] block4_2;
	wire[11:0] spo_block4_2;
	reg[13:0] block4_3;
	wire[11:0] spo_block4_3;
	reg[13:0] block4_4;
	wire[11:0] spo_block4_4;
	
	reg[12:0] keyup_pic_1;
	wire[11:0] spo_keyup_pic_1;
	reg[12:0] keydown_pic_1;
	wire[11:0] spo_keydown_pic_1;
	
	reg[12:0] keyup_pic_2;
	wire[11:0] spo_keyup_pic_2;
	reg[12:0] keydown_pic_2;
	wire[11:0] spo_keydown_pic_2;
	
	reg[12:0] keyup_pic_3;
	wire[11:0] spo_keyup_pic_3;
	reg[12:0] keydown_pic_3;
	wire[11:0] spo_keydown_pic_3;
	
	reg[12:0] keyup_pic_4;
	wire[11:0] spo_keyup_pic_4;
	reg[12:0] keydown_pic_4;
	wire[11:0] spo_keydown_pic_4;
	
	Keyup_pic k1_1(.addra(keyup_pic_1),.douta(spo_keyup_pic_1),.clka(clkdiv[1]));
	always @(posedge clock)begin 
    keyup_pic_1<=(col_addr>=80&&col_addr<=199&&row_addr>=420&&row_addr<=479)?col_addr-60+(479-row_addr)*120:0; //给background赋值
   end
	Keydown_pic k0_1(.addra(keydown_pic_1),.douta(spo_keydown_pic_1),.clka(clkdiv[1]));
	always @(posedge clock)begin 
    keydown_pic_1<=(col_addr>=80&&col_addr<=199&&row_addr>=420&&row_addr<=479)?col_addr+60+(479-row_addr)*120:0; //给background赋值
   end
	
	Keyup_pic k1_2(.addra(keyup_pic_2),.douta(spo_keyup_pic_2),.clka(clkdiv[1]));
	always @(posedge clock)begin 
    keyup_pic_2<=(col_addr>=200&&col_addr<=319&&row_addr>=420&&row_addr<=479)?col_addr-60+(479-row_addr)*120:0; //给background赋值
   end
	Keydown_pic k0_2(.addra(keydown_pic_2),.douta(spo_keydown_pic_2),.clka(clkdiv[1]));
	always @(posedge clock)begin 
    keydown_pic_2<=(col_addr>=200&&col_addr<=319&&row_addr>=420&&row_addr<=479)?col_addr+60+(479-row_addr)*120:0; //给background赋值
   end
	
	Keyup_pic k1_3(.addra(keyup_pic_3),.douta(spo_keyup_pic_3),.clka(clkdiv[1]));
	always @(posedge clock)begin 
    keyup_pic_3<=(col_addr>=320&&col_addr<=439&&row_addr>=420&&row_addr<=479)?col_addr-60+(479-row_addr)*120:0; //给background赋值
   end
	Keydown_pic k0_3(.addra(keydown_pic_3),.douta(spo_keydown_pic_3),.clka(clkdiv[1]));
	always @(posedge clock)begin 
    keydown_pic_3<=(col_addr>=320&&col_addr<=439&&row_addr>=420&&row_addr<=479)?col_addr+60+(479-row_addr)*120:0; //给background赋值
   end
	
	Keyup_pic k1_4(.addra(keyup_pic_4),.douta(spo_keyup_pic_4),.clka(clkdiv[1]));
	always @(posedge clock)begin 
    keyup_pic_4<=(col_addr>=440&&col_addr<=559&&row_addr>=420&&row_addr<=479)?col_addr-60+(479-row_addr)*120:0; //给background赋值
   end
	Keydown_pic k0_4(.addra(keydown_pic_4),.douta(spo_keydown_pic_4),.clka(clkdiv[1]));
	always @(posedge clock)begin 
    keydown_pic_4<=(col_addr>=440&&col_addr<=559&&row_addr>=420&&row_addr<=479)?col_addr+60+(479-row_addr)*120:0; //给background赋值
   end
	
	
	//which is displayed
	reg randpos1_1,randpos1_2,randpos1_3,randpos1_4;
	reg randpos2_1,randpos2_2,randpos2_3,randpos2_4;
	reg randpos3_1,randpos3_2,randpos3_3,randpos3_4;
	reg randpos4_1,randpos4_2,randpos4_3,randpos4_4;
	
	//IP core invoke
	birdblock1 x1_1(.addra(block1_1),.douta(spo_block1_1),.clka(clkdiv[1]));
	birdblock1 x1_2(.addra(block1_2),.douta(spo_block1_2),.clka(clkdiv[1]));
	birdblock1 x1_3(.addra(block1_3),.douta(spo_block1_3),.clka(clkdiv[1]));
	birdblock1 x1_4(.addra(block1_4),.douta(spo_block1_4),.clka(clkdiv[1]));
	
	block2 x2_1(.addra(block2_1),.douta(spo_block2_1),.clka(clkdiv[1]));
	block2 x2_2(.addra(block2_2),.douta(spo_block2_2),.clka(clkdiv[1]));
	block2 x2_3(.addra(block2_3),.douta(spo_block2_3),.clka(clkdiv[1]));
	block2 x2_4(.addra(block2_4),.douta(spo_block2_4),.clka(clkdiv[1]));
	
	block3 x3_1(.addra(block3_1),.douta(spo_block3_1),.clka(clkdiv[1]));
	block3 x3_2(.addra(block3_2),.douta(spo_block3_2),.clka(clkdiv[1]));
	block3 x3_3(.addra(block3_3),.douta(spo_block3_3),.clka(clkdiv[1]));
	block3 x3_4(.addra(block3_4),.douta(spo_block3_4),.clka(clkdiv[1]));
	
	block4 x4_1(.addra(block4_1),.douta(spo_block4_1),.clka(clkdiv[1]));
	block4 x4_2(.addra(block4_2),.douta(spo_block4_2),.clka(clkdiv[1]));
	block4 x4_3(.addra(block4_3),.douta(spo_block4_3),.clka(clkdiv[1]));
	block4 x4_4(.addra(block4_4),.douta(spo_block4_4),.clka(clkdiv[1]));
	
	initial begin
	  nowpos1=-90;
	  nowpos2=-180;
	  nowpos3=-270;
	  nowpos4=-360;
	end
	
	always @(posedge clk_10ms)begin
	  nowpos1=nowpos1+1;
	  if(nowpos1==271)begin
   	nowpos1=-90;
	  end
	  
	  nowpos2=nowpos2+1;
	  if(nowpos2==271)begin
   	nowpos2=-90;
	  end
	  
	  nowpos3=nowpos3+1;
	  if(nowpos3==271)begin
   	nowpos3=-90;
	  end
	  
	  nowpos4=nowpos4+1;
	  if(nowpos4==271)begin
   	nowpos4=-90;
	  end
	  
	end
	
	always @(posedge clk_4s)begin
	  randpos1_1=1;
	  randpos1_2=0;
	  randpos1_3=1;
	  randpos1_4=0;
	  
	  randpos2_1=0;
	  randpos2_2=1;
	  randpos2_3=0;
	  randpos2_4=1;
	  
	  randpos3_1=0;
	  randpos3_2=0;
	  randpos3_3=1;
	  randpos3_4=0;
	  
	  randpos4_1=0;
	  randpos4_2=0;
	  randpos4_3=0;
	  randpos4_4=1;
	end
	
	always @(posedge clock)begin 
	 block1_1<=(col_addr>=80&&col_addr<200&&row_addr>=nowpos1*1+60&&row_addr<(nowpos1*1+60+90))?(col_addr-60)+((nowpos1*1+90)-(row_addr-60))*120:0;  //给background赋值
	 block1_2<=(col_addr>=200&&col_addr<320&&row_addr>=nowpos1*1+60&&row_addr<(nowpos1*1+60+90))?(col_addr-180)+((nowpos1*1+90)-(row_addr-60))*120:0;  //给background赋值
	 block1_3<=(col_addr>=320&&col_addr<440&&row_addr>=nowpos1*1+60&&row_addr<(nowpos1*1+60+90))?(col_addr-300)+((nowpos1*1+90)-(row_addr-60))*120:0;  //给background赋值
    block1_4<=(col_addr>=440&&col_addr<560&&row_addr>=nowpos1*1+60&&row_addr<(nowpos1*1+60+90))?(col_addr-420)+((nowpos1*1+90)-(row_addr-60))*120:0;  //给background赋值
	 
	 block2_1<=(col_addr>=80&&col_addr<200&&row_addr>=nowpos2*1+60&&row_addr<(nowpos2*1+60+90))?(col_addr-60)+((nowpos2*1+90)-(row_addr-60))*120:0;  //给background赋值
	 block2_2<=(col_addr>=200&&col_addr<320&&row_addr>=nowpos2*1+60&&row_addr<(nowpos2*1+60+90))?(col_addr-180)+((nowpos2*1+90)-(row_addr-60))*120:0;  //给background赋值
	 block2_3<=(col_addr>=320&&col_addr<440&&row_addr>=nowpos2*1+60&&row_addr<(nowpos2*1+60+90))?(col_addr-300)+((nowpos2*1+90)-(row_addr-60))*120:0;  //给background赋值
    block2_4<=(col_addr>=440&&col_addr<560&&row_addr>=nowpos2*1+60&&row_addr<(nowpos2*1+60+90))?(col_addr-420)+((nowpos2*1+90)-(row_addr-60))*120:0;  //给background赋值
	
	 block3_1<=(col_addr>=80&&col_addr<200&&row_addr>=nowpos3*1+60&&row_addr<(nowpos3*1+60+90))?(col_addr-60)+((nowpos3*1+90)-(row_addr-60))*120:0;  //给background赋值
	 block3_2<=(col_addr>=200&&col_addr<320&&row_addr>=nowpos3*1+60&&row_addr<(nowpos3*1+60+90))?(col_addr-180)+((nowpos3*1+90)-(row_addr-60))*120:0;  //给background赋值
	 block3_3<=(col_addr>=320&&col_addr<440&&row_addr>=nowpos3*1+60&&row_addr<(nowpos3*1+60+90))?(col_addr-300)+((nowpos3*1+90)-(row_addr-60))*120:0;  //给background赋值
    block3_4<=(col_addr>=440&&col_addr<560&&row_addr>=nowpos3*1+60&&row_addr<(nowpos3*1+60+90))?(col_addr-420)+((nowpos3*1+90)-(row_addr-60))*120:0;  //给background赋值
	 
	 block4_1<=(col_addr>=80&&col_addr<200&&row_addr>=nowpos4*1+60&&row_addr<(nowpos4*1+60+90))?(col_addr-60)+((nowpos4*1+90)-(row_addr-60))*120:0;  //给background赋值
	 block4_2<=(col_addr>=200&&col_addr<320&&row_addr>=nowpos4*1+60&&row_addr<(nowpos4*1+60+90))?(col_addr-180)+((nowpos4*1+90)-(row_addr-60))*120:0;  //给background赋值
	 block4_3<=(col_addr>=320&&col_addr<440&&row_addr>=nowpos4*1+60&&row_addr<(nowpos4*1+60+90))?(col_addr-300)+((nowpos4*1+90)-(row_addr-60))*120:0;  //给background赋值
    block4_4<=(col_addr>=440&&col_addr<560&&row_addr>=nowpos4*1+60&&row_addr<(nowpos4*1+60+90))?(col_addr-420)+((nowpos4*1+90)-(row_addr-60))*120:0;  //给background赋值
	end
	
	
	
	//main
	always@(posedge clock) begin
     if(cover==1) begin
       vga_data<=spo_first[11:0];
	  end
	  if(cover==0) begin
	    vga_data<=spo_Background[11:0];
	  end
	  if(gamebegin==1) begin
	  
	    if(col_addr>=80&&col_addr<200&&row_addr>=nowpos1*1+60&&row_addr<(nowpos1*1+60+90)&&randpos1_1==1) begin
		   vga_data<=spo_block1_1[11:0];
		 end
		 if(col_addr>=200&&col_addr<320&&row_addr>=nowpos1*1+60&&row_addr<(nowpos1*1+60+90)&&randpos1_2==1) begin
		   vga_data<=spo_block1_2[11:0];
		 end
		 if(col_addr>=320&&col_addr<440&&row_addr>=nowpos1*1+60&&row_addr<(nowpos1*1+60+90)&&randpos1_3==1) begin
		   vga_data<=spo_block1_3[11:0];
		 end
		 if(col_addr>=440&&col_addr<560&&row_addr>=nowpos1*1+60&&row_addr<(nowpos1*1+60+90)&&randpos1_4==1) begin
		   vga_data<=spo_block1_4[11:0];
		 end
		 
		 if(col_addr>=80&&col_addr<200&&row_addr>=nowpos2*1+60&&row_addr<(nowpos2*1+60+90)&&randpos2_1==1) begin
		   vga_data<=spo_block2_1[11:0];
		 end
		 if(col_addr>=200&&col_addr<320&&row_addr>=nowpos2*1+60&&row_addr<(nowpos2*1+60+90)&&randpos2_2==1) begin
		   vga_data<=spo_block2_2[11:0];
		 end
		 if(col_addr>=320&&col_addr<440&&row_addr>=nowpos2*1+60&&row_addr<(nowpos2*1+60+90)&&randpos2_3==1) begin
		   vga_data<=spo_block2_3[11:0];
		 end
		 if(col_addr>=440&&col_addr<560&&row_addr>=nowpos2*1+60&&row_addr<(nowpos2*1+60+90)&&randpos2_4==1) begin
		   vga_data<=spo_block2_4[11:0];
		 end
		 
		 if(col_addr>=80&&col_addr<200&&row_addr>=nowpos3*1+60&&row_addr<(nowpos3*1+60+90)&&randpos3_1==1) begin
		   vga_data<=spo_block3_1[11:0];
		 end
		 if(col_addr>=200&&col_addr<320&&row_addr>=nowpos3*1+60&&row_addr<(nowpos3*1+60+90)&&randpos3_2==1) begin
		   vga_data<=spo_block3_2[11:0];
		 end
		 if(col_addr>=320&&col_addr<440&&row_addr>=nowpos3*1+60&&row_addr<(nowpos3*1+60+90)&&randpos3_3==1) begin
		   vga_data<=spo_block3_3[11:0];
		 end
		 if(col_addr>=440&&col_addr<560&&row_addr>=nowpos3*1+60&&row_addr<(nowpos3*1+60+90)&&randpos3_4==1) begin
		   vga_data<=spo_block3_4[11:0];
		 end
		 
		 if(col_addr>=80&&col_addr<200&&row_addr>=nowpos4*1+60&&row_addr<(nowpos4*1+60+90)&&randpos4_1==1) begin
		   vga_data<=spo_block4_1[11:0];
		 end
		 if(col_addr>=200&&col_addr<320&&row_addr>=nowpos4*1+60&&row_addr<(nowpos4*1+60+90)&&randpos4_2==1) begin
		   vga_data<=spo_block4_2[11:0];
		 end
		 if(col_addr>=320&&col_addr<440&&row_addr>=nowpos4*1+60&&row_addr<(nowpos4*1+60+90)&&randpos4_3==1) begin
		   vga_data<=spo_block4_3[11:0];
		 end
		 if(col_addr>=440&&col_addr<560&&row_addr>=nowpos4*1+60&&row_addr<(nowpos4*1+60+90)&&randpos4_4==1) begin
		   vga_data<=spo_block4_4[11:0];
		 end
		 
		 if(col_addr>=80&&col_addr<200&&row_addr>=420&&row_addr<479&&KeyUp_1==1) begin
		   vga_data<=spo_keyup_pic_1[11:0];
		 end
		 if(col_addr>=80&&col_addr<200&&row_addr>=420&&row_addr<479&&KeyUp_1==0) begin
		   vga_data<=spo_keydown_pic_1[11:0];
		 end
		 
		 if(col_addr>=200&&col_addr<320&&row_addr>=420&&row_addr<479&&KeyUp_2==1) begin
		   vga_data<=spo_keyup_pic_2[11:0];
		 end
		 if(col_addr>=200&&col_addr<320&&row_addr>=420&&row_addr<479&&KeyUp_2==0) begin
		   vga_data<=spo_keydown_pic_2[11:0];
		 end
		 
		 if(col_addr>=320&&col_addr<440&&row_addr>=420&&row_addr<479&&KeyUp_3==1) begin
		   vga_data<=spo_keyup_pic_3[11:0];
		 end
		 if(col_addr>=320&&col_addr<440&&row_addr>=420&&row_addr<479&&KeyUp_3==0) begin
		   vga_data<=spo_keydown_pic_3[11:0];
		 end
		 
		 if(col_addr>=440&&col_addr<560&&row_addr>=420&&row_addr<479&&KeyUp_4==1) begin
		   vga_data<=spo_keyup_pic_4[11:0];
		 end
		 if(col_addr>=440&&col_addr<560&&row_addr>=420&&row_addr<479&&KeyUp_4==0) begin
		   vga_data<=spo_keydown_pic_4[11:0];
		 end
	  end
	end//xianshifengmian
	
	
	
	
	
	
	//zShiftReg #(.WIDTH(16)) ledDevice (.clk(clkdiv[3]), .pdata(~ledData), .sout({LED_CLK,LED_DO,LED_PEN,LED_CLR}));

    wire clock_20ms;
	 clk_20ms c4(clock,clock_20ms);
    wire [9:0] data_out;
	 wire ready;
	 reg [15:0] score;
	 wire [15:0] OutputScore;
	 reg [6:0] game_time;
	 reg KeyUp_1;
	 reg KeyUp_2;
	 reg KeyUp_3;
	 reg KeyUp_4;
	 initial begin
	   score=0;
		KeyUp_1=1;
		KeyUp_2=1;
		KeyUp_3=1;
		KeyUp_4=1;
	 end
	 ps2_ver2 ps2(.clk(clock),.rst(1'b0),.ps2_clk(ps2_clk),.ps2_data(ps2_data),.data_out(data_out[9:0]),.ready(ready));
	 always@(posedge clock_20ms) begin
	   KeyUp_1=1;
		KeyUp_2=1;
		KeyUp_3=1;
		KeyUp_4=1;
	   if(cover==1) begin
		  if(data_out[8]==1'b0) begin
		    if(data_out[7:0]==8'h5a) begin
			   cover=0;
				gamebegin=1;
			 end
		  end
		end
		if(game_time==60) begin
		  cover=1;
		  gamebegin=0;
		end
		if(gamebegin==1) begin
		  if(data_out[8]==1'b0) begin
		    if(finish==0) begin
			   if(data_out[8]==1'b0) begin
				  if(data_out[7:0]==8'h1b) begin//s
				    if(nowpos1>=250&&nowpos1<=270&&randpos1_1==1) begin 
					   score<=score+1;
						KeyUp_1=0;
					 end
					 if(nowpos2>=250&&nowpos2<=270&&randpos2_1==1) begin
   				   score<=score+1;
						KeyUp_1=0; 
					 end
					 if(nowpos3>=250&&nowpos3<=270&&randpos3_1==1) begin
					   score<=score+1;
						KeyUp_1=0;
					 end
					 if(nowpos4>=250&&nowpos4<=270&&randpos4_1==1) begin
					   score<=score+1;
						KeyUp_1=0;
					 end
		        end
				  if(data_out[7:0]==8'h23) begin//d
				    if(nowpos1>=250&&nowpos1<=270&&randpos1_2==1) begin
					   score<=score+1;
						KeyUp_2=0;
					 end
					 if(nowpos2>=250&&nowpos2<=270&&randpos2_2==1) begin
					   score<=score+1;
						KeyUp_2=0;
					 end
					 if(nowpos3>=250&&nowpos3<=270&&randpos3_2==1) begin
					   score<=score+1;
						KeyUp_2=0;
					 end
					 if(nowpos4>=250&&nowpos4<=270&&randpos4_2==1) begin
					   score<=score+1;
						KeyUp_2=0;
					 end
		        end
				  if(data_out[7:0]==8'h3b) begin//j
				    if(nowpos1>=250&&nowpos1<=270&&randpos1_3==1) begin
					   score<=score+1;
						KeyUp_3=0;
					 end 
					 if(nowpos2>=250&&nowpos2<=270&&randpos2_3==1) begin 
					   score<=score+1;
						KeyUp_3=0;
					 end
					 if(nowpos3>=250&&nowpos3<=270&&randpos3_3==1) begin
					   score<=score+1;
						KeyUp_3=0;
					 end
					 if(nowpos4>=250&&nowpos4<=270&&randpos4_3==1) begin
					   score<=score+1;
						KeyUp_3=0;
					 end
		        end
				  if(data_out[7:0]==8'h42) begin//k
				    if(nowpos1>=250&&nowpos1<=270&&randpos1_4==1) begin 
					   score<=score+1;
						KeyUp_4=0;
					 end
					 if(nowpos2>=250&&nowpos2<=270&&randpos2_4==1) begin
					   score<=score+1;
						KeyUp_4=0;
					 end
					 if(nowpos3>=250&&nowpos3<=270&&randpos3_4==1) begin
					   score<=score+1;
						KeyUp_4=0;
					 end
					 if(nowpos4>=250&&nowpos4<=270&&randpos4_4==1) begin
					   score<=score+1;
						KeyUp_4=0;
					 end
		        end
			   end
			 end  
		  end		 
		end
	 end
	 always@ (posedge clk_1s) begin
	   if(gamebegin==1) begin
	   game_time=game_time+1;
		end
		if(game_time==61) begin
		game_time=0;
		end
	 end
	
	 assign OutputScore=score;
	 disp_num d0(clock, OutputScore, 4'b0000, 4'b0100, 1'b0, AN, SEG);
	 
endmodule
