`include "test.sv"

program and_tb(and_if.tb inter);
    test tb;
    initial begin
        tb = new(inter);
        tb.run();
    end
endprogram