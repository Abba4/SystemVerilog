class pattern1;

    rand int a[8];

    constraint c {
        foreach (a[i])
            if (i % 2 == 0)
                a[i] == 0;
            else
                a[i] == (i + 1);
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