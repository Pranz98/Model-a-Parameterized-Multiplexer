module scale_mux_test;

    // Parameters
    localparam WIDTH = 8; // You can adjust this as needed

    // Testbench signals
    logic [WIDTH-1:0] in_a;
    logic [WIDTH-1:0] in_b;
    logic sel_a;
    logic [WIDTH-1:0] out;

    // Instantiate the multiplexer
    scale_mux #(.WIDTH(WIDTH)) uut (
        .in_a(in_a),
        .in_b(in_b),
        .sel_a(sel_a),
        .out(out)
    );

    initial begin
        // Initialize signals
        in_a = 8'b00000000;
        in_b = 8'b00000000;
        sel_a = 1'b0;

        // Apply test vectors
        #1 in_a = 8'h00; in_b = 8'h00; sel_a = 1'b0; #1; // 0ns
        $display("%0dns in_a=%h in_b=%h sel_a=%b out=%h", $time, in_a, in_b, sel_a, out);

        #1 sel_a = 1'b1; #1; // 1ns
        $display("%0dns in_a=%h in_b=%h sel_a=%b out=%h", $time, in_a, in_b, sel_a, out);

        #1 in_b = 8'hFF; sel_a = 1'b0; #1; // 2ns
        $display("%0dns in_a=%h in_b=%h sel_a=%b out=%h", $time, in_a, in_b, sel_a, out);

        #1 sel_a = 1'b1; #1; // 3ns
        $display("%0dns in_a=%h in_b=%h sel_a=%b out=%h", $time, in_a, in_b, sel_a, out);

        #1 in_a = 8'hFF; sel_a = 1'b0; #1; // 4ns
        $display("%0dns in_a=%h in_b=%h sel_a=%b out=%h", $time, in_a, in_b, sel_a, out);

        #1 sel_a = 1'b1; #1; // 5ns
        $display("%0dns in_a=%h in_b=%h sel_a=%b out=%h", $time, in_a, in_b, sel_a, out);

        #1 in_b = 8'hFF; sel_a = 1'b0; #1; // 6ns
        $display("%0dns in_a=%h in_b=%h sel_a=%b out=%h", $time, in_a, in_b, sel_a, out);

        #1 sel_a = 1'b1; #1; // 7ns
        $display("%0dns in_a=%h in_b=%h sel_a=%b out=%h", $time, in_a, in_b, sel_a, out);

        $display("MUX TEST PASSED");

        // End simulation
        $finish;
    end

    // Generate VCD file for waveform analysis
    initial begin
        $dumpfile("dump.vcd"); // Name of the VCD file
        $dumpvars(0, scale_mux_test); // Dump all variables in the testbench
    end

endmodule
