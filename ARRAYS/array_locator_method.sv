module array_locator;

    int arr[] = '{10, 25, 30, 45, 50, 15};

    int result[$];

    initial begin

        $display("Array = %p", arr);

        // find values greater than 30
        result = arr.find(x) with (x > 30);
        $display("find = %p", result);

        // find indexes of values greater than 30
        result = arr.find_index(x) with (x > 30);
        $display("find_index = %p", result);

        // find the first value greater than 30
        result = arr.find_first(x) with (x > 30);
        $display("find_first = %p", result);

        // find the index of the first value greater than 30
        result = arr.find_first_index(x) with (x > 30);
        $display("find_first_index = %p", result);

        // find the last value greater than 30
        result = arr.find_last(x) with (x > 30);
        $display("find_last = %p", result);

        // find the index of the last value greater than 30
        result = arr.find_last_index(x) with (x > 30);
        $display("find_last_index = %p", result);

    end

endmodule