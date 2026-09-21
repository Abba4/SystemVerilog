class parent;
  bit [31:0] data;
  function void display();
    $display("parent class:Data: %0d", data);
  endfunction
endclass

class child extends parent;
  bit [31:0] addr;
  function void display();
    super.display();
    $display("child class:Data, Addr: %0d, %0d", data, addr);
  endfunction
endclass

module top;
  child c;

  initial begin
    c = new();
    c.data = 20;
    c.addr = 30;

    c.display();
  end

endmodule