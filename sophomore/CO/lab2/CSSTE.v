`timescale 1ns / 1ps

module CSSTE(
    input clk_100mhz,
    input RSTN,
    input [3:0] BTN_y,
    input [15:0] SW,
    output [3:0] Blue,
    output [3:0] Green,
    output [3:0] Red,
    output HSYNC,
    output VSYNC,
    output [15:0] LED_out,
    output [7:0] AN,
    output [7:0] segment
    // No in use ports
    //output LED_PEN,
    //output SEG_PEN,
    //output led_clk,
    //output led_clrn,
    //output led_sout,
    //output seg_clk,
    //output seg_clrn,
    //output seg_sout
    );

    // Wire Definitions
    // Input Ports
    wire I_clk_100mhz;
    assign I_clk_100mhz = clk_100mhz;
    wire I_RSTN;
    assign I_RSTN = RSTN;
    wire [3:0] I_BTN_y;
    assign I_BTN_y = BTN_y;
    wire [15:0] I_SW;
    assign I_SW = SW;
    // U1
    wire U1_MemRW;
    wire [31:0] U1_Addr_out;
    wire [31:0] U1_Data_out;
    wire [31:0] U1_PC_out;
    // U2
    wire [31:0] U2_spo;
    // U3
    wire [31:0] U3_douta;
    // U4
    wire [31:0] U4_Cpu_data4bus;
    wire [31:0] U4_ram_data_in;
    wire [9:0] U4_ram_addr;
    wire U4_data_ram_we;
    wire U4_GPIOf0000000_we;
    wire U4_GPIOe0000000_we;
    wire U4_counter_we;
    wire [31:0] U4_Peripheral_in;
    // U5
    wire [7:0] U5_point_out;
    wire [7:0] U5_LE_out;
    wire [31:0] U5_Disp_num;
    // U6
//    wire [7:0] U6_AN;
//    wire [7:0] U6_segment;
    // U7
    wire [1:0] U7_counter_set;
//    wire [15:0] U7_LED_out;
    // U8
    wire [31:0] U8_clkdiv;
    wire U8_Clk_CPU;
    // U9
    wire [3:0] U9_BTN_OK;
    wire [15:0] U9_SW_OK;
    wire U9_rst;
    // U10
    wire U10_counter0_OUT;
    wire U10_counter1_OUT;
    wire U10_counter2_OUT;
    wire [31:0] U10_counter_out;
    // U11
//    wire U11_hs;
//    wire U11_vs;
//    wire [3:0] U11_vga_r;
//    wire [3:0] U11_vga_g;
//    wire [3:0] U11_vga_b;
    // Output Ports
    wire O_HSYNC;
    assign HSYNC = O_HSYNC;
    wire O_VSYNC;
    assign VSYNC = O_VSYNC;
    wire [3:0] O_Red;
    assign Red = O_Red;
    wire [3:0] O_Green;
    assign Green = O_Green;
    wire [3:0] O_Blue;
    assign Blue = O_Blue;
    wire [15:0] O_LED_out;
    assign LED_out = O_LED_out;
    wire [7:0] O_AN;
    assign AN = O_AN;
    wire [7:0] O_segment;
    assign segment = O_segment;

    // Submodules Connections
    SCPU U1 (
        // Input
        .MIO_ready(1'b0),
        .clk(U8_Clk_CPU),
        .rst(U9_rst),
        .Data_in(U4_Cpu_data4bus),
        .inst_in(U2_spo),
        // Output
        //.CPU_MIO(),
        .MemRW(U1_MemRW),
        .Addr_out(U1_Addr_out),
        .Data_out(U1_Data_out),
        .PC_out(U1_PC_out)
    );

    ROM_D U2 (
        // Input
        .a(U1_PC_out[11:2]),
        // Output
        .spo(U2_spo)
    );

    RAM_B U3 (
        // Input
        .clka(~I_clk_100mhz),
        .wea(U4_data_ram_we),
        .addra(U4_ram_addr),
        .dina(U4_ram_data_in),
        // Output
        .douta(U3_douta)
    );

    MIO_BUS U4 (
        // Input
        .clk(I_clk_100mhz),
        .rst(U9_rst),
        .BTN(U9_BTN_OK),
        .SW(U9_SW_OK),
        .mem_w(U1_MemRW),
        .Cpu_data2bus(U1_Data_out),
        .addr_bus(U1_Addr_out),
        .ram_data_out(U3_douta),
        .led_out(O_LED_out),
        .counter_out(U10_counter_out),
        .counter0_out(U10_counter0_OUT),
        .counter1_out(U10_counter1_OUT), 
        .counter2_out(U10_counter2_OUT),
        // Output
        .Cpu_data4bus(U4_Cpu_data4bus),
        .ram_data_in(U4_ram_data_in),
        .ram_addr(U4_ram_addr),
        .data_ram_we(U4_data_ram_we),
        .GPIOf0000000_we(U4_GPIOf0000000_we),
        .GPIOe0000000_we(U4_GPIOe0000000_we),
        .counter_we(U4_counter_we),
        .Peripheral_in(U4_Peripheral_in)
    );

    Multi_8CH32 U5 (
        // Input
        .clk(~U8_Clk_CPU),
        .rst(U9_rst),
        .EN(U4_GPIOe0000000_we),
        .Test(U9_SW_OK[7:5]),
        .point_in({U8_clkdiv[31:0], U8_clkdiv[31:0]}),
        .LES(64'b0),
        .Data0(U4_Peripheral_in),
        .data1({2'b0, U1_PC_out[31:2]}),
        .data2(U2_spo),
        .data3(U10_counter_out),
        .data4(U1_Addr_out),
        .data5(U1_Data_out),
        .data6(U4_Cpu_data4bus),
        .data7(U1_PC_out),
        // Output
        .point_out(U5_point_out),
        .LE_out(U5_LE_out),
        .Disp_num(U5_Disp_num)
    );

    Seg7_Dev_0 U6 (
        // Input
        .disp_num(U5_Disp_num),
        .point(U5_point_out),
        .les(U5_LE_out),
        .scan({U8_clkdiv[18], U8_clkdiv[17], U8_clkdiv[16]}),
        // Output
        .AN(O_AN),
        .segment(O_segment)
    );

    SPIO U7 (
        // Input
        .clk(~U8_Clk_CPU),
        .rst(U9_rst),
        .Start(U8_clkdiv[20]),
        .EN(U4_GPIOf0000000_we),
        .P_Data(U4_Peripheral_in),
        // Output
        .counter_set(U7_counter_set),
        .LED_out(O_LED_out)
        //.led_clk(),
        //.led_sout(),
        //.led_clrn(),
        //.LED_PEN(),
        //.GPIOf0()
    );

    clk_div U8 (
        // Input
        .clk(I_clk_100mhz),
        .rst(U9_rst),
        .SW2(U9_SW_OK[2]),
        .SW8(U9_SW_OK[8]),
        .STEP(U9_SW_OK[10]),
        // Output
        .clkdiv(U8_clkdiv),
        .Clk_CPU(U8_Clk_CPU)
    );

    SAnti_jitter U9 (
        // Input
        .clk(I_clk_100mhz),
        .RSTN(I_RSTN),
        .readn(1'b0),
        .Key_y(I_BTN_y),
        .SW(I_SW),
        // Output
        //.Key_x(),
        //.Key_out(),
        //.Key_ready(),
        //.pulse_out(),
        .BTN_OK(U9_BTN_OK),
        .SW_OK(U9_SW_OK),
        //.CR(),
        .rst(U9_rst)
    );

    Counter_x U10 (
        // Input
        .clk(~U8_Clk_CPU),
        .rst(U9_rst),
        .clk0(U8_clkdiv[6]),
        .clk1(U8_clkdiv[9]),
        .clk2(U8_clkdiv[11]),
        .counter_we(U4_counter_we),
        .counter_val(U4_Peripheral_in),
        .counter_ch(U7_counter_set),
        // Output
        .counter0_OUT(U10_counter0_OUT),
        .counter1_OUT(U10_counter1_OUT),
        .counter2_OUT(U10_counter2_OUT),
        .counter_out(U10_counter_out)
    );

    VGA U11 (
        // Input
        .clk_25m(U8_clkdiv[1]),
        .clk_100m(I_clk_100mhz),
        .rst(U9_rst),
        .pc(U1_PC_out),
        .inst(U2_spo),
        .alu_res(U1_Addr_out),
        .mem_wen(U1_MemRW),
        .dmem_o_data(U3_douta),
        .dmem_i_data(U4_ram_data_in),
        .dmem_addr(U1_Addr_out),
        // Output
        .hs(O_HSYNC),
        .vs(O_VSYNC),
        .vga_r(O_Red),
        .vga_g(O_Green),
        .vga_b(O_Blue)
    );
endmodule