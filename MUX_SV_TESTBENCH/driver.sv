class driver;
  transaction pkt;
  mailbox g2d;

  virtual interface mux_if.tb inter;

  function new(mailbox g2d, virtual interface mux_if.tb inter);
    this.g2d = g2d;
    this.inter = inter;
  endfunction

  task run();
    forever begin
        g2d.get(pkt);
        $display("\n >>> DRIVER CLASS <<<");
        $display("[driver]: data sent from mailbox to driver");
        $display("[mailbox to driver]: data collected by driver is i0=%0d, i1=%0d, sel=%0d, out=%0d", pkt.i0, pkt.i1, pkt.sel, pkt.out);
        inter.i0 = pkt.i0;
        inter.i1 = pkt.i1;
        inter.sel = pkt.sel;
        
        $display("[driver to interface]: data sent from driver to interface is i0=%0d, i1=%0d, sel=%0d", inter.i0, inter.i1, inter.sel);
    end
  endtask
endclass