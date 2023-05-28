vlib work
vlog  ../testbench.v ../Dual_port_RAM.v
vsim  work.testbench
add wave sim:/testbench/*
run -all
wave zoom full