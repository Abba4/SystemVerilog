module mux_2x1(mux_if.dut inter);
  assign inter.out = (inter.sel) ? inter.i1 : inter.i0;
endmodule