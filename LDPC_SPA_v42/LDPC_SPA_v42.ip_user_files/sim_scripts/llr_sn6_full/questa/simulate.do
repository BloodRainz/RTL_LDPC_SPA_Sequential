onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib llr_sn6_full_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {llr_sn6_full.udo}

run 1000ns

quit -force
