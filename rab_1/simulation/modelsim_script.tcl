vlib work
vlog  ../testbench.v ../../rab_1.v
vsim work.testbench
add wave sim:/testbench/*
run -all
wave zoom full