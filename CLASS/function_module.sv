module function_module;

    // Static variable
    int count;
    //automatic int auto_count;
    //int auto_count;

    function void static_function();
        count = count + 1;
        $display("Static count = %0d", count);
    endfunction

    // Automatic function
    function automatic void automatic_function();
        int auto_count;
        auto_count = auto_count + 1;
        $display("automatic count = %0d", auto_count);
    endfunction

    initial begin

        static_function();
        static_function();
        static_function();

        $display("");

        automatic_function();
        automatic_function();
        automatic_function();

    end

endmodule