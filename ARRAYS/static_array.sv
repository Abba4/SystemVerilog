module static_array_example;

    int numbers[5];

    initial begin

        // Initialize the array
        numbers[0] = 10;
        numbers[1] = 20;
        numbers[2] = 30;
        numbers[3] = 40;
        numbers[4] = 50;

        // Display all elements
        $display("Static Array:");

        foreach (numbers[i])
            $display("numbers[%0d] = %0d", i, numbers[i]);

    end

endmodule