vlib work
vmap work work

vlog  ../../hdl/chaser.v
vlog  ../hdl/chaser_tb.v

vsim -gui work.chaser_tb

do wave.do

run -all

