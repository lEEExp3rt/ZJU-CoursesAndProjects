vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xlslice_v1_0_2
vlib questa_lib/msim/xlconcat_v2_1_4
vlib questa_lib/msim/xlconstant_v1_1_7

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xlslice_v1_0_2 questa_lib/msim/xlslice_v1_0_2
vmap xlconcat_v2_1_4 questa_lib/msim/xlconcat_v2_1_4
vmap xlconstant_v1_1_7 questa_lib/msim/xlconstant_v1_1_7

vlog -work xil_defaultlib  -incr -mfcu  \
"../../../../ALU.gen/sources_1/bd/ALU/sim/ALU.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/f261/or_bit_32.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_or_bit_32_0_0_1/sim/ALU_or_bit_32_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/8893/MUX8T1_32.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_MUX8T1_32_0_0_1/sim/ALU_MUX8T1_32_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/2f3b/and32.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_and32_0_0_1/sim/ALU_and32_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/326e/or32.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_or32_0_0_1/sim/ALU_or32_0_0.v" \

vlog -work xlslice_v1_0_2  -incr -mfcu  \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/11d0/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_xlslice_0_0_1/sim/ALU_xlslice_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/21e4/xor32.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_xor32_0_0_1/sim/ALU_xor32_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/6e8d/nor32.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_nor32_0_0_1/sim/ALU_nor32_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/bef6/srl32.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_srl32_0_0_1/sim/ALU_srl32_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/69d3/addc_32.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_addc_32_0_0_1/sim/ALU_addc_32_0_0.v" \

vlog -work xlconcat_v2_1_4  -incr -mfcu  \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_xlconcat_0_0_1/sim/ALU_xlconcat_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/d8f1/SignalExt_32.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_SignalExt_32_0_0_1/sim/ALU_SignalExt_32_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_xor32_1_0_1/sim/ALU_xor32_1_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_xlslice_1_0_1/sim/ALU_xlslice_1_0.v" \

vlog -work xlconstant_v1_1_7  -incr -mfcu  \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/b0f2/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_xlconstant_0_0_1/sim/ALU_xlconstant_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_xlslice_2_0/sim/ALU_xlslice_2_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

