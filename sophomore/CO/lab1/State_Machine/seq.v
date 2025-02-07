`timescale 1ns / 1ps

module seq(
    clk,
	reset,
	in,
	out
);
 
    input clk;
    input reset;
    input in;
    output wire out;

    //define state
    parameter [2:0]
        S0 = 3'b000,
        S1 = 3'b001,
        S2 = 3'b010,
        S3 = 3'b011,
        S4 = 3'b100,
        S5 = 3'b101,
        S6 = 3'b110,
        S7 = 3'b111;
 
    //internal variable
    reg [2:0] current_state;
    reg [2:0] next_state;
 
    //first segment:state transfer
    always @ (posedge clk or negedge reset)
        begin
            if (!reset)
                current_state <= S0;
            else
                current_state <= next_state;
        end
    
    //second segment:transfer condition
    always @ (current_state or in)
        begin
            case(current_state)
                S0: begin
                    if (!in) next_state = S0;
                    else next_state = S1;
                end
                S1: begin
                    if (!in) next_state = S0;
                    else next_state = S2;
                end
                S2: begin
                    if (!in) next_state = S0;
                    else next_state = S3;
                end
                S3: begin
                    if (!in) next_state = S4;
                    else next_state = S3;
                end
                S4: begin
                    if (!in) next_state = S5;
                    else next_state = S1;
                end
                S5: begin
                    if (!in) next_state = S0;
                    else next_state = S6;
                end
                S6: begin
                    if (!in) next_state = S7;
                    else next_state = S2;
                end
                S7: begin
                    if (!in) next_state = S0;
                    else next_state = S1;
                end
                default: next_state = S0;
            endcase
        end
                    
    //three segment: state output
    //moore type fsm
    assign out = (current_state == S7) ? 1 : 0;
 
endmodule