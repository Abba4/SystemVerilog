`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "input_monitor.sv"
`include "output_monitor.sv"
`include "scoreboard.sv"

class environment;

    alu_transaction pkt;
    alu_generator gen;
    alu_driver drv;
    input_monitor in_mon;
    output_monitor op_mon;
    alu_scoreboard sb;

    mailbox #(alu_transaction) gen2drv;
    mailbox #(alu_transaction) im2scb;
    mailbox #(alu_transaction) om2scb;

    virtual interface alu_if.tb inter;

    int num_transactions;   // number of transactions to generate

    //-----------------------------------------------------------
    // Constructor: now accepts the number of transactions
    //-----------------------------------------------------------
    function new(virtual interface alu_if.tb inter, int num_transactions = 500);
        this.inter = inter;
        this.num_transactions = num_transactions;
    endfunction

    //-----------------------------------------------------------
    // Build all components and connect mailboxes
    //-----------------------------------------------------------
    function void build();
        pkt = new();

        gen2drv = new();
        im2scb  = new();
        om2scb  = new();

        // Instantiate components; pass num_transactions to generator and scoreboard
        gen    = new(gen2drv, num_transactions);
        drv    = new(gen2drv, inter);
        in_mon = new(im2scb, inter);
        op_mon = new(om2scb, inter);
        sb     = new(im2scb, om2scb, num_transactions);   // expected count
    endfunction

    //-----------------------------------------------------------
    // Run the test: fork all threads, wait for generator to finish,
    // then wait until scoreboard has processed all transactions.
    //-----------------------------------------------------------
    task run();
        build();

        fork
            gen.run();      // will finish after num_transactions
            drv.run();      // forever
            in_mon.run();   // forever
            op_mon.run();   // forever
            sb.run();       // forever
        join_any   // unblock as soon as generator finishes

        // Wait until the scoreboard has processed all transactions
        while (!sb.is_done()) begin
            @(posedge inter.clk);   // wait one clock cycle between checks
        end

        // All transactions have been checked – stop simulation
        disable fork;
        sb.report();
        $finish;
    endtask

endclass