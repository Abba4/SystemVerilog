module array_iterator;

    int arr[] = '{10, 20, 30, 20, 40, 50, 30};
    int result[$];

    initial begin

        $display("Array = %p", arr);

        // find()
        result = arr.find(x) with (x > 25);
        $display("find = %p", result);

        // find_index()
        result = arr.find_index(x) with (x > 25);
        $display("find_index = %p", result);

        // find_first()
        result = arr.find_first(x) with (x > 25);
        $display("find_first = %p", result);

        // find_first_index()
        result = arr.find_first_index(x) with (x > 25);
        $display("find_first_index = %p", result);

        // find_last()
        result = arr.find_last(x) with (x > 25);
        $display("find_last = %p", result);

        // find_last_index()
        result = arr.find_last_index(x) with (x > 25);
        $display("find_last_index = %p", result);

        // min()
        result = arr.min();
        $display("min = %p", result);

        // max()
        result = arr.max();
        $display("max = %p", result);

        // unique()
        result = arr.unique();
        $display("unique = %p", result);

        // unique_index()
        result = arr.unique_index();
        $display("unique_index = %p", result);

    end

endmodule