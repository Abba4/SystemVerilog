module fork_join_none;

    initial begin

        fork
            #10 $display("Process 1");
            #20 $display("Process 2");
            #30 $display("Process 3");
        join_none

        $display("Parent continues");

    end

endmodule