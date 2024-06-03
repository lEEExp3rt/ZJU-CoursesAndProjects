transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vmap -link {C:/Users/lqy/Desktop/ALU/ALU.cache/compile_simlib/activehdl}
vlib activehdl/xil_defaultlib
vlib activehdl/xlslice_v1_0_2
vlib activehdl/xlconcat_v2_1_4
vlib activehdl/xlconstant_v1_1_7

vlog -work xil_defaultlib  -v2k5 -l xil_defaultlib -l xlslice_v1_0_2 -l xlconcat_v2_1_4 -l xlconstant_v1_1_7 \
"../../../../ALU.gen/sources_1/bd/ALU/sim/ALU.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/f261/or_bit_32.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_or_bit_32_0_0_1/sim/ALU_or_bit_32_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/8893/MUX8T1_32.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_MUX8T1_32_0_0_1/sim/ALU_MUX8T1_32_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/2f3b/and32.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_and32_0_0_1/sim/ALU_and32_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/326e/or32.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_or32_0_0_1/sim/ALU_or32_0_0.v" \

vlog -work xlslice_v1_0_2  -v2k5 -l xil_defaultlib -l xlslice_v1_0_2 -l xlconcat_v2_1_4 -l xlconstant_v1_1_7 \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/11d0/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 -l xil_defaultlib -l xlslice_v1_0_2 -l xlconcat_v2_1_4 -l xlconstant_v1_1_7 \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_xlslice_0_0_1/sim/ALU_xlslice_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/21e4/xor32.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_xor32_0_0_1/sim/ALU_xor32_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/6e8d/nor32.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_nor32_0_0_1/sim/ALU_nor32_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/bef6/srl32.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_srl32_0_0_1/sim/ALU_srl32_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/69d3/addc_32.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_addc_32_0_0_1/sim/ALU_addc_32_0_0.v" \

vlog -work xlconcat_v2_1_4  -v2k5 -l xil_defaultlib -l xlslice_v1_0_2 -l xlconcat_v2_1_4 -l xlconstant_v1_1_7 \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 -l xil_defaultlib -l xlslice_v1_0_2 -l xlconcat_v2_1_4 -l xlconstant_v1_1_7 \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_xlconcat_0_0_1/sim/ALU_xlconcat_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/d8f1/SignalExt_32.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_SignalExt_32_0_0_1/sim/ALU_SignalExt_32_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_xor32_1_0_1/sim/ALU_xor32_1_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_xlslice_1_0_1/sim/ALU_xlslice_1_0.v" \

vlog -work xlconstant_v1_1_7  -v2k5 -l xil_defaultlib -l xlslice_v1_0_2 -l xlconcat_v2_1_4 -l xlconstant_v1_1_7 \
"../../../../ALU.gen/sources_1/bd/ALU/ipshared/b0f2/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 -l xil_defaultlib -l xlslice_v1_0_2 -l xlconcat_v2_1_4 -l xlconstant_v1_1_7 \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_xlconstant_0_0_1/sim/ALU_xlconstant_0_0.v" \
"../../../../ALU.gen/sources_1/bd/ALU/ip/ALU_xlslice_2_0/sim/ALU_xlslice_2_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

