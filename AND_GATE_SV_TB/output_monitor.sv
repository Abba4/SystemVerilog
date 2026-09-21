class op_monitor;
    transaction pkt;
    mailbox #(transaction) om2sb;
    virtual interface and_if.tb inter;

    function new(mailbox #(transaction) om2sb, virtual interface and_if.tb inter);
        this.om2sb = om2sb;
        this.inter = inter;
    endfunction

    task run();
        forever begin
            @(inter.a, inter.b);                // <-- fires ONLY when y changes
            #1;
            pkt    = new();
            pkt.y  = inter.y;

            $display("\n >>> OUTPUT MONITOR CLASS <<<");
            $display("[output monitor]: observed y=%0b", pkt.y);

            om2sb.put(pkt);
        end
    endtask
endclass