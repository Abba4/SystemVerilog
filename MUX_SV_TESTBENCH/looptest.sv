module top;
    int arr[3][4];

    initial begin
        // for (real r = 0.0; r < 1.0; r += 0.1) begin
        // $display("r=%f", r);
        // end
        // typedef enum {A, B, C, D} state_t;
        // for (state_t s = A; s != D; s = s.next()) begin
        //    $display("s=%s", s.name());
        //arr = '{3,4,5,6};
        // foreach (arr[i]) begin
        //     $display("arr[%0d]=%0d", i, arr[i]);
        // end
        //for(int i=0;i<3;i++) begin
        // foreach(arr[i]) begin
        //     foreach (arr[j]) begin
        //         $display("arr[i]=%0d, arr[j]=%0d", i,j);
        //     end
        //     // for(int j=0;j<4;j++) begin
        //     //    $display("arr[i]=%0d, arr[j]=%0d", i*2,j*3);
        //     // end
        // end
        int data[] = '{4,3,1};

        int result;

        result =  data.or();

        $display("Result=%0b", result);

    end

endmodule