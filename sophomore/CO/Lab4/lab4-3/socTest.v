`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/27 21:36:40
// Design Name: 
// Module Name: socTest
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


module socTest(
    input clk,
    input rst
    );
    
    /* SCPU 中接出 */
    wire [31:0] Addr_out;
    wire [31:0] Data_out;       
    wire        CPU_MIO;
    wire        MemRW;
    wire [31:0] PC_out;
    /* RAM 接出 */
    wire [31:0] douta;
    /* ROM 接出 */
    wire [31:0] spo;
    
    SCPU_more u0(
        /*YOUR_CODE*/
        .Data_in(douta),
        .MIO_ready(CPU_MIO),
        .clk(clk),
        .inst_in(spo),
        .rst(rst),
        .Addr_out(Addr_out),
        .CPU_MIO(CPU_MIO),
        .Data_out(Data_out),
        .MemRW(MemRW),
        .PC_out(PC_out)
    );

    RAM_B u1(
        /*YOUR_CODE*/
        .clka(~clk),
        .wea(MemRW),
        .addra(Addr_out[11:2]),
        .dina(Data_out),
        .douta(douta)
    );

    ROM_D u2(
        /*YOUR_CODE*/
        .a(PC_out[11:2]),
        .spo(spo)
    );
endmodule