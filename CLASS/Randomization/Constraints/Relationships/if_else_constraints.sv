module if_else_constraint;

    class Transaction;

        rand int mode;
        rand int data;

        constraint c {
            mode inside {[0:1]};

            if (mode == 0)
                data inside {[0:20]};
            else
                data inside {[80:100]};
        }

    endclass

    Transaction tr;

    initial begin

        tr = new();

        repeat(10) begin
            tr.randomize();

            $display("mode = %0d, data = %0d",
                     tr.mode, tr.data);
        end

    end

endmodule