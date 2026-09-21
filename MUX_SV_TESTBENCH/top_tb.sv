`include "interface.sv"
`include "dut.sv"
`include "pb.sv"

module top;
  mux_if inter();
  mux_tb tb(inter);
  mux_2x1 dut(inter);
endmodule

