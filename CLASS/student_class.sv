module class_example;

    class Student;

        string name;
        int age;
        int score;

        function void display();
            $display("Name  = %s", name);
            $display("Age   = %0d", age);
            $display("Score = %0d", score);
        endfunction

    endclass


    Student student;

    initial begin

        // Create the object
        student = new();

        // Assign values
        student.name  = "Abubakar";
        student.age   = 22;
        student.score = 85;

        // Call the class method
        student.display();

    end

endmodule