module pass_by_name;

    function automatic int sum(
        input int a,
        input int b,
        input int c
    );
        return a + b + c;
    endfunction

    initial begin

        $display("Result = %0d",
                 sum(.c(30), .a(10), .b(20)));

    end

endmodule