module string_example;

    string str = "SystemVerilog";
    string str2 = "systemverilog";
    string num = "123";

    initial begin

        $display("Original String : %s", str);

        // Length
        $display("Length = %0d", str.len());

        // Character at index
        $display("Character at index 0 = %c", str.getc(0));

        // Replace character
        str.putc(0,"s");
        $display("After putc() = %s", str);

        // Substring
        $display("Substring = %s", str.substr(0,5));

        // Uppercase
        $display("Upper = %s", str.toupper());

        // Lowercase
        $display("Lower = %s", str.tolower());

        // Compare
        $display("compare = %0d", str.compare(str2));

        // Ignore case compare
        $display("icompare = %0d", str.icompare(str2));

        // String to integer
        $display("atoi = %0d", num.atoi());

    end

endmodule