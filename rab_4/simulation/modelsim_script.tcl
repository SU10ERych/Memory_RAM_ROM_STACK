vlib work
vlog  ../testbench.v ../../RAM.v
vsim work.testbench
add wave sim:/testbench/*
run -all
wave zoom full