module cmp_4bit(cmp_if.dut inter);
    logic pending;

    always_ff @(posedge inter.clk) begin
        if (inter.rst) begin
            pending <= 1'b0;
            inter.gt <= 1'b0;
            inter.eq <= 1'b0;
            inter.lt <= 1'b0;
        end
        else begin
            pending <= inter.req;
            if (inter.req) begin
                inter.gt <= (inter.a > inter.b);
                inter.eq <= (inter.a == inter.b);
                inter.lt <= (inter.a < inter.b);
            end
        end
    end

    assign inter.ack = pending;
endmodule