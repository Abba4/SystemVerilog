module fork_join;

    initial begin

        fork
            #10 $display("Process 1");
            #20 $display("Process 2");
            #30 $display("Process 3");
        join

        $display("All processes finished");

    end

endmodule