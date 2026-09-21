module two_d_array;

    int arr[3][3] = '{
        '{1, 2, 3},
        '{4, 5, 6},
        '{7, 8, 9}
    };

    initial begin

        $display("arr[0][0] = %0d", arr[0][0]);
        $display("arr[1][2] = %0d", arr[1][2]);
        $display("arr[2][1] = %0d", arr[2][1]);

        // Display entire array
        foreach (arr[i,j])
            $display("arr[%0d][%0d] = %0d",
                     i, j, arr[i][j]);

    end

endmodule