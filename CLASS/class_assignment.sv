module class_assignment;

    class Student;

        string name;
        int score;

        function void display();
            $display("Name = %s, Score = %0d", name, score);
        endfunction

    endclass


    Student student1;
    Student student2;

    initial begin

        student1 = new();

        student1.name = "Ali";
        student1.score = 80;

        // Assign student1 to student2
        student2 = student1;

        $display("Before changing student2:");
        student1.display();
        student2.display();

        // Change student2
        student2.score = 95;

        $display("\nAfter changing student2:");
        student1.display();
        student2.display();

    end

endmodule