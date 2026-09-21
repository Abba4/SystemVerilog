class even_num_contraint;

    rand bit [3:0] a;

    constraint c {
        a % 2 == 0;
    }

endclass

module even_num;

    even_num_contraint p;

    initial begin

        p = new();

        repeat(20) begin
            p.randomize();

            $display("a = %0d", p.a);
        end

    end

endmodule