`include "./Defines.vh"
`timescale 1ns / 1ps

module CSSTE_Pipeline_Stall(
    input clk_100mhz,
    input RSTN,
    input [3:0] BTN_y,
    input [15:0] SW,
    output HSYNC,
    output VSYNC,
    output [3:0] Red,
    output [3:0] Green,
    output [3:0] Blue,
    output [15:0] LED_out,
    output [7:0] AN,
    output [7:0] segment
    );

    /* Modules wire definition */

    // U1.
    wire [31:0] PC_out_IF;
    wire [31:0] PC_out_ID;
    wire [31:0] inst_ID;
    wire [31:0] PC_out_EX;
    wire MemRW_EX;
    wire MemRW_Mem;
    wire [31:0] Data_out;
    wire [31:0] Addr_out;
    wire [31:0] Data_out_WB;

    // U2.
    wire [31:0] spo;

    // U3.
    wire [31:0] douta;

    // U4.
    wire [31:0] Cpu_data4bus;
    wire [31:0] ram_data_in;
    wire [9:0] ram_addr;
    wire data_ram_we;
    wire GPIOf0000000_we;
    wire GPIOe0000000_we;
    wire counter_we;
    wire [31:0] Peripheral_in;

    // U5.
    wire [7:0] point_out;
    wire [7:0] LE_out;
    wire [31:0] Disp_num;

    // U6.
    // wire [7:0] AN;
    // wire [7:0] segment;

    // U7.
    wire [1:0] counter_set;
    // wire [15:0] LED_out;

    // U8.
    wire [31:0] clkdiv;
    wire Clk_CPU;

    // U9.
    wire [3:0] BTN_OK;
    wire [15:0] SW_OK;
    wire rst;

    // U10.
    wire counter0_OUT;
    wire counter1_OUT;
    wire counter2_OUT;
    wire [31:0] counter_out;

    // U11.
    // wire hs;
    // wire vs;
    // wire [3:0] vga_r;
    // wire [3:0] vga_g;
    // wire [3:0] vga_b;

    // Register wires definition.
    `RegFile_Regs_Declaration

    /* Modules instance */

    // U1.
    Pipeline_CPU_Stall U1 (
        // Input.
        .clk(Clk_CPU),
        .rst(rst),
        .inst_IF(spo),
        .Data_in(Cpu_data4bus),
        // Output.
        .PC_out_IF(PC_out_IF),
        .PC_out_ID(PC_out_ID),
        .inst_ID(inst_ID),
        .PC_out_EX(PC_out_EX),
        .MemRW_EX(MemRW_EX),
        .MemRW_Mem(MemRW_Mem),
        .Data_out(Data_out),
        .Addr_out(Addr_out),
        .Data_out_WB(Data_out_WB),
        `RegFile_Regs_Arguments
    );

    // U2.
    ROM_D U2 (
        .a(PC_out_IF[11:2]),
        .spo(spo)
    );

    // U3.
    RAM_B U3 (
        // Input.
        .clka(~clk_100mhz),
        .wea(data_ram_we),
        .addra(ram_addr),
        .dina(ram_data_in),
        // Output.
        .douta(douta)
    );

    // U4.
    MIO_BUS U4 (
        // Input.
        .clk(clk_100mhz),
        .rst(rst),
        .BTN(BTN_OK),
        .SW(SW_OK),
        .mem_w(MemRW_Mem),
        .Cpu_data2bus(Data_out),
        .addr_bus(Addr_out),
        .ram_data_out(douta),
        .led_out(LED_out),
        .counter_out(counter_out),
        .counter0_out(counter0_OUT),
        .counter1_out(counter1_OUT),
        .counter2_out(counter2_OUT),
        // Output.
        .Cpu_data4bus(Cpu_data4bus),
        .ram_data_in(ram_data_in),
        .ram_addr(ram_addr),
        .data_ram_we(data_ram_we),
        .GPIOf0000000_we(GPIOf0000000_we),
        .GPIOe0000000_we(GPIOe0000000_we),
        .counter_we(counter_we),
        .Peripheral_in(Peripheral_in)
    );

    // U5.
    Multi_8CH32 U5 (
        // Input.
        .clk(~Clk_CPU),
        .rst(rst),
        .EN(GPIOe0000000_we),
        .Test(SW_OK[7:5]),
        .point_in({clkdiv[31:0], clkdiv[31:0]}),
        .LES(64'b0),
        .Data0(Peripheral_in),
        .data1({2'b0, PC_out_IF[31:2]}),
        .data2(spo),
        .data3(counter_out),
        .data4(Addr_out),
        .data5(Data_out),
        .data6(Cpu_data4bus),
        .data7(PC_out_IF),
        // Output.
        .point_out(point_out),
        .LE_out(LE_out),
        .Disp_num(Disp_num)
    );

    // U6.
    Seg7_Dev U6 (
        // Input.
        .disp_num(Disp_num),
        .point(point_out),
        .les(LE_out),
        .scan(clkdiv[18:16]),
        // Output.
        .AN(AN),
        .segment(segment)
    );

    // U7.
    SPIO U7 (
        // Input.
        .clk(~Clk_CPU),
        .rst(rst),
        .Start(clkdiv[20]),
        .EN(GPIOf0000000_we),
        .P_Data(Peripheral_in),
        // Output.
        .counter_set(counter_set),
        .LED_out(LED_out),
        .led_clk(),
        .led_sout(),
        .led_clrn(),
        .LED_PEN(),
        .GPIOf0()
    );

    // U8.
    clk_div U8 (
        // Input.
        .clk(clk_100mhz),
        .rst(rst),
        .SW2(SW_OK[2]),
        .SW8(SW_OK[8]),
        .STEP(SW_OK[10]),
        // Output.
        .clkdiv(clkdiv),
        .Clk_CPU(Clk_CPU)
    );

    // U9.
    SAnti_jitter U9 (
        // Input.
        .clk(clk_100mhz),
        .RSTN(RSTN),
        .readn(1'b0), // Unconnected.
        .Key_y(BTN_y),
        .SW(SW),
        // Output.
        .Key_x(),
        .Key_out(),
        .Key_ready(),
        .pulse_out(),
        .BTN_OK(BTN_OK),
        .SW_OK(SW_OK),
        .CR(),
        .rst(rst)
    );

    // U10.
    Counter_x U10 (
        // Input.
        .clk(~Clk_CPU),
        .rst(rst),
        .clk0(clkdiv[6]),
        .clk1(clkdiv[9]),
        .clk2(clkdiv[11]),
        .counter_we(counter_we),
        .counter_val(Peripheral_in),
        .counter_ch(counter_set),
        // Output.
        .counter0_OUT(counter0_OUT),
        .counter1_OUT(counter1_OUT),
        .counter2_OUT(counter2_OUT),
        .counter_out(counter_out)
    );

    // U11.
    VGA U11 (
        // Input.
        .clk_25m(clkdiv[1]),
        .clk_100m(clk_100mhz),
        .rst(rst),
        .PC_IF(PC_out_IF),
        .inst_IF(spo),
        .PC_ID(PC_out_ID),
        .inst_ID(inst_ID),
        .PC_Ex(PC_out_EX),
        .MemRW_Ex(MemRW_EX),
        .MemRW_Mem(MemRW_Mem),
        .Data_out(Data_out),
        .Addr_out(Addr_out),
        .Data_out_WB(Data_out_WB),
        `RegFile_Regs_Arguments,
        // Output.
        .hs(HSYNC),
        .vs(VSYNC),
        .vga_r(Red),
        .vga_g(Green),
        .vga_b(Blue)
    );

endmodule