class generator;
    transaction pkt;
    mailbox #(transaction) g2d;

    function new(mailbox #(transaction) g2d);
        this.g2d = g2d;
    endfunction

    task run();
        #1;
        for (int i = 0; i < 4; i++) begin
            pkt = new();
            pkt.a = i[1];
            pkt.b = i[0];
            pkt.display();

            g2d.put(pkt);

            $display(">>> GENERATOR CLASS <<<");
            $display("[generator]: putting a=%0b, b=%0b into g2d", pkt.a, pkt.b);
            $display("%s", {20{"-"}});

            #1;
        end
    endtask
endclass