module union_example;

    union {

        int number;
        bit [31:0] bits;

    } data;

    initial begin

        data.number = 25;

        $display("Number = %0d", data.number);

        $display("Bits   = %032b", data.bits);

    end

endmodule

// module union_example2;

//     union {

//         int number;
//         byte bytes[4];

//     } data;

//     initial begin

//         data.number = 32'h12345678;

//         $display("Byte0 = %h", data.bytes[0]);
//         $display("Byte1 = %h", data.bytes[1]);
//         $display("Byte2 = %h", data.bytes[2]);
//         $display("Byte3 = %h", data.bytes[3]);

//     end

// endmodule