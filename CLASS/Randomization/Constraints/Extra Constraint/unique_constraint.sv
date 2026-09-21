module unique_example;

    class Packet;

        rand int a;
        rand int b;
        rand int c;

        constraint limits {
            a inside {[0:10]};
            b inside {[0:10]};
            c inside {[0:10]};
        }

        constraint unique_values {
            unique {a, b, c};
        }

    endclass

    Packet p;

    initial begin

        p = new();

        repeat(5) begin
            p.randomize();

            $display("a=%0d b=%0d c=%0d",
                     p.a, p.b, p.c);
        end

    end

endmodule