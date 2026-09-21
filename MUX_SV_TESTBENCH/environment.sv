`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "op_monitor.sv"
`include "ip_monitor.sv"
`include "scoreboard.sv"

class environment;
  transaction pkt;
  generator gen;
  driver drv;
  op_monitor op_mon;
  ip_monitor in_mon;
  scoreboard sb;

  mailbox g2d;
  mailbox im2sb;
  mailbox om2sb;

  virtual interface mux_if.tb inter;

  function new(virtual interface mux_if.tb inter);
    this.inter = inter;
  endfunction

  function void build();
    pkt = new();
    g2d = new();
    im2sb = new();
    om2sb = new();

    gen = new(g2d);
    drv = new(g2d, inter);
    op_mon = new(om2sb, inter);
    in_mon = new(im2sb, inter);
    sb = new(im2sb, om2sb);
  endfunction

task run();

  build();

  fork
    gen.run();
    drv.run();
    op_mon.run();
    in_mon.run();
    sb.run();
  join_any

  // wait(sb.count == 5);

  // disable fork;

endtask

endclass