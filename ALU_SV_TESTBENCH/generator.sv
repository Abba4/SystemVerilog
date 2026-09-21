class alu_generator;

    // Transaction object
    alu_transaction tr;

    // Mailbox used to send transactions to the driver
    mailbox #(alu_transaction) gen2drv;

    // Number of transactions to generate
    int num_transactions;


    //====================================================
    // Constructor
    //====================================================

    function new(
        input mailbox #(alu_transaction) gen2drv,
        input int num_transactions = 500
    );

        this.gen2drv = gen2drv;
        this.num_transactions = num_transactions;

    endfunction


    //====================================================
    // Run generator
    //====================================================

    task run();

        repeat (num_transactions) begin

            // Create a new transaction
            tr = new();

            // Randomize transaction
            assert(tr.randomize())
            else
                $fatal("[GENERATOR] Transaction randomization failed");

            // Display transaction
            tr.display();

            // Send transaction to driver
            gen2drv.put(tr);

        end

        $display(
            "\n[GENERATOR] Generated %0d transactions",
            num_transactions
        );

    endtask

endclass