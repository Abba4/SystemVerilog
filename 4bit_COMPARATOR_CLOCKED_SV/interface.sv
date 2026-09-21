interface cmp_if;
    logic       rst;
    logic       req;
    logic       ack;
    logic [3:0] a;
    logic [3:0] b;
    logic       gt;
    logic       eq;
    logic       lt;

    modport dut (
    input clk, rst, req, a, b,
    output ack, gt, eq, lt
    );

    modport tb (
    input clk, rst, ack, gt, eq, lt,
    output req, a, b
    );

endinterface