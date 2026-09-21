module struct_example;

    struct {

        int id;
        string name;
        bit passed;

    } student;

    initial begin

        student.id = 101;
        student.name = "Abubakar";
        student.passed = 1;

        $display("ID      = %0d", student.id);
        $display("NAME    = %s", student.name);
        $display("PASSED  = %0b", student.passed);

    end

endmodule