`include "interface.sv"
`include "dut.sv"
`include "program_block.sv"

module top;
    and_if   inter();
    and_tb   tb(inter);
    and_gate dut(inter);
endmodule