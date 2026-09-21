module dynamic_array_example;

    int numbers[];

    initial begin

        // Allocate memory
        numbers = new[5];

        numbers[0] = 100;
        numbers[1] = 200;
        numbers[2] = 300;
        numbers[3] = 400;
        numbers[4] = 500;

        $display("Dynamic Array:");

        foreach(numbers[i])

            $display("numbers[%0d] = %0d",
                     i,numbers[i]);

    end

endmodule