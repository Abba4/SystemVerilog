class transaction;
  rand bit i0, i1;
  rand bit sel;
  bit out;

  function void display();
    $display("\n >>> TRANSACTION CLASS <<<");
    $display("\n [transaction]:randomized input values of 2x1 mux are i0=[%0d], i1=[%0d], sel=[%0d]", i0, i1, sel);
    $display("[transaction]:default output value of 2x1 mux is out=[%0d]", out);
  endfunction
endclass