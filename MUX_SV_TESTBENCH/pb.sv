`include "test.sv"

program mux_tb(mux_if.tb inter);
  test tb;

  initial begin
    tb = new(inter);
    tb.run();
  end
endprogram