module bidirectional_constraint;

    class Packet;

        rand bit [3:0] a;
        rand bit [3:0] b;

        constraint c {
            a == b + 10;
        }


    endclass

    Packet p;

    initial begin

        p = new();

        repeat(10) begin
            p.randomize();
            $display("a = %0d, b = %0d", p.a, p.b);
        end

    end

endmodule