module constraint_mode_example;

    class Packet;

        rand int value;

        constraint limit {
            value inside {[0:10]};
        }

    endclass

    Packet p;

    initial begin

        p = new();

        repeat(5) begin

            p.randomize();

            $display("value = %0d", p.value);

        end

        // Disable constraint
        p.limit.constraint_mode(0);

        $display("Constraint disabled");

        repeat(5) begin

            p.randomize();

            $display("value = %0d", p.value);

        end

    end

endmodule