transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+ALU  -L xil_defaultlib -L xlslice_v1_0_2 -L xlconcat_v2_1_4 -L xlconstant_v1_1_7 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.ALU xil_defaultlib.glbl

do {ALU.udo}

run 1000ns

endsim

quit -force
