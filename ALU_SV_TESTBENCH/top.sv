`include "interface.sv"
`include "dut.sv"
`include "program_block.sv"

module top;

    logic clk;

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    alu_if inter(clk);

    alu_tb tb(inter);

    alu_dut dut(inter);

    initial begin
        $shm_open("waves.shm");
        $shm_probe("AS");
    end

endmodule

