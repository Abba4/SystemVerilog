class distributive_1bit;

    rand bit a;

    constraint c {
        a dist {0 := 30, 1 := 70};
    }

endclass

module top;

    distributive_1bit p;

    initial begin

        p = new();


        repeat(20) begin
            p.randomize();

            $display("a = %0d", p.a);
        end

    end

endmodule