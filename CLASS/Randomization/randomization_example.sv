module randomization_example;

    class Transaction;

        rand logic [3:0] a;
        rand logic [3:0] b;
        rand logic [1:0] opcode;

        constraint valid_values {
            a inside {[0:15]};
            b inside {[0:15]};
            opcode inside {[0:3]};
        }

        function void display();
            $display("a = %0d, b = %0d, opcode = %0d",
                     a, b, opcode);
        endfunction

    endclass


    Transaction tr;

    initial begin

        tr = new();

        repeat(10) begin

            if (tr.randomize())
                tr.display();
            else
                $display("Randomization failed");

        end

    end

endmodule