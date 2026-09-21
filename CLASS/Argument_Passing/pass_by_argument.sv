module default_argument;

    function automatic int sum(
        input int a,
        input int b,
        input int c = 10
    );
        return a + b + c;
    endfunction

    initial begin

        $display("Result 1 = %0d", sum(10, 20));

        $display("Result 2 = %0d", sum(10, 20, 30));

    end

endmodule