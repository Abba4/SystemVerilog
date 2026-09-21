module alu_dut(alu_if.dut inter);

    logic pending;


    always_ff @(posedge inter.clk) begin

        if (inter.rst) begin

            pending    <= 1'b0;
            inter.result <= 9'b0;

        end

        else begin

            pending <= inter.req;


            if (inter.req) begin

                case (inter.opcode)

                    3'b000: begin
                        inter.result <= {1'b0, inter.a}
                                      + {1'b0, inter.b};
                    end

                    3'b001: begin
                        inter.result <= {1'b0, inter.a}
                                      - {1'b0, inter.b};
                    end

                    3'b010: begin
                        inter.result <= {1'b0, (inter.a & inter.b)};
                    end

                    3'b011: begin
                        inter.result <= {1'b0, (inter.a | inter.b)};
                    end

                    3'b100: begin
                        inter.result <= {1'b0, (inter.a ^ inter.b)};
                    end

                    3'b101: begin
                        inter.result <= {1'b0, (inter.a << 1)};
                    end

                    3'b110: begin
                        inter.result <= {1'b0, (inter.a >> 1)};
                    end

                    3'b111: begin
                        inter.result <= {1'b0, inter.a};
                    end

                    default: begin
                        inter.result <= 9'bx;
                    end

                endcase

            end

        end

    end


    assign inter.ack = pending;

endmodule