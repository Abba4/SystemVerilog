class transaction;

    int a;
    int b;

endclass


module tb;

    transaction t1;
    transaction t2;

    initial begin

        t1 = new();
        t2 = new();

        t1.a = 10;
        t1.b = 20;

        t2.a = 100;
        t2.b = 200;

        $display("t1: a=%0d b=%0d", t1.a, t1.b);
        $display("t2: a=%0d b=%0d", t2.a, t2.b);

    end

endmodule