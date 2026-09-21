class scoreboard;
    transaction ref_pkt, dut_pkt;
    mailbox #(transaction) im2sb;
    mailbox #(transaction) om2sb;

    int count = 0;

    function new(mailbox #(transaction) im2sb, mailbox #(transaction) om2sb);
        this.im2sb = im2sb;
        this.om2sb = om2sb;
    endfunction

    task run();
        forever begin
            im2sb.get(ref_pkt);
            om2sb.get(dut_pkt);

            $display("\n >>> SCOREBOARD CLASS <<<");
            $display("[scoreboard]: comparing input & output monitors' packets");

            if (dut_pkt.y === ref_pkt.y) begin
                $display("[scoreboard]: PASS");
            end else begin
                $display("[scoreboard]: FAIL");
                $display("[scoreboard]: expected y=%0b, got y=%0b",
                         ref_pkt.y, dut_pkt.y);
            end

            count++;
            if (count == 4) begin
                $display("\n========================================");
                $display("   ALL 4 TRANSACTIONS CHECKED");
                $display("========================================\n");
                break;
            end
        end
    endtask
endclass