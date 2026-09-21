// class pattern1;
    
//     rand bit a;
//     rand bit b;

//     constraint c {a == b + 1; }

// endclass    

// module top;
//     pattern1 p;

//     initial begin
//         p = new();

//         repeat(20) begin
//             p.randomize();

//             $display("a = %0d", p.a);
//             $display("b = %0d", p.b);
//         end
//     end

// endmodule

class pattern1;

    rand bit a[13];

    constraint c {
        a[0] == 0;

        foreach (a[i])
            if (i > 0)
                a[i] != a[i-1];
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