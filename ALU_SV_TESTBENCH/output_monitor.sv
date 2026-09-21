class output_monitor;

    alu_transaction tr;

    mailbox #(alu_transaction) om2scb;

    virtual interface alu_if.tb vif;


    function new(
        mailbox #(alu_transaction) om2scb,
        virtual interface alu_if.tb vif
    );

        this.om2scb = om2scb;
        this.vif = vif;

    endfunction


    task run();

        forever begin

            @(posedge vif.clk);

            if (vif.ack) begin

                tr = new();

                tr.result = vif.result;

                $display("\n>>> OUTPUT MONITOR <<<");

                $display(
                    "[output monitor]: result observed from DUT"
                );

                $display(
                    "[interface to output monitor]: result=%0d",
                    tr.result
                );

                om2scb.put(tr);

                $display(
                    "[output monitor to mailbox]: result sent to scoreboard"
                );

                $display("%s", {20{"-"}});   // prints 20 dashes;

            end

        end

    endtask

endclass