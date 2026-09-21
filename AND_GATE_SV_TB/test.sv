`include "environment.sv"

class test;
    environment env;
    virtual interface and_if.tb inter;

    function new(virtual interface and_if.tb inter);
        this.inter = inter;
    endfunction

    task run();
        env = new(inter);
        env.run();
    endtask
endclass