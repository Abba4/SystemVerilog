module nested_class;

    class Car;

        string brand;
        int speed;

        class Engine;

            int horsepower;

            function void display();
                $display("Engine horsepower = %0d", horsepower);
            endfunction

        endclass

        Engine engine;

        function void display();
            $display("Car brand = %s", brand);
            $display("Car speed = %0d", speed);
            engine.display();
        endfunction

    endclass


    Car car;

    initial begin

        car = new();
        car.engine = new();

        car.brand = "Toyota";
        car.speed = 120;
        car.engine.horsepower = 150;

        car.display();

    end

endmodule