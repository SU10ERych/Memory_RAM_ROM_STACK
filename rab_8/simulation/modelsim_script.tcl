vlib work
vlog  ../testbench.v ../../ROM.v
vsim  work.testbench
add wave sim:/testbench/*
run -all
wave zoom full