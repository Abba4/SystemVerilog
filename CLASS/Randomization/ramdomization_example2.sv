class sample;

rand bit [4:0] a;
rand bit [3:0] b;
rand bit [3:0] c;

    constraint a_value {a==b+c;}
    constraint b_value {b > 8;}
    contraint c_value {c < 6;}

function void display();
    $display("a = %0d, b = %0d, c = %0d", a, b, c);
endfunction

endclass

module bidirectional_constraint;

    sample s;

    initial begin

        s = new();

        repeat(10) begin

            if (s.randomize())
                s.display();
            else
                $display("Randomization failed");

        end

    end
endmodule