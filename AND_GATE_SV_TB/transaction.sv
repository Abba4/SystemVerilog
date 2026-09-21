class transaction;
    rand bit a;
    rand bit b;
    bit      y;

    function void display();
        $display("\n >>> TRANSACTION CLASS <<<");
        $display("[transaction]: a=%0b, b=%0b", a, b);
        $display("[transaction]: y=%0b", y);
    endfunction
endclass