`timescale 1ns / 1ps

module socTest(
    input clk,
    input rst
    );
    
    /* Pipeline CPU */
    wire [31:0] Addr_out;
    wire [31:0] Data_out;       
    wire        MemRW;
    wire [31:0] PC_out;
    /* RAM */
    wire [31:0] douta;
    /* ROM */
    wire [31:0] spo;
    
    Pipeline_CPU_Stall Pipeline_CPU_Stall (
        // Input.
        .Data_in(douta),
        .clk(clk),
        .inst_IF(spo),
        .rst(rst),
        // Output.
        .Addr_out(Addr_out),
        .Data_out(Data_out),
        .MemRW_Mem(MemRW),
        .PC_out_IF(PC_out)
    );

    RAM_B RAM(
        .clka(~clk),
        .wea(MemRW),
        .addra(Addr_out[11:2]),
        .dina(Data_out),
        .douta(douta)
    );

    ROM_D ROM(
        .a(PC_out[11:2]),
        .spo(spo)
    );
endmodule