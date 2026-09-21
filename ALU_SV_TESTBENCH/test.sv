`include "environment.sv"

class alu_test;

    environment env;

    virtual interface alu_if.tb inter;

    function new(virtual interface alu_if.tb inter);
        this.inter = inter;
    endfunction

    task run();

        begin

            env = new(inter);
            env.run();

        end

    endtask

endclass