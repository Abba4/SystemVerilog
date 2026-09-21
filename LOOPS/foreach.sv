module foreach_loop;

    int arr[] = '{10, 20, 30, 40, 50};

    initial begin

        foreach(arr[i]) begin
            $display("arr[%0d] = %0d", i, arr[i]);
        end

    end

endmodule