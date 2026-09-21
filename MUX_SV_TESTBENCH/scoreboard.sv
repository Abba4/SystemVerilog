class scoreboard;
  transaction ref_pkt, dut_pkt;
  mailbox im2sb;
  mailbox om2sb;

  function new(mailbox im2sb, mailbox om2sb);
    this.im2sb = im2sb;
    this.om2sb = om2sb;
  endfunction

  task run();
    repeat(5) begin
        im2sb.get(ref_pkt);
        $display("\n >>> SCOREBOARD CLASS <<<");
        $display("[scoreboard]: data sent from input monitor to scoreboard");
        $display("[input monitor to scoreboard]: data collected by scoreboard is i0=%0d, i1=%0d, sel=%0d", ref_pkt.i0, ref_pkt.i1, ref_pkt.sel);

        om2sb.get(dut_pkt);
        $display("[scoreboard]: data sent from output monitor to scoreboard");
        $display("[output monitor to scoreboard]: data collected by scoreboard is out=%0d", dut_pkt.out);

        if (dut_pkt.out == ((ref_pkt.sel) ? ref_pkt.i1 : ref_pkt.i0)) begin
            $display("[scoreboard]: output is correct");
        end else begin
            $display("[scoreboard]: output is incorrect");
        end
    end
  endtask

//   int count = 0;

// task run();
//   forever begin

//     im2sb.get(ref_pkt);

//     $display("\n >>> SCOREBOARD CLASS <<<");
//     $display("[scoreboard]: data sent from input monitor to scoreboard");
//     $display("[input monitor to scoreboard]: data collected by scoreboard is i0=%0d, i1=%0d, sel=%0d",
//              ref_pkt.i0, ref_pkt.i1, ref_pkt.sel);

//     om2sb.get(dut_pkt);

//     $display("[scoreboard]: data sent from output monitor to scoreboard");
//     $display("[output monitor to scoreboard]: data collected by scoreboard is out=%0d",
//              dut_pkt.out);

//     if (dut_pkt.out == ((ref_pkt.sel) ? ref_pkt.i1 : ref_pkt.i0)) begin
//       $display("[scoreboard]: output is correct");
//     end
//     else begin
//       $display("[scoreboard]: output is incorrect");
//     end

//     count = count + 1;

//     $display("[scoreboard]: transaction count = %0d", count);

//     if (count == 5) begin
//       $display("\n======================================");
//       $display("       ALL 5 TRANSACTIONS CHECKED");
//       $display("       SCOREBOARD FINISHED");
//       $display("======================================\n");
//       break;
//     end

endclass
