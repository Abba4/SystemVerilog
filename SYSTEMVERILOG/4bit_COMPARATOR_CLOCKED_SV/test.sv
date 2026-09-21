`include "environment.sv"

class cmp_test;
    cmp_environment env;
    virtual interface cmp_if.tb inter;

    function new(virtual interface cmp_if.tb inter);
        this.inter = inter;
    endfunction

    task run();
        env = new(inter, 20);
        env.run();
    endtask
endclass