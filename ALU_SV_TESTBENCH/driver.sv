class alu_driver;
    // Transaction received from generator
    alu_transaction tr;

    // Mailbox: Generator → Driver
    mailbox #(alu_transaction) gen2drv;


    // Virtual interface
    virtual interface alu_if.tb vif;

    // Constructor
    function new(
        mailbox #(alu_transaction) gen2drv,
        virtual interface alu_if.tb vif
    );

        this.gen2drv = gen2drv;
        this.vif = vif;

    endfunction

    // Run driver
    task run();

        forever begin

            // Get transaction from generator
            gen2drv.get(tr);

            // Drive transaction onto DUT
            drive();

        end

    endtask

    // Drive transaction onto DUT
    task drive();

        @(negedge vif.clk);

        vif.opcode <= tr.opcode;
        vif.a      <= tr.a;
        vif.b      <= tr.b;

        vif.req    <= 1'b1;

        $display(
            "[DRIVER] Driving opcode=%0d, a=%0d, b=%0d",
            tr.opcode,
            tr.a,
            tr.b
        );


        @(negedge vif.clk);

        vif.req <= 1'b0;

    endtask

endclass