`include "test.sv"

program alu_tb(alu_if.tb inter);

    alu_test tb;

    initial begin

        tb = new(inter);
        tb.run();

    end

endprogram