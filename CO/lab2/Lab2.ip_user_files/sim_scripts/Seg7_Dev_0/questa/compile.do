vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr -mfcu  \
"../../../../Lab2.gen/sources_1/ip/Seg7_Dev_0/DisplaySync.v" \
"../../../../Lab2.gen/sources_1/ip/Seg7_Dev_0/MC_14495.v" \
"../../../../Lab2.gen/sources_1/ip/Seg7_Dev_0/Seg7_Dev.v" \
"../../../../Lab2.gen/sources_1/ip/Seg7_Dev_0/sim/Seg7_Dev_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

