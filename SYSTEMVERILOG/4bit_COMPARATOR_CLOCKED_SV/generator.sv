class cmp_generator;
    cmp_transaction tr;
    mailbox #(cmp_transaction) gen2drv;
    int num_transactions;

    function new(mailbox #(cmp_transaction) gen2drv, int num_transactions = 20);
        this.gen2drv = gen2drv;
        this.num_transactions = num_transactions;
    endfunction

    task run();
        repeat (num_transactions) begin
            tr = new();
            assert(tr.randomize()) else $fatal("[GEN] randomize failed");
            tr.display();
            gen2drv.put(tr);
        end
        $display("\n[GENERATOR] Generated %0d transactions", num_transactions);
    endtask
endclass