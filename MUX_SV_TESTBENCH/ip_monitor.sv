class ip_monitor;
  transaction pkt;
  mailbox im2sb;

  virtual interface mux_if.tb inter;

  function new(mailbox im2sb, virtual interface mux_if.tb inter);
    this.im2sb = im2sb;
    this.inter = inter;
  endfunction

  task run();
    pkt = new();
    forever begin
        @(inter.i0, inter.i1, inter.sel);
        pkt.i0 = inter.i0;
        pkt.i1 = inter.i1;
        pkt.sel = inter.sel;

        $display("\n >>> INPUT MONITOR CLASS <<<");
        $display("[input monitor]: data sent from interface to input monitor");
        $display("[interface to input monitor]: data collected by input monitor is i0=%0d, i1=%0d, sel=%0d", pkt.i0, pkt.i1, pkt.sel);

        //BFM
        case(pkt.sel)
          1'b0: pkt.out = pkt.i0;
          1'b1: pkt.out = pkt.i1;
          default: pkt.out = 1'bx;
        endcase

        $display("[BFM]: pkt.out=%0d", pkt.out);
        im2sb.put(pkt);

        $display("[input monitor to mailbox] data sent from input monitor to mailbox is pkt.out=%0d", pkt.out);
        $display(20*"-");
    end
  endtask
endclass