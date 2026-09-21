class driver;
    transaction pkt;
    mailbox #(transaction) g2d;
    virtual interface and_if.tb inter;

    function new(mailbox #(transaction) g2d, virtual interface and_if.tb inter);
        this.g2d   = g2d;
        this.inter = inter;
    endfunction

    task run();
        forever begin
            g2d.get(pkt);
            inter.a = pkt.a;
            inter.b = pkt.b;

            $display("\n >>> DRIVER CLASS <<<");
            $display("[driver]: driving a=%0b, b=%0b on interface", inter.a, inter.b);
        end
    endtask
endclass