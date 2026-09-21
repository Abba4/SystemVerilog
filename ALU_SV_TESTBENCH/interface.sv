interface alu_if(input logic clk);

    logic rst;

    logic req;
    logic ack;

    logic [2:0] opcode;
    logic [7:0] a;
    logic [7:0] b;

    logic [8:0] result;


    modport dut (
        input  clk,
        input  rst,
        input  req,
        input  opcode,
        input  a,
        input  b,

        output ack,
        output result
    );


    modport tb (
        input  clk,
        input  rst,
        input  ack,
        input  result,

        output req,
        output opcode,
        output a,
        output b
    );

endinterface