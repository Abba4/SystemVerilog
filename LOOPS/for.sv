module for_loop;

    int arr[5] = '{10, 2, 7, 4, 5};

    initial begin

        for(int i = 0; i < 5; i++) begin
            $display("arr[%0d] = %0d", i, arr[i]);
        end

    end

endmodule