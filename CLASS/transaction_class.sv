class transaction;

    int a;
    int b;
    int result;

endclass


module tb;

    transaction t1;

    initial begin

        t1 = new();

        t1.a = 10;
        t1.b = 5;
        t1.result = t1.a + t1.b;

        $display("A      = %0d", t1.a);
        $display("B      = %0d", t1.b);
        $display("Result = %0d", t1.result);

    end

endmodule