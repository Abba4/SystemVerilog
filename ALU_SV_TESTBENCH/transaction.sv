class alu_transaction;

    rand bit [2:0] opcode;
    rand bit [7:0] a;
    rand bit [7:0] b;

    bit [8:0] result;


    constraint valid_opcode {

        opcode inside {[0:7]};

    }


    function void display();

        $display("\n >>> ALU TRANSACTION CLASS <<<");

        $display(
            "[transaction]: opcode=%0d, a=%0d, b=%0d",
            opcode,
            a,
            b
        );

        $display(
            "[transaction]: result=%0d",
            result
        );

    endfunction

endclass