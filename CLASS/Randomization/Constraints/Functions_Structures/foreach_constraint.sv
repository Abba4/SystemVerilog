module foreach_constraint;

    class Packet;

        rand int data[5];

        constraint c {
            foreach(data[i])
                data[i] inside {[0:100]};
        }

    endclass

    Packet p;

    initial begin

        p = new();

        repeat(3) begin

            p.randomize();

            $display("data = %p", p.data);

        end

    end

endmodule