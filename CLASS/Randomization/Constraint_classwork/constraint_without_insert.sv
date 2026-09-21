class constraint_without_insert;
    rand int a;
    constraint c1 {
        a > 50; 
        a < 100;
    }
endclass

module top;

    constraint_without_insert p;

    initial begin

        p = new();

        repeat(5) begin
            p.randomize();

            $display("a = %0d", p.a);
        end

    end

endmodule