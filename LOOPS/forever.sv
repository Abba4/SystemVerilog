module forever_loop;

    logic clk = 0;

    initial begin

        forever begin
            #5 clk = ~clk;
        end

    end

endmodule