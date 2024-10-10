transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vmap -link {C:/Users/lqy/Desktop/Lab2/Lab2.cache/compile_simlib/riviera}
vlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -incr -v2k5 -l xil_defaultlib \
"../../../../Lab2.gen/sources_1/ip/Seg7_Dev_0/DisplaySync.v" \
"../../../../Lab2.gen/sources_1/ip/Seg7_Dev_0/MC_14495.v" \
"../../../../Lab2.gen/sources_1/ip/Seg7_Dev_0/Seg7_Dev.v" \
"../../../../Lab2.gen/sources_1/ip/Seg7_Dev_0/sim/Seg7_Dev_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

