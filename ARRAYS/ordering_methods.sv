module ordering_methods;

    int arr[] = '{30,10,50,20,40};

    initial begin

        $display("Original = %p", arr);

        arr.reverse();
        $display("Reverse = %p", arr);

        arr.sort();
        $display("Sort = %p", arr);

        arr.rsort();
        $display("Reverse Sort = %p", arr);

        arr.shuffle();
        $display("Shuffle = %p", arr);

    end

endmodule