module pass_by_val;

    logic [3:0] a, b, res;

    function int sum(input [3:0] a, b);

        a = a + b;

        $display("Inside function: a = %0d", a);

        return a + b;

    endfunction

    initial begin

        a = 5;
        b = 3;

        res = sum(a, b);

        $display("Outside function: a = %0d, b = %0d, res = %0d",
                 a, b, res);

    end

endmodule