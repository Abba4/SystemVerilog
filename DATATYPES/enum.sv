module enum_example;

    enum {IDLE, READ, WRITE, DONE} state;

    initial begin

        $display("Default State = %s", state.name());

        state = READ;
        $display("Current State = %s", state.name());

        state = WRITE;
        $display("Current State = %s", state.name());

        state = DONE;
        $display("Current State = %s", state.name());

    end

endmodule

module enum_integer_example;

    enum {RED, GREEN, BLUE} color;

    initial begin

        color = RED;
        $display("RED   = %0d", color);

        color = GREEN;
        $display("GREEN = %0d", color);

        color = BLUE;
        $display("BLUE  = %0d", color);

    end

endmodule