class cmp_input_monitor;
    cmp_transaction tr;
    mailbox #(cmp_transaction) im2scb;
    virtual interface cmp_if.tb vif;

    function new(mailbox #(cmp_transaction) im2scb, virtual interface cmp_if.tb vif);
        this.im2scb = im2scb;
        this.vif = vif;
    endfunction

    task run();
        forever begin
            @(posedge vif.clk);
            if (vif.req) begin
                tr = new();
                tr.a = vif.a;
                tr.b = vif.b;
                im2scb.put(tr);
                $display("\n>>> INPUT MONITOR <<<");
                $display("[input_monitor]: a=%0d, b=%0d", tr.a, tr.b);
            end
        end
    endtask
endclass