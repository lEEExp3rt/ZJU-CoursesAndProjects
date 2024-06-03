// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Fri Mar  1 11:03:42 2024
// Host        : LAPTOP-SDV26TG8 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/lqy/Desktop/ROM_IP_Core/ROM_IP_Core.gen/sources_1/ip/ROM_D/ROM_D_sim_netlist.v
// Design      : ROM_D
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ROM_D,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module ROM_D
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
  ROM_D_dist_mem_gen_v8_0_13 U0
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
73DH5UzcBxcDl1WH1fwoDOsybRmFfrLq+uKda7Km1HFgbpqec+Wv3dmwLTtzz/NUwoC++IxtGqf/
tflIm0+Akq5G+N+kBSd9KsVMzKh6AGO8lc+wQbu2jops790nBTd11zqy7caE48bwD0BSOvJeJvgM
aa6O534ZuEyfxZjpuPq9Hmyxrt68RbYqfs7tHGB6if6bakOybF64+TxA/qMJGQgljudF8yhh8+uF
PSMU5IV6aKSKRqdrJI4tuQXaaalIxihoS8sw8hqAjb+F2UpGbouxDVy/K6E6NbKsFtu9GXmkCsSW
gn1xZ6g0IyeMZgLcUe1kexZrONvkQWclqy3drz7DaOc9PAbHvTsYSeCJ3UeGj0lwS69qVNbI46Ph
57yV4e8D+XA25b69tuwozpyY7xk2NLSEmO4vCz72DCiHBcybElRSExvzULsD0zj3sVfjVJZXbLSo
CiIZfDx7m+A6yVO65KKoSh2LKdMVxCc7/gNnO/PVlB4YpqCuukffCSdNE/dLF/D8YWRk1gyKdfJS
IzuqnDaiIbpJBSkOWqdnpYReFrciClLQo8Ame2cQPMT1/spqiXNqqBho/sIOGO1f6NzRL9odvJjb
mAOzklA3M8wiLBMFN2vpTqSfbHL6Lb4SkgQ6mB7giNZhgptibv3VxUU6uFcHwndwgAf4ExglhyXS
Xc/8p1yrn147SlPBd3kk1KfZSAW7eJhTcm2cvnhQ+dxxyecnJihTWH+sZa848+EdPesDY5My1zr9
XiNFpu6576WvdqH3ZzXgjNOkOzS5chxNg+3JfPQIu+8xdytZ5uLBmaHQfg/bUH0JL0uhLRCpU/S2
UDPMzRHnmbqaKTC4TZhZkUawOZ2tyIbCYgKE0hHy/mxZsAUGe0hNygP//zO4vIc3+erz/Vp2sO41
fzxmj1LAbf4JuLKg3N67C5kdiayoUqpZKxx3iXuNgkUzXLOtar+NgN7KKqE1RzZXM1ksG3PSTUOR
00vhKNG3bFyXRpq6LLrEP9F9h6kzKCymFKfPyEulsngV6TXwNwEw+60apIYpRAAqQXvvhRrS3x+X
W5/cHUD7zGxdfJEtp76D2BcedqUsl8XUpvBmvY90QLMWlEYKGbn21RNdnuYZF1pfyWQpTM/6V4nA
H7RzOCFbMOEKwZS/C+2sJjyd3+xWdqoBKk/TqHGEZLRIwJp0yJ3QH8cEhmKlGStPfk1IAv35R5/k
Kv2tB7BQu8lA6iX4WXCVFDc+DhYWkC9SXRzB0fp+YBRg5CpT3LalkPZAwew4nWME9WSeT+1Xk0hG
lN5WnEeKsBVcL5Brqx8yRIqWe6S67yqwnYabSBZfEh8zrqOiVhc3pLXcDNOIJmHUc/Uac3L5du4c
UE7db/oPSwvI47I2tQCl0l4/CLg3voPkVQ0o6YvQ0FfqENbEh92uJ8oUlljO2mlqFxysE1ltpzNK
7ma66PSdcWBjPByohOUNgqsTJ2k4LXmNqBsW3JJcJarg6xhV7xHngQfCSaf+TGHjo/xWn0b24/Dj
N6YxdxX8cT+B4nNBZILNt52GxJ0ZAPYPnJkAaDJrt2EcyUAKXedd+zb3nIy0Ger1NZa6TS91Cv4m
tlbTQ6MYn7SJXXx9Fc2LZpeiUOni03/L7sE8fcYUnNYfx3ohCQWLJsOzA5EGVD/rocmSrWECHqY9
ia9E3GcLFqhXjYTCpcdIk154IMl7rBMrF/AA/RXrGGoo6eVCKv++vC3XTciwAX+y+DEVuREN1DDO
xkP1lm0dLhBAQ7ERM9kSt9YFjOSgGe152tMq/HNqT7wo7eOVn2ekBKXARveAkGA0MMowmm9sTJRs
nY/sJqu4bJuCzNwEYNY1282+/K9vXiTtvNg6fwverf9Q27OYZpct/7FoYQlPDt0rY/v3kKOiP6OT
iV2LZ/lsPxd2Kzh9xgevZAcwIA3+VmdTNuBo3JKwLPCWiDb75+gPegIeR6oeU/d/hZ0pETHoDELi
HuxCYFALk1U0/xhVFeL1aHME5i1clR11uMsCNgrZ36JAMYq5kx+uQ7rFRQpr6FuonVlBmhCzn4RM
8yvRYd2hv0zqVHCLzjT8wgtgGC/ZA6WA88Wj2q8hzCegJH+OWzaXtWzHNS2NS5O5lDWMn8SBCav8
MK/EnW5+elgvsuOxZU3ag7KXHSHxK7aiLJ9WJQGnxq27crQm6bbpr0Pa8Fu5eUONUeY6XWyM35+x
VHLLVDATfJjQRi+0fXFV6ISCezJUN5MkQU4W550BZ/xQZHMPS7iDc1r4VH901ls+Eg7Cc9FGSwk4
9vr6ied7bpZHTEjNp+8XEJeBZvseh2BKzRm5XsAaxNKt9LwJK6xTffnFTwp4/hf9lpmMRfzWIddZ
oCsPQbuUl2vxk9YkSJuoUHyraM/yB8y8b7vRDpyQ+sEk6xLm6O11BX9tJwhvUMnEKKblLcnnOKMs
shrXzu1UgXyOFZMOBtP9COohxA4v5nvd6jKXDDMMh8jAfAoOVNKtnkidSSlHpnNVfPFsJcvcmy5H
iVxAjk+VvcCnPD+vqfE5FAWinrSRH0HIs0alw0Etco0/CzNMs+yygynFfqVRXe7D3Z5vOVBNl/9P
0K/AuTjmipGZFPwVOBFeYcukW9t6umD1IqwRfk6moUCxCJS5ibXvbjiddpQL2zewwudKga5vNpjd
xKbqaoUJJybinRSjydwaeGNuy6/9eWsWskuLK3zyCMjZhYwjXzBJ15P4QHeqqNgbtIvKYXy6Z27r
7AIdr7ONGemb35BsMji23xQEXp6lzFrPn9d9wFa5L+PT8b4VOS5dvJkLKEy5TmSi6Lr6WTjv6CqW
MXSfeWf/CqCha5JKvoyEyLbvG3gpDqQetV4m0Bv8G+BvR5fwTmsyac3JFioQZJd8+MoidMYPz0oy
lBrwO+gCCizAdAM0xdXL3989R9FUmFMd7cs607wRihNOzmSwoWKnHo/8YChQyVfBEjIt7qkQp1Tj
UG24KI0MqsDaXPF+8234263+P8k044fG5GbHSiTqMR1wTWxo/lx8pCYcKqXZQ6uDH+O+smYOGG/s
uw/NiArAtxNWxhr3wqw1lAEQJ/xq/qfPLgMglYfpL5xbRAUmS5p0/2ChEBAQCxIYDyS9zgaLWqXE
o1dMaM70Vesu/Yp/OIdZyvRlGJQTw4oQe+bKEB3QoaNlQzDQwCN8YTHX6QHDeNeTcIodiPWLmpTh
g3SwuQDCJXpyAUFxKBV0rZbYJRiMoYprohlL+Xb0uzRdp6zB3cy2kvyMOcP5AIpPr/q9uuslfEZJ
8J6h1czezzZORDtuHYI5m0NA3LBs+94CxpLob6UphzHVrl8C53E8i36xmFf2gCRujc4KHCmi5Rd+
HwEsXeKrEEXgsQ/IcT+bFKnP+wy3K4MAVhljDDpSWX6410oClOW8ipBr3YMBFofG7I2eBso2f9Fe
q8j8MHtJKDBdM2iCWsI8CQtGtPf36j1M0Q2q/YIvkABYHYRDhlXyS8lUAoU0O216uYvNVScLtTyI
2rOnRUoKn7KSjH9AxTDyWgvhWKCzm6nwtQPYW6n/hjC/tiybUO7zW5Yhn8TUV9iThnPbL/oaYx8j
KyXSm//oWD9jgYZi0pAXMmcCL7dtCIWfP0oWxptf/42uu6cTS98sa3FtJcOjuk869d+W4ax+J6ZV
hCeZSX90/wocw1ykc6i2vLQbUuNJgU8TgREsVXt7wl4ZOnkNZEXILugfQ96puN7Rfyh5/z5YuvSd
FJrM3XuxEfrLku2DhXHFRnhRsMngk/7yY5ebeYMIoO6IA2+ShT29XDDroUNNesMtpGHafHG4968r
eSyRxVVSZHXg3T4CeTDvpdiwkKpxslb0InchMXMUOXgqhPCo0F5j548e6vwoohCA62hn1IMd0A6B
OgyB/k+lRBXUpqP1s9rpfKdctrKU17IPntpNYFYNvCs1ZhaWikKV//HiydsPPIFfEUnbARQwPBpa
i/Peoictvl8+C099OcetVU3pdfLXRo5GmfvAKfVyokMdOZpcLmV14WNU0IX1UMookYb+2gdrj0xP
dpJXb4eh86ajbcJ9s3vgZI0iZRft2hNT0zufG7ZqvRPw2YzV/axBG/Wpo+2ydLcqY4bSDKcBmCas
ydetF0Lu9ShJtRTdOSXint5GujdGyMOc4m02Sba/69ixYF2OI9iWzsFlr2HCkFtKktmyNZ+mjt1g
x71FushAgdxIF8lrLl3dRfIWIp+7+VxOLd5r5XYc9OLlRkbYb7op+7aUwiAZPtjndnNr9TsqQSQK
jWDJxOJC5f1vP0NQMKGBDgk4oAvr69USkHJgPFC530c8Zdg6GqvGOyfbzUwNJyYdDEF3AR7Jy6RM
+gQxlqnBfkezBFiQtiIZX8Nq85sW1V/B+Wyt9sfBkn1F8tFJ5qty8a0I8/eUcbItn2XdmcHVlYXc
VVDghYc6kfE4k0tAKmn4G/e22+fkv9XZ4fikUWLBLVQwU27+GN1Q/4EVwkppHbC5RvsWeJrT9eyA
I+JY8UiTXCzvJkv2R6jFknUO1J6apEFr1j1sIekJ0dleefK9AcnlW+kSO2kA+KP2L2Cov9lwwtE5
FmRVrXWhqcswyKhX1D7F5Lf9/T13U2KZ3LA5zVd52r7vnrLcliNJP2AwtAVYh3HwQHtUQd9WHXu1
n5ZIpP1SmUgT//r6FtdygFP82Sy0GwYsphGd9EdA/T6UuDlwdg49+lyV028TbbYJ+fhwGTqE97PR
56j19F99h/G19ey2O9xXh8luJYE6iAwcFyyuD0my/HOwxOgj5UUeaPS6TLvnSgs9Kh+ujkI+0vXv
DOsfg9l06xhIpvF25BFQt7WF4tWmDmeXKpYGn8nyME5dIK3uOTRcW6kwicgXrGcCTDfbFYYX2ImV
zihWFZ6p0bbUOFiUYsY8a4ND1dhH7AJ/9P8VahmAZsAXItCTTONg8frg77ST3u1OsFcmR6MLAjhw
nLgonpX+lYk6uLT1QsyRRhw2R+TMy//R7/qCyoF3QwmgFyDs5bqulcpDlemuXIXQ5emjzN0fHuNi
vSZK40yp9aqgDZfIFhoKtGsIw35+wk+6+SaLZge+vV1UbrlFq+EITmNX1TKRIFs3Xv/cY1XhXGQ9
dakHjRhmAL/qtpkcWrSGsWyWHblO7am1rqPaue7ljtsXlDdQXcX1Ww8NnGtJt1f5zGQSaS4V6bBW
Z8KaMKnwurF7/Hrt14Ldx4nSQ2OlSXYODOVuz314q5xvKELv5lWYO06Uos7imtp512DMCnFkyEUM
M1iOrDKae7CsYZWU0XJS8WUAWN+b0/ck1OLSkYAM0xkV5mX5QXqNF5kNFOQvnYkJBwaPVbx97VJl
5Bb01Le+E3Kc8vbMbvivD1X1/5eaUfUe8Vc0GELgTwKAXzYHbHJ7Q+KXBBWcHbm1IcG2WcJegHCd
Z6DIPlG+XIN+KlcsL0LgnPI0QL1P3VRYUqgtmEp17dl/Z4uXD0VbUVc9/U9miUDsle1SSqDT0JfY
ACSOkz5kq2EKRqRNNC7sQeRlvlTQsGVg30j2WlzrC8SYTbM7cqbHkh2fvAkl+WoceusOhQvKCeDc
GJtruYM78eVq5zlYmClQ/f81JiV/PUZiGhxvXRRamtRpCqpO5J9Tkx+T/feluQJJCIhl9YTJG0NT
98EODxyyqLuaxy151Uyi/sr2/PvSDNn7Qt6JOh8Fl73kqzJzYFSG26GVI3qxONNJHHqZxys/IXoX
VaW682sZPhfGo2r8cEKL1hsGfScGzWqbGAbch2sV1N1mmmzvr5M/KYJhcF1cK8DtwpbA+Fz9hLv1
a1wNTJBMwP6Ve3AakY9r5njDoQbGek5T8WjSJFAD5Z1X9qruPLDqp05O0FnZOYPCIi0k0QkhrwaQ
lDAXQ/NP4IDc8dyJgfEt2zNpN8uj6rI3xe9Wc4bftVKKby+RMJcoju7ODeOCJNyvJKuQ7cmwp0lX
RxGkCgwwAOdIg5jc2hQ3T5LItGfKH3u5S2Sd5OxvIeQRdkCsVVKUGi+gftONHlLjYeMF/pdORLf+
pk22nHK5UA8aHBsoHCA40DOyfHft8Msk8rBowyb881Ro9kM9R1F6yy5bMansycwnE87heJZjoUpa
zzRf6r6TZA4CjL3zuFPENqkOTn9rli6UbVFyOD4mMGj5lGlJxxB8SiY0u0Jykg3mzu5eVJPjnWUL
6w9c5xPT70ScvPa4nAMaSQa+izVW6e49aQuoOeZ/U58/K4FRHuLFFKdFzvJHh2HxzYLe8fvw2L5X
TqGQhVK1Q6fd3IhU6OSBK3YhBK67p/DWVxF61peYVmOYyqXzBHpj/4jsEmyt6J/dPmjzCl4xCx4u
BrvrQzc4V3eaNd4bt+EVUUDQgLsDPICpO19yFDJlHYpV1PVthKEX1/3M77yHsC4HwwhrNF4G+3qQ
m0CnS7UsI0qwsnn/4ZSTDwnQL6a71AephZQrdzwIorfnrovXmNl6xg+20lEiLUnxSd6pD+EpsBXe
TAvQt30laoi6MMnM0BUknbsz5e6K1epEn1zf2htfA6hTaAzMsNkE7fiZGP7QszY48OcB8ZI2dv1H
4F2nv6prvQqCLf4HBI68nAHVJRdY7YeXw9+yE1qlDMXiEHYf7YoR7AgkSpQ8r6qoNAMDNfoM9E1B
XyADGY/FNVj+9mZQ8EtJnHI8HXZShGJsT9w+q0lK6rRdTWH+S1F3jC8dDrDEVmZxrrlLuGs530yp
q/uN+EfA2SRAZxqhBiME6pw7PJmV8N8BLdgBv+Ri4cmPqZIkbUwx7CB889OilCDIGSCXtQN1wjqg
mCh9Ipt8/+nE8jzusUYMV6UtRg7PQyVgRmFyGH3CZzXUzXXiDlXctv15albGIMAZVl9yCvGgHg5o
Hazrnksx9BYJ5JFpQ1ObElTVXIM7vDAHuZH9ls37ZjfcwuhIj+lTx5ZiWYzJm+W1kt5HD68TZMG4
apuoMrFI2USMQE1O6jMq1msKFXHKrUNasxojDsdiseyV8JB0uvxZtL/zYD/Rc6Ti10XHBBO90O9L
JL/XL5cl2LZbLvhgICeIrmMmsrlwQOuUIMVbLEJ/jJsE82mKcSHgANqXmjcM9b3wHMth/Q6+vg4X
Bx8I804tu5mv/nbaUYEZGgebRMz6n9ai3zLdppFqGwjfgbD2Z1BYvyX1Jvm1ubMbpFYRA2c4y36i
Ukgo0rQM1alMCH0yacvBvriF6KMfFgPVkF7LoV1pKHQkShl2+NDQQOTfCdipReaJMfgPG7O7nw9y
L/cIrMnHSlu9evXpiGxoDqpv7pRlUvBR1iGlOKkjDaIqUQLcLTCYPT8TwfrBpfACyMV5+CGJx+2J
dMd25FTPR3cz7rOfkMRaCRtXmMSv+i+EvZVRtoHgHhwrhdke/MbCBZP9F7PFDjyJenfwT/X3jpNY
ivPP1crAo3YmQgTQ8QBhU5R1EnfkkSNbkJtNlTqENOIO347q2HpW4B2xhB5g1WQd1mTBlugapBSh
y7L2vrJP2CcyZ2cS5iPwFbkS5MUcYOBr12jF8iQbDiPTc4JZ/KMt0lzxAzxlj38eBYVSlFWFsI2v
Q/fxfCSYLCvV1qLoR35k8ZENCHNA33tRom0OmoEHFmMVp1waYVOWFfXxy+t+XEt2aLgu73egP8Kl
Z7TVJUbh70yW9GGWAx24gWnybVUdzC95jKry5I0v2CkhhhS+7bKYnur8oPm9Qb8mM0qak7sJO6xE
tFIS8hG6Vzw9hERjAhJoZQCY/6b6tbtmni7xQwub3daZyHugBHTjvTBU10EnWADy1/2717oDI6/+
UyaAs25wVtf1SQ0GzURWK2cwqMTZowRgmygYh3pPgrj+F+L38FLI0H40T19FCEXZlp2QHwLd3hRm
COHtzE/Rr+7qefutFa/bIiU+jxBaNWTtAl1pIpwrUUkM4mycJBFS5eHyef3hSjCmXY2vO6UtCmYq
ItVjac+diFEorUMlEYqasqKfYyOfW+GJzkEjCEKHU1d+eRiBY7d5VJ0ng+syxdHxFxRpfAQvJmlL
yMwEttVWJTh3VjBhCpe2OJjYISRQuw3c6SdSsh8O0ESbDupuofn0CGhTTRK5xxQ=
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
