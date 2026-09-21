module distribution_constraint;

    class Packet;

        rand int value;

        constraint c {
            value dist {
                0 := 20,
                1 := 50,
                2 := 30
            };
        }

    endclass

    Packet p;

    initial begin

        p = new();

        repeat(20) begin
            p.randomize();
            $display("value = %0d", p.value);
        end

    end

endmodule