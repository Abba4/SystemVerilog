module disable_fork;

    initial begin

        fork
            begin
                #10 $display("Process 1");
            end

            begin
                #20 $display("Process 2");
            end

            begin
                #30 $display("Process 3");
            end
        join_none

        #15;

        disable fork;

        $display("Remaining processes stopped");

    end

endmodule