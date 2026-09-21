module associative_array;

    int student_marks[string];

    initial begin

        // Insert values
        student_marks["John"]  = 85;
        student_marks["Alice"] = 92;
        student_marks["David"] = 78;

        // Access value
        $display("Alice = %0d", student_marks["Alice"]);

        // Display all values
        foreach(student_marks[name])
            $display("%s = %0d", name, student_marks[name]);

        // Check if key exists
        if(student_marks.exists("John"))
            $display("John exists.");

        // Number of elements
        $display("Total = %0d", student_marks.num());

        // Delete one entry
        student_marks.delete("David");

        // Delete entire array
        // student_marks.delete();

    end

endmodule