class cmp_output_monitor;
    cmp_transaction tr;
    mailbox #(cmp_transaction) om2scb;
    virtual interface cmp_if.tb vif;

    function new(mailbox #(cmp_transaction) om2scb, virtual interface cmp_if.tb vif);
        this.om2scb = om2scb;
        this.vif = vif;
    endfunction

    task run();
        forever begin
            @(posedge vif.clk);
            if (vif.ack) begin
                tr = new();
                tr.gt = vif.gt;
                tr.eq = vif.eq;
                tr.lt = vif.lt;
                om2scb.put(tr);
                $display("\n>>> OUTPUT MONITOR <<<");
                $display("[output_monitor]: gt=%0b eq=%0b lt=%0b", tr.gt, tr.eq, tr.lt);
            end
        end
    endtask
endclass