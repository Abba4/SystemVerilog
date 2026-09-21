module three_d_array;

    int arr[3][3][3] = '{
        // Layer 0
        '{
            '{1, 2, 3},
            '{4, 5, 6},
            '{7, 8, 9}
        },

        // Layer 1
        '{
            '{10, 11, 12},
            '{13, 14, 15},
            '{16, 17, 18}
        },

        // Layer 2
        '{
            '{19, 20, 21},
            '{22, 23, 24},
            '{25, 26, 27}
        }
    };

    initial begin

        $display("arr[0][0][0] = %0d", arr[0][0][0]);
        $display("arr[1][2][1] = %0d", arr[1][2][1]);
        $display("arr[2][0][2] = %0d", arr[2][0][2]);

        // Display entire array
        foreach (arr[i,j,k])
            $display("arr[%0d][%0d][%0d] = %0d",
                     i, j, k, arr[i][j][k]);

    end

endmodule