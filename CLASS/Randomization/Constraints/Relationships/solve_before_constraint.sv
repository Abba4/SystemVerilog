module solve_before;

    class Packet;

        rand int a;
        rand int b;

        constraint c {
            a inside {[0:3]};
            b inside {[0:100]};

            b == a * 10;

            solve a before b;
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