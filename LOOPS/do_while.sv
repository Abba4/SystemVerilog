module do_while_loop;

    int i = 6;

    initial begin

        do begin
            $display("i = %0d", i);
            i++;
        end while(i < 5);

    end

endmodule