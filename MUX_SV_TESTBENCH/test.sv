`include "environment.sv"

class test;
  environment env;

  virtual interface mux_if.tb inter;

  function new(virtual interface mux_if.tb inter);
    this.inter = inter;
  endfunction

  task run();
    begin
      env = new(inter);
      env.run();
    end
  endtask
endclass