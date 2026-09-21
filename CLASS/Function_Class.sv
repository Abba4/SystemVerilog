module function_class;

    class Counter;

        int value;

        static int static_count;

        function void increment();
            value++;
            $display("Object value = %0d", value);
        endfunction

        static function void static_increment();
            static_count++;
            $display("Static count = %0d", static_count);
        endfunction

    endclass


    Counter c1;
    Counter c2;

    initial begin

        c1 = new();
        c2 = new();

        $display("C1:");

        c1.increment();
        c1.increment();

        $display("");

        $display("C2:");

        c2.increment();

        $display("");

        $display("Static through class:");

        Counter::static_increment();

        $display("Static through class:");

        Counter::static_increment();

        $display("");

        $display("C1 calls static:");

        c1.static_increment();

        $display("C2 calls static:");

        c2.static_increment();

    end

endmodule