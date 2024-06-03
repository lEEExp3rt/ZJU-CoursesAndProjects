transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+ROM_D  -L dist_mem_gen_v8_0_13 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.ROM_D xil_defaultlib.glbl

do {ROM_D.udo}

run 1000ns

endsim

quit -force
