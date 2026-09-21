class input_monitor;

    alu_transaction tr;

    mailbox #(alu_transaction) im2scb;

    virtual interface alu_if.tb vif;


    function new(
        mailbox #(alu_transaction) im2scb,
        virtual interface alu_if.tb vif
    );

        this.im2scb = im2scb;
        this.vif = vif;

    endfunction


    task run();

        forever begin

            @(posedge vif.clk);

            if (vif.req) begin

                tr = new();

                tr.opcode = vif.opcode;
                tr.a      = vif.a;
                tr.b      = vif.b;

                im2scb.put(tr);

                $display("\n>>> INPUT MONITOR <<<");

                $display(
                    "[input_monitor]: transaction observed at DUT input"
                );

                $display(
                    "[input_monitor]: opcode=%0d, a=%0d, b=%0d",
                    tr.opcode,
                    tr.a,
                    tr.b
                );

                $display("%s", {20{"-"}});   // prints 20 dashes;

            end

        end

    endtask

endclass