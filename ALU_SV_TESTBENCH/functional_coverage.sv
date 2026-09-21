class alu_coverage;

    alu_transaction pkt;

    mailbox #(alu_transaction) im2cov;

    covergroup alu_cg;

        // --------------------------------
        // OPCODE COVERAGE
        // --------------------------------

        cp_opcode : coverpoint pkt.opcode {

            bins ADD         = {3'b000};
            bins SUB         = {3'b001};
            bins AND_OP      = {3'b010};
            bins OR_OP       = {3'b011};
            bins XOR_OP      = {3'b100};
            bins LEFT_SHIFT  = {3'b101};
            bins RIGHT_SHIFT = {3'b110};
            bins PASS        = {3'b111};

        }


        // --------------------------------
        // OPERAND A COVERAGE
        // --------------------------------

        cp_a : coverpoint pkt.a {

            bins ZERO = {8'd0};
            bins ONE  = {8'd1};

            bins LOW = {[2:63]};
            bins MID = {[64:191]};
            bins HIGH = {[192:254]};

            bins MAX = {8'd255};

        }


        // --------------------------------
        // OPERAND B COVERAGE
        // --------------------------------

        cp_b : coverpoint pkt.b {

            bins ZERO = {8'd0};
            bins ONE  = {8'd1};

            bins LOW = {[2:63]};
            bins MID = {[64:191]};
            bins HIGH = {[192:254]};

            bins MAX = {8'd255};

        }


        // --------------------------------
        // AUTOMATIC BINS
        // --------------------------------

        cp_a_auto : coverpoint pkt.a {
            option.auto_bin_max = 16;
        }


        // --------------------------------
        // TRANSITION COVERAGE
        // --------------------------------

        cp_opcode_transition : coverpoint pkt.opcode {

            bins ADD_TO_SUB =
                (3'b000 => 3'b001);

            bins SUB_TO_ADD =
                (3'b001 => 3'b000);

            bins ADD_TO_ADD =
                (3'b000 => 3'b000);

            bins ANY_TO_ADD =
                ([3'b000:3'b111] => 3'b000);

        }


        // --------------------------------
        // CROSS COVERAGE
        // --------------------------------

        opcode_a_cross :
            cross cp_opcode, cp_a;


        opcode_b_cross :
            cross cp_opcode, cp_b;


        // --------------------------------
        // CONDITIONAL COVERAGE USING IFF
        // --------------------------------

        cp_a_when_add :
            coverpoint pkt.a
            iff (pkt.opcode == 3'b000) {

                bins ZERO = {8'd0};
                bins MAX  = {8'd255};

            }


        cp_b_when_add :
            coverpoint pkt.b
            iff (pkt.opcode == 3'b000) {

                bins ZERO = {8'd0};
                bins MAX  = {8'd255};

            }


        // --------------------------------
        // INTERSECT
        // --------------------------------

                cp_a_special : coverpoint pkt.a {

                    bins ZERO = {8'd0};

                    bins MAX = {8'd255};

        }   


        // --------------------------------
        // BINOF(S) EXAMPLE
        // --------------------------------

        opcode_operand_cross :
            cross cp_opcode, cp_a {

                bins ADD_WITH_MAX =
                    binsof(cp_opcode) intersect {3'b000}
                    && binsof(cp_a) intersect {8'd255};

                bins ADD_WITH_ZERO =
                    binsof(cp_opcode) intersect {3'b000}
                    && binsof(cp_a) intersect {8'd0};

            }

    endgroup


    function new(mailbox #(alu_transaction) im2cov);

        this.im2cov = im2cov;

        alu_cg = new();

    endfunction


    task run();

        forever begin

            im2cov.get(pkt);

            alu_cg.sample();

        end

    endtask


    function void report();

        $display("\n========================================");
        $display("       FUNCTIONAL COVERAGE REPORT");
        $display("========================================");

        $display(
            "ALU COVERAGE = %0.2f%%",
            alu_cg.get_coverage()
        );

        $display("========================================");

    endfunction

endclass