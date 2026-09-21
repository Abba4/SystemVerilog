interface mux_if;
  logic i0, i1;
  logic sel;
  logic out;

  modport dut (input i0, i1, sel, output out);
  modport tb  (input out, output i0, i1, sel);
endinterface