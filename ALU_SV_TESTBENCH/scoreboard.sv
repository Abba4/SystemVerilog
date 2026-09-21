class alu_scoreboard;

    alu_transaction input_pkt;
    alu_transaction output_pkt;

    mailbox #(alu_transaction) im2sb;
    mailbox #(alu_transaction) om2sb;

    int pass_count;
    int fail_count;
    int processed_count;      // total transactions processed so far
    int expected_count;       // total transactions expected

    //-----------------------------------------------------------
    // Constructor: now accepts expected count (number of transactions)
    //-----------------------------------------------------------
    function new(
        mailbox #(alu_transaction) im2sb,
        mailbox #(alu_transaction) om2sb,
        int expected_count = 500
    );
        this.im2sb = im2sb;
        this.om2sb = om2sb;
        this.expected_count = expected_count;

        pass_count      = 0;
        fail_count      = 0;
        processed_count = 0;
    endfunction

    //-----------------------------------------------------------
    // Compute expected result based on opcode and operands
    //-----------------------------------------------------------
    function bit [8:0] calculate_expected(
        input bit [2:0] opcode,
        input bit [7:0] a,
        input bit [7:0] b
    );
        case (opcode)
            3'b000: calculate_expected = {1'b0, a} + {1'b0, b}; // ADD
            3'b001: calculate_expected = {1'b0, a} - {1'b0, b}; // SUB
            3'b010: calculate_expected = {1'b0, a & b};         // AND
            3'b011: calculate_expected = {1'b0, a | b};         // OR
            3'b100: calculate_expected = {1'b0, a ^ b};         // XOR
            3'b101: calculate_expected = {1'b0, a << 1};        // LEFT SHIFT
            3'b110: calculate_expected = {1'b0, a >> 1};        // RIGHT SHIFT
            3'b111: calculate_expected = {1'b0, a};             // PASS
            default: calculate_expected = 9'bx;
        endcase
    endfunction

    //-----------------------------------------------------------
    // Main run task – runs forever until disabled
    //-----------------------------------------------------------
    task run();
        forever begin
            bit [8:0] expected;

            // Get one input and one output transaction (must arrive in order)
            im2sb.get(input_pkt);
            om2sb.get(output_pkt);

            expected = calculate_expected(
                input_pkt.opcode,
                input_pkt.a,
                input_pkt.b
            );

            $display("\n>>> SCOREBOARD <<<");
            $display(
                "[scoreboard]: opcode=%0d, a=%0d, b=%0d",
                input_pkt.opcode,
                input_pkt.a,
                input_pkt.b
            );
            $display(
                "[scoreboard]: expected=%0d, actual=%0d",
                expected,
                output_pkt.result
            );

            if (expected === output_pkt.result) begin
                pass_count++;
                $display("[SCOREBOARD]: PASS");
            end else begin
                fail_count++;
                $display("[SCOREBOARD]: FAIL");
            end

            processed_count++;   // increment after each comparison

            $display("%s", {20{"-"}});   // prints 20 dashes;
        end
    endtask

    //-----------------------------------------------------------
    // Report final statistics
    //-----------------------------------------------------------
    function void report();
        $display("\n========================================");
        $display("           SCOREBOARD REPORT");
        $display("========================================");
        $display("PASS COUNT = %0d", pass_count);
        $display("FAIL COUNT = %0d", fail_count);
        $display("TOTAL      = %0d", pass_count + fail_count);
        $display("========================================");
    endfunction

    //-----------------------------------------------------------
    // Check if all expected transactions have been processed
    //-----------------------------------------------------------
    function bit is_done();
        return (processed_count >= expected_count);
    endfunction

endclass