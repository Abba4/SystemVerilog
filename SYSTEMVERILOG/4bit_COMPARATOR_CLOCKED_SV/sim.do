vlib work
vlog -sv -cover bcest -assertdebug top.sv
vsim -coverage -assertdebug work.top
add wave -r /*
log -r /*
run -all
view assertions
view coverage