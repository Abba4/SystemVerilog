`include "test.sv"

program cmp_tb(cmp_if.tb inter);
    cmp_test tb;

    initial begin
        tb = new(inter);
        tb.run();
    end
endprogram