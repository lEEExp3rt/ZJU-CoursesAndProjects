// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Fri Mar  1 11:03:41 2024
// Host        : LAPTOP-SDV26TG8 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ROM_D_sim_netlist.v
// Design      : ROM_D
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ROM_D,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (a,
    spo);
  input [5:0]a;
  output [15:0]spo;

  wire [5:0]a;
  wire [15:0]spo;
  wire [15:0]NLW_U0_dpo_UNCONNECTED;
  wire [15:0]NLW_U0_qdpo_UNCONNECTED;
  wire [15:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "artix7" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_I_CE = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_PIPELINE_STAGES = "0" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_QUALIFY_WE = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "6" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "64" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_clk = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "ROM_D.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "16" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 U0
       (.a(a),
        .clk(1'b0),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dpo(NLW_U0_dpo_UNCONNECTED[15:0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[15:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[15:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(spo),
        .we(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
bEktTo8XfP53J4LC9J1bzNOsr+DeYSQtsSeSeRwv1ROtu7MJT7BubpFM5B3JNITvmmXMIQ7cHCcM
BFy5Vu0fdwcQmgznzr1F4XAF5OH/PlBVKmCiA5IZpd+UQUMuy8l823afh4u8+Fg3bwZX7B36A3bn
Zez9yHjSKD7JGdQ9zA8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vAZQ8ZTe/MermX+omywGuwEzd7SLijiaDbuX0B9K4vjWUXvRoI6Em0qizreOX/qdo4JlybEpt70i
jJhVvWv69a9yKb8TMuvLagWbQydSwTJKTY6VSR/CtA2Uive8NvQyiQKFXLjR8k8OBlgOYmyzZEEM
vYgZLdnM3d2xSMMmeGF+dNh8tCJpM10LRaCrnj5w8L73RtOImlhI/zlR8cC5oo1TbyRV+JuHvvMZ
sYS3+4qn/f80Ugvao3cYMW0LtoTftK9oYpzhiyqg6hnJnbGsAENom2wqBpcRJf1vsI98WiJqDCuh
LIdMFI+M5KuqToM8D+FTQUOT2NniYpTmj5qTFg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VpwnevLJi/mNDesLbbdRntRX/1KkSUuxvcBO6/opCSkxKA2w7s8Eyh+CvZJvHhBMtWZquJPlWZsE
d3toYaeyczcrzAzfKryx5nnTvscAyYnKl8QyY0fWsE1UqWjg6tazMCtzxlfF3HfKx/GSm3D/0NEz
xzyxLBgRosbKCX4YRV0=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MhGbYf5xy0E517prDNoCHbf/sVQ5JHlfzlh1Fz+rfDm8S3/Zt1g/AR2QuQPNwJUQO22hvTTB491a
xRG5ct3upD6ZdXgMesPA9KgwjRjoBp/uriYuT6Sb/yE2jugYl2qBGpqxN9n2OgAVfK3o9XZ/aIcR
St2PwrmKRzU/ZoYenWUMZ6ZRsVNlzFCEBcKop6f5TBy0bWAeebXRZ0Mot23DVX4pqVyFaQoXdmkm
56Vr2jGszkLic4M0JoKahUlQpnrZuHIWgFVd/RzXXP9HwYBRQTxaKnNX6eWTdksVvzAImMYoPa4G
PJJFf+gsNAKp5BIFXjwHfNC+Nerc6XzDmxe+pw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jfnJJlFHpbB8S3PjID3rEIRi4fzY1WUZaITx6CJ38mSZfYSA13DJislb1OQ17w4Hnv5eGM/0GVgA
2jPR4wYaMzC8v3iDfETrH4kyrFglo3a/NDlACuR1U65YoHUnUu0UmMMovxQEnd9ByAfOtabZPL4j
FTvCoVMpwI8rdT4YJQ5pYXryESdM3NUe29p9OWbY1EalisEVViKuSwS4LzwtaOmrPecCE56FGEp+
2iyBMICOFF2PpT8Bqp39Z2rx4xyIiudZKo3LNimTm/UYBCnPAJ7XBIS+JiCIOkHsPER+wNivbtUb
J02F8ZLbEtS0qmUdYDXO4qqhc1njU9O6Uk9yNA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
uOK6pXmc+RsarhB5GcgUPkseiDLhaN7KZ4C18Aqea9NqSbvIERAENTml4U58cVlx6j599K+L2aW5
rVMZLtj8UE4yfEDhtivrSdBYh446mqbnToHhH5r4BmzYnr6BUuXVZ4NIUU29WnaJUZxwrvZeCln4
GQCdP1kUA1Ozy9B47ndTYgOzCcZSr9w36W7ZA1gm34lqVpXYuGsaRTvk1DhS96aFGCeiCTbs5HM3
e0JPkZ7YUsMgWuRzE+jHE1TEMVjbPkpPjFGCYOEeDf2bc/2s2fPLA3bxMs61xUFH5LAd7Qrs9D2v
Mx+Vcfvo7kmp3J5LW99NXfA9OvG1JgjJ7ykhmw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
OS52LCfxYaApFxxvQUqjJD8DSzwhbsM5irqCX6E4R0iBINlXI3QVmtLKp8vhPICYZWjEuTIVzohU
28vwAOP2ECPWOkJjN+ny9RQeAKmQhPbxHYOysXg4IgtMbK+ZODUoMyLIsJzz2yIFl5qvQeLBnc44
NvqDk7nFLhtrN9De4XV14FKtDvQG0BdWr2mXiS7WiEAQxiww87A0M8yP82JlG6ykYSwQh5G8K6pv
YHoqI8mKAC+KGuDltBnyBrKGip5pRq7Kf+0okVAOwt0lJwDvS0JMNEUg1HK/mEIR6TKUdd8B/fms
4qcaCBYsptjoZVCq4ygSG56x8uaQXMVsEALe2w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
Aew/RSoMZUIh8oIZPhChM37w+R5unp+7pprfqezjGFUVX16UeT1spPFU1DaqTQvQkXhBe4/aNxvo
Y2eUJsQd8zSC9wBoevCnvwaHEv/IBc+OKmBzOPxO1hHXDVPtDZWdRCx+1y0ZYhQa+NA6jLP2zOJx
/emAZW55AWgZKKJS4QgantVgmUSyKVe/LlIVstraTkF4EzV092mOj1iPH/UqFFno9IwE1aOXuYuT
XrZU9D1dkPLBMg3CDwOi+bXRSgjvuueWT7ostJSFraLwDkurP1pYHHG4NDxYiDxMFWarWeII+T6v
hMJKd/8ZRrh5aHvGV5O/Hdc4rPitxa/cdQPAc0r2e2XWAJIdic09atzXXyU9o2vV/urpMsjSVva4
B5a/PwS16c18IMm6vAeFSLMo0T/jor1Q5SoxEC5QEkxvEfIUjjw7k0b1Crv5EfWz/sJ1LHwqlG7t
az+h03yAqvqGfOHC+7YoilYImR1NiLTCLgxnUfIvxo6woY4SgD+hLki4

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
iZJ+xdyrZbhNc8zYurF70yKiutV2IBjRXDiOZ/7w25UL6rCpY4Pd5gJN3+SNIoQ66bzRxlhaXMNu
tzoCM2kFY4N5ZbCy/S4rtBK0PUHKEVd7c5Btr5gn8BgQWiIafJ8Qa/8xqo95ocakFzN6/V+DNvyN
7FPkXDwuiaD0cmHW8XyOxnHM2b/XKHOibr7UKTRAomXyt7y80BVKpE50ddxXAxw9wlMn+gpW5Kpz
Dp8z4VH3uZrVv8Yl5RWELOQ3Uh0Xizb20mvc6Lu+BNoz0Ys9zZUaqKU71Kuv4s8vgPzrZXXNifo2
pU0aNj0oqAGlSTcTCBF8Tl6/jFvUXQEzYoIfiQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6032)
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
