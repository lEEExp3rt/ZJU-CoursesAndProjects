// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Fri Mar  1 12:50:34 2024
// Host        : LAPTOP-SDV26TG8 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/lqy/Desktop/RAM_B_IP_Core/RAM_B_IP_Core.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.632725 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_6 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
aMT3usC6uizzcwnzOCX4OsS16Ob+YxFcsGovFpFklbnaIaD1S0lVdxenTwHPp6ByIEi+ehwr6Rgg
z/3AlTheI5NFTM8ihiMA18/wmUxI7EbaftJACA1LykUKCuj5myy0T+DACuv3sGYIZS38TZTZnnBC
FGAlvTZmRWs+JzneH3o=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lR9ZerhYSAb39nzEkeYvhnwEs5t9y/+yTDf8KuoUtR1BGeHZq8pA/YxtjzQLtaOW1R1IQUb0FtSI
e3CYAb7WHYbIjcpw3vKHvW1SqcGn9CMGa556CYKmD2oF12Kow8xRaFvMSBUVxX7HsHxNWnRd+PU1
+C0YayU2KFIY/7Yl6cZ5luAzhw/6SW3PFYUIyyqWy5MCIXweHOwQR2IpQEdlDur5nluN7i7BeB+i
fxwwHh8TU/g7T4mhZFkiTuBKdLAtQOjxWxzqTMxgcuAjlTylY16FgMFOASdvvSbqBZJjbxMdVloU
rYjS8O/8rWktv8GXcaIdBJ2BRj01q7jsChsbwA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Qvl63GHz9mq2xOB7elt/vAQ7URLGdD1Lkcz7f3Wtw31dwjjjbP62Ny/Jr6OmBIheWlgejx38qxAT
TrHiiEyjKmGcnPn1Tn2n+cH4RAxCbOFnCI9n6+YsYMTe9JkplGhGGr39SkFgJz0I2IKpPsuqTjCj
rhf49TAryNMQeRpREJA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MA+9Ro+dh339m0iZrkKbqTKN8gQ5xkxN/SPCfhkOn+5jjgCTS5IOKLHil+HsZDjX333ebxnornwG
MOBxyEdFfLM8SA+bs2r41J/j0af2VVMmCM3hOh8JmZxB4X9Jg/glegNCbvwzqxMbOQNEy+zt7j5t
TFVD82RtPFmYVVYZZyll/WvAA+0aVpyjzLCIM1GznFky0RWLv65Wp4MJJnNRRrtG3muMznVO/u2s
tACsJ9jzv9M0IlMYjYH9BixhG6cZX02I4LEXXaPkhdOINlMMhsbArXtc9NphzmS4bY1/1yF1D6YD
EKLyS2Sr3HDl0O/lefN+jvfG8iKuVl55PNNrVQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
wpMTg7STjFkUDhOqdNPa0FHXTnHQgKmhvqDv+rRVBvMiQ8O7u8oj7ibITq3o+jugJsMJ60B410gQ
JFTcqCJKYmYJvqi8rPLLOYDmFG6ZLP/Ixr3n62IyIaCeDltBahi3yV009QN0X+iuzuFCL+Y7g9ff
IvAgyBly+Z3Itv2H9EJMZPMl17Sa7IkgjmWqzVXIKNMKn0iDVYsQw6ZgzQDYQ8N8IvTIEggU3/lh
6Nf0hV0ev3qOv/2P+4w0U766Ux3yLuzPJSI7bKm3/ip9NjhOytxOiKKqVXhKG8dzbbuS5u3EE/eq
q6YxkL7gpvNltVqqBnJB6vHSyWrD6+MqsCtR9A==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Q7Q4SSp70lxFryaopuic9VVP/Ire0pSsPEIMYdURBAczC7ShkuYeV02U7L3BlAiyBE4vBKcwYSQd
cWiaj8sVP7q4kxoRHKxLV1R5PIO6l4DsLWE2E+1MLyUPME0w5KTular/oX8EPCJ5n/8VCtW7x4Vf
dpeyki1/IAPJkAyi3zVZKHzgKhEwnZaZZtZYuMWoPZMt4V38sAcE42Raf+7yfFWG5HO74JY6iEnW
gJeRk58K+avB/XLF2/j2RQZfjTYizrprT2tUMBK6e7DRWZZtk8AOcsMhUikev44IFGNbNXjP8BXC
0J3y3P7pCFT6l+saU83nRwi/H25fSA34diJtNw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
a/8ooC+s+6nfvfa1+oBhsvYWLJjFgp83DI1kNyOi5Am+ugPbGRmgGZudfyo6yw6Yd5gGbLm5aToQ
5G4cGF5HaXD5TU6A0ZZFMTIbzFLE76JMjjIxX8JcaJIZpSmrXqlru8l5gDINUEAmwUY3mRQnjcGJ
0Z+kMRH8iAEF+gEviPiFZSBbJeOPqivIS217kimQJX3BeNbNPQTP+GUidcRywpGMh5avxtA0kDRO
F9SoCSyTm9hr2v9hsK1IUAYQLb7n2/R+z5YNKNzt1oN4qgJH1wZfdI8if2K8+ohyOdnxrrgJOWdj
cOqr7cGqEOYfBMTIQeHVZzb7NGWVN+9B8XSUaQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
FLPvOUNRWNW2GU+FEGmt2XWthOT5bY/31DRbol2cUmEGNF6b2XzpCosNKGx/o2n6sQvGP39KRFCs
nJu0ihe2dUGee9nEZZUcpwPjnEfXVI3yJaRVYy8iL+rm59lXq0jX4sjAPieDvv8shgAnoXLTZGlq
K+2c1JhaHt+nFi27TDrYar/+P8nP1MhocOS7BjzCvSs0foEXj92/qD+71Sm/LqGr8cjlH2qTJJ8B
ynxoH6iT+bksVA2VbtPT9o6h1kJ/zwP4wcsL9l+qSlJhd4GI11JPux26DlNyIi41WmufQcfiT0PB
r6O9+0E9lV9ODwKdjaxfZRK29rjKeq2yr0jWhMV38XKKqHAJli7MIypGRXcCo+u89H87KgYt+ebw
s3foIqCe0JKR57WzI8VD6XdNtOL8eBxK539oemx4vkE0cGYECZKYru6A2hPeZOYDD5eyWSUlQl1R
EciK49WM8HnssyRVcmE6di6bISMbVi0TZG/v98bz+9UZa8DtqMVYH0tz

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fphquQOeFuqByo36Gh2C1zEC1J6u9swSMbMzsKldIvLm+SZ6/hr/N8KJ/G2vBABzX6UtbVuP1ZXx
AxdftP4Aqis1B3Bs6989aQG9eo0SOHA7r6aFLtFb3qoD5Pvqw4aVNU4z4EtTpFpn/jCWD21lKROf
q5X32HRfFq1jwqod+9vIbUNRRzz5y9VHvXfacZlxDazSPmcCF4hxB1KqWqT44KmYVkDedgkgnYgb
ZGidHnTb3W7C8tSqC9ac4kNJCL429QndtddweESJNlpX+65pt9Irok9pkOodwoj0QScswOIFjhBZ
/GrzZLQcFWiD3gXRU4DazzxQnGdRH4qEIRWziw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
1lUYYHPCt1BUJOvcBbgMU2GSQiqfxItz4ntieMaenjrtsE9SLwaU6xB0tBl8Atw5yP/RRNww1kX/
9uZbTz5He3r9mPVt+mGxB4N3f9BbCrQRb4USVPgKO/+vWUfMQERGklScy0+fz75WuxH74CjRUoDI
8iyssb2cUNnfDe13jIoI8gM1w4w/Pkxkmb6Mef53QMxacHAWEZeytcH3fuL/adO263D8P90U3XJv
vBXJmbjkRVi9qzjBzfMxuOy2KbZaZgR3BLzaffIfFnMwg/Rb8sGls5pQsZv5jL2wk3+Bj3OXBYdd
pDyjGoalJBzObKzd/t15kNHwY4FXYFcZLQPncw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YRmSEzaa2WFVvMH1BwWc1TIUpVbzSEIP0VbI6n0sEgct/X4PiTfMQmK1jBVCaISIzwBxscKQwZOt
mb/nmINGg6I7ih39LSbBMtx6cdCUiyaLkPeRbqfyPpKhvnUIFmdKVvTd1dYzxeOeuDnhSVaBaAcN
3lngSg7lIbmhLIGjC29yQrBTiLArbVZi6IRGronMK51e3UrYa6GspsznhiuRcXjEb4bHKrJ2CM5Z
BUwA+E9949sQgyOagFZbLVle2ESbwBaoxcAPn2gxfRHlT0leqyLgUGDZLsfArzGzw9BTGzyEG2TR
XOrKFNYRfMXMrnGsBM7acIelY4LdAMgsKgDH/A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27664)
`pragma protect data_block
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
K5y/TOHpNUqtokRDvwbV8PuROg==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
