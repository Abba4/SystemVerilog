class op_monitor;
  transaction pkt;
  mailbox om2sb;

  virtual interface mux_if.tb inter;

  function new(mailbox om2sb, virtual interface mux_if.tb inter);
    this.om2sb = om2sb;
    this.inter = inter;
  endfunction

  task run();
    pkt = new();
    forever begin
        @(inter.out);
        pkt.out = inter.out;

        $display("\n >>> OUTPUT MONITOR CLASS <<<");
        $display("[output monitor]: data sent from interface to output monitor");
        $display("[interface to output monitor]: data collected by output monitor is out=%0d", pkt.out);

        om2sb.put(pkt);

        $display("[output monitor to mailbox] data sent from output monitor to mailbox is pkt.out=%0d", pkt.out);
        $display(20*"-");
    end
  endtask
endclass