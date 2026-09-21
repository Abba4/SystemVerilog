`include "interface.sv"
`include "dut.sv"
`include "program_block.sv"

module top;
    logic clk;

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    cmp_if inter(clk);
    cmp_tb tb(inter);
    cmp_4bit dut(inter);

    initial begin
        $shm_open("waves.shm");
        $shm_probe("AS");
    end
endmodule