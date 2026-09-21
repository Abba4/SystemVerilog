class odd_num_constraint;

    rand bit [3:0] a;

    constraint c {
        a % 2 == 1;
    }

endclass

module odd_num;

    old_num_constraint p;

    initial begin

        p = new();

        repeat(20) begin
            p.randomize();

            $display("a = %0d", p.a);
        end

    end

endmodule