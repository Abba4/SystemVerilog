module wait_fork;

    initial begin

        fork
            #10 $display("Process 1");
            #20 $display("Process 2");
        join_none

        $display("Parent continues");

        wait fork;

        $display("All forked processes finished");

    end

endmodule