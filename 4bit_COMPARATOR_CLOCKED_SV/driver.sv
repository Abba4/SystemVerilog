class cmp_driver;
    cmp_transaction tr;
    mailbox #(cmp_transaction) gen2drv;
    virtual interface cmp_if.tb vif;

    function new(mailbox #(cmp_transaction) gen2drv, virtual interface cmp_if.tb vif);
        this.gen2drv = gen2drv;
        this.vif = vif;
    endfunction

    task run();
        forever begin
            gen2drv.get(tr);
            drive();
        end
    endtask

    task drive();
        @(negedge vif.clk);
        vif.a   <= tr.a;
        vif.b   <= tr.b;
        vif.req <= 1'b1;

        $display("[DRIVER] Driving a=%0d, b=%0d", tr.a, tr.b);

        @(negedge vif.clk);
        vif.req <= 1'b0;
    endtask
endclass