class generator;

  transaction pkt;
  mailbox g2d;

  function new(mailbox g2d);
    this.g2d = g2d;
  endfunction

  task run();

    #1;
    //pkt = new();

    repeat(5) begin

      pkt = new();

      pkt.randomize();
      pkt.display();

      g2d.put(pkt);

      $display(">>> GENERATOR CLASS <<<");
      $display("\n [generator]:randomizing transaction and putting into mailbox g2d");
      $display("[generator]:putting transaction into mailbox g2d with values of i0=[%0d], i1=[%0d], sel=[%0d]",
               pkt.i0, pkt.i1, pkt.sel);
      $display(20*"-");

      #1;

    end

  endtask

endclass