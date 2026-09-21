module function_constraint;

    class Packet;

        rand int a;
        rand int b;

        function int double_value(int x);
            return x * 2;
        endfunction

        constraint c {
            b == double_value(a);
        }

    endclass

    Packet p;

    initial begin

        p = new();

        repeat(5) begin
            p.randomize();

            $display("a = %0d, b = %0d",
                     p.a, p.b);
        end

    end

endmodule