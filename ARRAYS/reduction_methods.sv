module reduction_methods;

    int arr[] = '{10,20,30,40};

    initial begin

        $display("Array = %p", arr);

        $display("Sum = %0d", arr.sum());

        $display("Product = %0d", arr.product());

        $display("AND = %0d", arr.and());

        $display("OR = %0d", arr.or());

        $display("XOR = %0d", arr.xor());

    end

endmodule