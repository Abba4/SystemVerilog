`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "input_monitor.sv"
`include "output_monitor.sv"
`include "scoreboard.sv"

class environment;
    transaction pkt;
    generator   gen;
    driver      drv;
    ip_monitor  in_mon;
    op_monitor  op_mon;
    scoreboard  sb;

    mailbox #(transaction) g2d;
    mailbox #(transaction) im2sb;
    mailbox #(transaction) om2sb;

    virtual interface and_if.tb inter;

    function new(virtual interface and_if.tb inter);
        this.inter = inter;
    endfunction

    function void build();
        g2d   = new();
        im2sb = new();
        om2sb = new();

        gen    = new(g2d);
        drv    = new(g2d,   inter);
        in_mon = new(im2sb, inter);
        op_mon = new(om2sb, inter);
        sb     = new(im2sb, om2sb);
    endfunction

    task run();
        build();

        fork
            gen.run();
            drv.run();
            in_mon.run();
            op_mon.run();
            sb.run();
        join_any

        wait(sb.count == 4);
        //disable fork;

        $display("\n>>> ENVIRONMENT: all 4 combinations checked, stopping <<<");
        $finish;
    endtask
endclass