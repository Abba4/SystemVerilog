interface and_if;
    logic a;
    logic b;
    logic y;

    modport dut (input  a, b, output y);
    modport tb  (input  y,    output a, b);
endinterface