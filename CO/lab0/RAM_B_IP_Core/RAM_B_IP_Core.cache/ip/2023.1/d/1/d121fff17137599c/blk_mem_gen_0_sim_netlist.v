// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Fri Mar  1 12:50:33 2024
// Host        : LAPTOP-SDV26TG8 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_6 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27696)
`pragma protect data_block
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
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
