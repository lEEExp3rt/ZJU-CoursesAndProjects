/*
 * Module: Random
 * This module is used to generate a series of random data
 * The random data consists of only 0 and 1.
 */
module Random(
    input clk,
    input rst,
    output reg rand
    );
	 reg [6:0] Time;
	 reg [31:0] seed;
initial begin
  Time=0;
  seed<=32'b00011110010101011011010011100101;
end;
always@(posedge clk)begin
    Time=Time+1;
    if (rst == 1'b1) begin
      if(Time==0) rand <= seed[0];
		if(Time==1) rand <= seed[1];
		if(Time==2) rand <= seed[2];
		if(Time==3) rand <= seed[3];
		if(Time==4) rand <= seed[4];
		if(Time==5) rand <= seed[5];
		if(Time==6) rand <= seed[6];
		if(Time==7) rand <= seed[7];
		if(Time==8) rand <= seed[8];
		if(Time==9) rand <= seed[9];
		if(Time==10) rand <= seed[10];
		if(Time==11) rand <= seed[11];
		if(Time==12) rand <= seed[12];
		if(Time==13) rand <= seed[13];
		if(Time==14) rand <= seed[14];
		if(Time==15) rand <= seed[15];
		if(Time==16) rand <= seed[16];
		if(Time==17) rand <= seed[17];
		if(Time==18) rand <= seed[18];
		if(Time==19) rand <= seed[19];
		if(Time==20) rand <= seed[20];
		if(Time==21) rand <= seed[21];
		if(Time==22) rand <= seed[22];
		if(Time==23) rand <= seed[23];
		if(Time==24) rand <= seed[24];
		if(Time==25) rand <= seed[25];
		if(Time==26) rand <= seed[26];
		if(Time==27) rand <= seed[27];
		if(Time==28) rand <= seed[28];
		if(Time==29) rand <= seed[29];
		if(Time==30) rand <= seed[30];
		if(Time==31) rand <= seed[31];
    end 
	 if(Time==32) Time=0;

end
endmodule
