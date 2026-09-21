module immediate_assertions(alu_if.tb inter);

    always @(posedge inter.clk) begin

        // ----------------------------------
        // 1. ACK must not occur without REQ
        // ----------------------------------

        if (inter.ack) begin

            assert (inter.req)
            else
                $error(
                    "[IMMEDIATE ASSERTION] ACK occurred without REQ"
                );

        end


        // ----------------------------------
        // 2. Result should not be X when ACK
        // ----------------------------------

        if (inter.ack) begin

            assert (!$isunknown(inter.result))
            else
                $error(
                    "[IMMEDIATE ASSERTION] RESULT is X/Z when ACK is high"
                );

        end


        // ----------------------------------
        // 3. Opcode must be valid
        // ----------------------------------

        if (inter.req) begin

            assert (inter.opcode inside {[3'b000:3'b111]})
            else
                $error(
                    "[IMMEDIATE ASSERTION] Invalid opcode"
                );

        end


        // ----------------------------------
        // 4. One-hot example
        // ----------------------------------

        // Example vector formed from ACK/REQ.
        // This checks that at most one of them is high.

        assert (
            $onehot0({inter.req, inter.ack})
        )
        else
            $error(
                "[IMMEDIATE ASSERTION] REQ and ACK are high together"
            );

    end

endmodule