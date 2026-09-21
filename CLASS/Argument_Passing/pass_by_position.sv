module pass_by_position;

    function automatic int sum(
        input int a,
        input int b,
        input int c
    );
        return a + b + c;
    endfunction

    initial begin
        $display("Result = %0d", sum(10, 20, 30));
    end

endmodule