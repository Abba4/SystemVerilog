class cmp_coverage;
    cmp_transaction pkt;
    mailbox #(cmp_transaction) im2cov;

    covergroup cmp_cg;

        // Which output category fired
        cp_result : coverpoint {pkt.gt, pkt.eq, pkt.lt} {
            bins A_GT_B = {3'b100};
            bins A_EQ_B = {3'b010};
            bins A_LT_B = {3'b001};
        }

        // Operand A categories
        cp_a : coverpoint pkt.a {
            bins ZERO = {4'd0};
            bins ONE  = {4'd1};
            bins MAX  = {4'd15};
            bins LOW  = {[4'd2:4'd6]};
            bins HIGH = {[4'd9:4'd14]};
        }

        // Operand B categories
        cp_b : coverpoint pkt.b {
            bins ZERO = {4'd0};
            bins ONE  = {4'd1};
            bins MAX  = {4'd15};
            bins LOW  = {[4'd2:4'd6]};
            bins HIGH = {[4'd9:4'd14]};
        }

        // Cross: a vs b
        a_b_cross : cross cp_a, cp_b;

    endgroup

    function new(mailbox #(cmp_transaction) im2cov);
        this.im2cov = im2cov;
        cmp_cg = new();
    endfunction

    task run();
        forever begin
            im2cov.get(pkt);
            cmp_cg.sample();
        end
    endtask

    function void report();
        $display("\n========================================");
        $display("       FUNCTIONAL COVERAGE REPORT");
        $display("========================================");
        $display("CMP COVERAGE = %0.2f%%", cmp_cg.get_coverage());
        $display("========================================");
    endfunction
endclass