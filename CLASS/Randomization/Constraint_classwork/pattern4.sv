class pattern1;

    rand int a[12];

    constraint c {
        foreach (a[i])
            if (i % 4 == 0 || i % 4 == 3)
                a[i] == 1;
            else
                a[i] == 2;
    }

endclass


module top;

    pattern1 p;

    initial begin
        p = new();

        if (p.randomize()) begin
            foreach (p.a[i])
                $write("%0d", p.a[i]);

            $display();
        end
    end

endmodule