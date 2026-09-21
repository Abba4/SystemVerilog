class ip_monitor;
    transaction pkt;
    mailbox #(transaction) im2sb;
    virtual interface and_if.tb inter;

    function new(mailbox #(transaction) im2sb, virtual interface and_if.tb inter);
        this.im2sb = im2sb;
        this.inter = inter;
    endfunction

    task run();
        forever begin
            @(inter.a, inter.b);       // fires on any input change
            pkt    = new();
            pkt.a  = inter.a;
            pkt.b  = inter.b;

            // BFM: predict expected output
            pkt.y = pkt.a & pkt.b;

            $display("\n >>> INPUT MONITOR CLASS <<<");
            $display("[input monitor]: a=%0b, b=%0b -> predicted y=%0b",
                     pkt.a, pkt.b, pkt.y);

            im2sb.put(pkt);
        end
    endtask
endclass