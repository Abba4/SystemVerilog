class cmp_transaction;
    rand bit [3:0] a;
    rand bit [3:0] b;

    bit gt;
    bit eq;
    bit lt;

    function void display();
        $display("\n >>> CMP TRANSACTION CLASS <<<");
        $display("[transaction]: a=%0d, b=%0d", a, b);
        $display("[transaction]: gt=%0b eq=%0b lt=%0b", gt, eq, lt);
    endfunction
endclass