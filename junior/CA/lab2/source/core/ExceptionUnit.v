`timescale 1ns / 1ps

module ExceptionUnit(
    input clk, rst,
    input csr_rw_in,
    input[1:0] csr_wsc_mode_in,
    input csr_w_imm_mux,
    input[11:0] csr_rw_addr_in,
    input[31:0] csr_w_data_reg,
    input[4:0] csr_w_data_imm,
    output[31:0] csr_r_data_out,

    input interrupt,
    input illegal_inst,
    input l_access_fault,
    input s_access_fault,
    input ecall_m,

    input mret,

    input [31:0] eaddr, // Access fault address.
    input [31:0] einst, // Illegal instruction.

    input[31:0] epc_cur,
    input[31:0] epc_next,
    output[31:0] PC_redirect,
    output redirect_mux,

    output reg_FD_flush, reg_DE_flush, reg_EM_flush, reg_MW_flush, 
    output RegWrite_cancel,
    output MemWrite_cancel
);

    reg[11:0] csr_raddr, csr_waddr;
    reg[31:0] csr_wdata;
    reg csr_w;
    reg[1:0] csr_wsc;

    wire[31:0] mstatus;

    reg [2:0] state = 3'd0;

    reg[31:0] EPC; // exception pc == ecp_cur
    
    reg [1:0] thisType = 2'd0;
    wire [1:0] exceptionType;

    parameter MSTATUS = 12'h300;
    parameter MTVEC   = 12'h305;
    parameter MEPC    = 12'h341;
    parameter MCAUSE  = 12'h342;
    parameter MTVAL   = 12'h343;
    parameter MIP     = 12'h344;

    parameter illegalInstructionType = 2'd0;
    parameter ecallType = 2'd1;
    parameter interruptType = 2'd2;
    parameter mretType = 2'd3;
    assign exceptionType =  (illegalInstructionType & {2{illegal_inst | l_access_fault | s_access_fault}}) |
                            (ecallType & {2{ecall_m}}) | 
                            (interruptType & {2{interrupt & mstatus[3]}}) | 
                            (mretType & {2{mret}}); 

    wire handleTrap;
    assign handleTrap = illegal_inst | l_access_fault | s_access_fault |
                        ecall_m | interrupt & mstatus[3] | mret | (state != 3'd0);

    // Flush registers.
    assign reg_FD_flush = (state == 3'd1) || (state == 3'd7);
    assign reg_DE_flush = (state == 3'd1) || (state == 3'd7);
    assign reg_EM_flush = (state == 3'd1) || (state == 3'd7);
    assign reg_MW_flush = (state == 3'd1) || (state == 3'd7);
    assign RegWrite_cancel = (state == 3'd1) || (state == 3'd7);
    assign MemWrite_cancel = 0;
    
    assign PC_redirect = csr_r_data_out;
    assign redirect_mux = (state == 3'd1) || (state == 3'd7);

    reg[31:0] reg_epc_cur;
    reg[31:0] reg_epc_next;

    reg [31:0] mtval;

    // State transition logic.
    always @(posedge handleTrap or posedge clk or posedge rst) begin
        if (rst) begin
            state <= 3'd0;
        end
        else if (state == 3'd0 & handleTrap) begin 
            if(exceptionType != interruptType) begin
                state <= 3'd1;
            end
            else begin
                state <= 3'd7;
                reg_epc_cur <= epc_cur;
                reg_epc_next <= epc_next;         
            end
            thisType <= exceptionType;
            if (l_access_fault | s_access_fault) begin
                mtval <= eaddr;
            end else if (illegal_inst) begin
                mtval <= einst;
            end
            EPC <= epc_cur;
        end else if(state == 3'd7) begin
            state <= 3'd1;
        end else if (state == 3'd1) begin 
            state <= 3'd2;
        end else if (state == 3'd2) begin 
            state <= 3'd3;
        end else if (state == 3'd3) begin 
            state <= 3'd4;
        end else if (state == 3'd4) begin 
            state <= 3'd0;
        end
        /*
        else if (state == 3'd5) begin 
            state <= 3'd0;
        end
        */
    end

    reg [31:0] cause = 0;
    reg [31:0] mip = 0;
    // CSR operations.
    always @(negedge clk) begin
        if (rst) begin
            csr_w <= 0;
        end
        case (state)
            3'd0: begin // CSR instruction.
                csr_w     <= csr_rw_in;
                csr_raddr <= csr_rw_addr_in;
                csr_waddr <= csr_rw_addr_in;
                csr_wsc   <= csr_wsc_mode_in;
                csr_wdata <= csr_w_imm_mux ? {27'b0, csr_w_data_imm} : csr_w_data_reg;
            end
            3'd1: begin
                csr_w <= thisType != 2'd3;
                csr_raddr <= thisType == mretType ? MEPC : MTVEC;
                csr_waddr <= MEPC;
                csr_wdata <= thisType == interruptType? reg_epc_next:epc_cur;
                csr_wsc   <= 2'b01;
                cause <=  ecall_m ? 32'hb : (l_access_fault ? 32'h5 : 
                            (s_access_fault ? 32'h7 : (illegal_inst ? 32'h2 : 32'hb)));
                mip <= {29'b0, interrupt, 1'b0, ecall_m};
            end
            3'd2: begin
                csr_w <= thisType != 2'd3;
                csr_waddr <= MCAUSE;
                csr_wdata <= cause;
                csr_wsc   <= 2'b01;
            end
            3'd3: begin
                csr_w     <= 1;
                csr_waddr <= MTVAL;
                csr_wdata <= mtval;
                csr_wsc <= 2'b01;
            end
            3'd4: begin
                csr_w     <= 1;
                csr_waddr <= MSTATUS;
                csr_wdata <= thisType == mretType ? 
                            {mstatus[31:8], 1'b0, mstatus[6:4], mstatus[7], mstatus[2:0]}: 
                            {mstatus[31:8], mstatus[3], mstatus[6:4], 1'b0, mstatus[2:0]};
            end
            /*
            3'd4: begin
                csr_w     <= 1;
                csr_waddr <= MIP;
                csr_wdata <= mip;
                csr_wsc   <= 2'b01;
            end
            */
        endcase
    end

    CSRRegs csr(.clk(clk),.rst(rst),.csr_w(csr_w),.raddr(csr_raddr),.waddr(csr_waddr),
        .wdata(csr_wdata),.rdata(csr_r_data_out),.mstatus(mstatus),.csr_wsc_mode(csr_wsc));

endmodule