class cmp_scoreboard;
    cmp_transaction input_pkt;
    cmp_transaction output_pkt;

    mailbox #(cmp_transaction) im2sb;
    mailbox #(cmp_transaction) om2sb;

    int pass_count;
    int fail_count;
    int processed_count;
    int expected_count;

    function new(mailbox #(cmp_transaction) im2sb,
                 mailbox #(cmp_transaction) om2sb,
                 int expected_count = 20);
        this.im2sb = im2sb;
        this.om2sb = om2sb;
        this.expected_count = expected_count;
        pass_count      = 0;
        fail_count      = 0;
        processed_count = 0;
    endfunction

    // Golden model
    function void calculate_expected(input  cmp_transaction in,
                                     output bit exp_gt,
                                     output bit exp_eq,
                                     output bit exp_lt);
        exp_gt = (in.a >  in.b);
        exp_eq = (in.a == in.b);
        exp_lt = (in.a <  in.b);
    endfunction

    task run();
        forever begin
            bit exp_gt, exp_eq, exp_lt;

            im2sb.get(input_pkt);
            om2sb.get(output_pkt);

            calculate_expected(input_pkt, exp_gt, exp_eq, exp_lt);

            $display("\n>>> SCOREBOARD <<<");
            $display("[scoreboard]: a=%0d, b=%0d", input_pkt.a, input_pkt.b);
            $display("[scoreboard]: expected gt=%0b eq=%0b lt=%0b",
                     exp_gt, exp_eq, exp_lt);
            $display("[scoreboard]: actual   gt=%0b eq=%0b lt=%0b",
                     output_pkt.gt, output_pkt.eq, output_pkt.lt);

            if (output_pkt.gt === exp_gt &&
                output_pkt.eq === exp_eq &&
                output_pkt.lt === exp_lt) begin
                pass_count++;
                $display("[SCOREBOARD]: PASS");
            end else begin
                fail_count++;
                $display("[SCOREBOARD]: FAIL");
            end

            processed_count++;
            $display("%s", {20{"-"}});
        end
    endtask

    function void report();
        $display("\n========================================");
        $display("           SCOREBOARD REPORT");
        $display("========================================");
        $display("PASS COUNT = %0d", pass_count);
        $display("FAIL COUNT = %0d", fail_count);
        $display("TOTAL      = %0d", pass_count + fail_count);
        $display("========================================");
    endfunction

    function bit is_done();
        return (processed_count >= expected_count);
    endfunction
endclass