module fork_join_any;

    initial begin

        fork
            #10 $display("Process 1");
            #20 $display("Process 2");
            #30 $display("Process 3");
        join_any

        $display("One process finished");

    end

endmodule