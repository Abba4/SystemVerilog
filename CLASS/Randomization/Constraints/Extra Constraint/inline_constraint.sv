module inline_example;

    class Packet;

        rand int a;
        rand int b;

        constraint c {
            a inside {[0:100]};
            b inside {[0:100]};
        }

    endclass

    Packet p;

    initial begin

        p = new();

        // Normal randomization
        p.randomize();

        $display("Normal: a=%0d b=%0d", p.a, p.b);

        // Inline constraint
        p.randomize() with {
            a == 50;
            b > 70;
        };

        $display("Inline: a=%0d b=%0d", p.a, p.b);

    end

endmodule