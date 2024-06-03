/* File: PS2.v */
/* Description: This file helps define the PS2 input device. */
/* Engineer: 李秋宇 */
/* Cooperator: 陈逸航 */

module PS2(
    input clk,
    input rst, // Reset signal.
    input ps2_clk, // The keyboard clock input.
    input ps2_data, // The keyboard input data.
    output reg [9:0] data_out, // This vector equals to the 4 boards in the game.
    output ready
);
/* CLock */
reg ps2_clk_flag0, ps2_clk_flag1, ps2_clk_flag2;

always@(posedge clk or posedge rst)begin
    if(rst)begin // Reset.
        ps2_clk_flag0 <= 1'b0;
        ps2_clk_flag1 <= 1'b0;
        ps2_clk_flag2 <= 1'b0;
    end
    else begin
        ps2_clk_flag0 <= ps2_clk;
        ps2_clk_flag1 <= ps2_clk_flag0;
        ps2_clk_flag2 <= ps2_clk_flag1;
    end
end

wire negedge_ps2_clk = !ps2_clk_flag1 & ps2_clk_flag2;
reg negedge_ps2_clk_shift;

always@(posedge clk)begin
    negedge_ps2_clk_shift <= negedge_ps2_clk;
end
/* Input keyboard data. */
reg [3:0]num; // Data bit position.
reg [0:7]tmp_data; // Store 8-bit data from ps2_data.

/* Read data bit-by-bit. */
always@(posedge clk or posedge rst)begin
	if(rst) // Reset.
		num <= 4'd0;
	else if (num == 4'd11) // At the max position.
		num <= 4'd0;
	else if (negedge_ps2_clk) // Read bit-by-bit.
		num <= num + 1'b1;
end

always@(posedge clk or posedge rst)begin
    if(rst) // Reset.
        temp_data <= 8'd0;
    else if (negedge_ps2_clk_shift)begin // Capture keyboard data in negtive edge of the ps2_clk.
        case(num)
            4'd2 : tmp_data[0] <= ps2_data;
            4'd3 : tmp_data[1] <= ps2_data;
            4'd4 : tmp_data[2] <= ps2_data;
            4'd5 : tmp_data[3] <= ps2_data;
            4'd6 : tmp_data[4] <= ps2_data;
            4'd7 : tmp_data[5] <= ps2_data;
            4'd8 : tmp_data[6] <= ps2_data;
            4'd9 : tmp_data[7] <= ps2_data;
            default: tmp_data <= tmp_data;
        endcase
    end
    else tmp_data <= tmp_data;
end
/* Data transmission. */
reg data_break, data_done, data_expand;
reg [9:0]data;
always @(posedge clk or posedge rst) begin
    if (rst) begin // Reset.
        data_break <= 1'b0;
        data <= 10'd0;
        data_done <=1'b0;
        data_expand <=1'b0;
    end
    else if (num == 4'd11) begin // One keyboard data is already read in.
        if (num == 4'd11) begin
            data_expand <= 1'b1; // Use keyboard expansion.
        end
        else if (tmp_data == 8'hF0) begin // 'F0' at the beginning means the code is a break code so enable data_break.
            data_break <= 1'b1;
        end
        else begin // Read the data directly.
            data <= {data_expand, data_break, tmp_data};
            data_done <= 1'b1; // Keyboard data is ready for transmission.
            data_expand <= 1'b0;
            data_break <= 1'b0;
        end
    end
end
/* Output. */
assign data_out = data;
assign ready = data_done;

endmodule
