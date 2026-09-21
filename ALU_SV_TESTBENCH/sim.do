# --- Compile ---
if {![file exists work]} {
    vlib work
}
vlog -sv -cover bcest -assertdebug top.sv

# --- Load design (this replaces the empty vsim session) ---
vsim -coverage work.top

# --- Runtime ---
add wave -r /*
log -r /*
run -all
coverage report -byfile -detail
view coverage
view assertions