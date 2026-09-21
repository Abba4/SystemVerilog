module static_constraint;

    class Packet;

        rand int value;

        static constraint limit {
            value inside {[0:10]};
        }

    endclass

    Packet p1;
    Packet p2;

    initial begin

        p1 = new();
        p2 = new();

        p1.randomize();
        p2.randomize();

        $display("p1 value = %0d", p1.value);
        $display("p2 value = %0d", p2.value);

    end

endmodule