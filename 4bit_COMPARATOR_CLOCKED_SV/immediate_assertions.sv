module cmp_immediate_assertions(cmp_if.tb inter);

    always @(posedge inter.clk) begin
        if (inter.ack) begin
            assert ($onehot({inter.gt, inter.eq, inter.lt}))
            else $error("[IMM] Outputs not one-hot when ACK");
        end

        assert ($onehot0({inter.req, inter.ack}))
        else $error("[IMM] REQ and ACK both high");
    end

endmodule