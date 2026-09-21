module queue_array;

    int q[$];

    initial begin

        // Push back
        q.push_back(10);
        q.push_back(20);
        q.push_back(30);

        // Push front
        q.push_front(5);

        $display("Queue = %p", q);

        // Pop front
        $display("Pop Front = %0d", q.pop_front());

        // Pop back
        $display("Pop Back = %0d", q.pop_back());

        $display("Queue = %p", q);

        // Insert
        q.insert(1,100);

        // Delete
        q.delete(0);

        $display("Final Queue = %p", q);

    end

endmodule