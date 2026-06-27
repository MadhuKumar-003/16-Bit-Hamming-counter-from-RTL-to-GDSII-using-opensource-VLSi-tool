`timescale 1ns / 1ps

module tb_hamming();

    // Inputs
    reg [15:0] in;

    // Outputs
    wire [4:0] out;

    // Instantiate the Unit Under Test (UUT)
    hamming_counter uut (
        .in(in), 
        .out(out)
    );

    // VCD Dumping for GTKWave
    initial begin
        $dumpfile("hamming_waveform.vcd"); 
        $dumpvars(0, tb_hamming);          
    end

    // Stimulus
    initial begin
        $display("-------------------------------------------");
        $display("Starting 16-Bit Hamming Counter Test...");
        
        // Test 1: All Zeros (Expected: 0)
        in = 16'b0000_0000_0000_0000;
        #10;
        $display("Input: %b | Count: %d", in, out);
        
        // Test 2: Single One (Expected: 1)
        in = 16'b0000_0000_0000_0001;
        #10;
        $display("Input: %b | Count: %d", in, out);

        // Test 3: Alternating Bits (Expected: 8)
        in = 16'b1010_1010_1010_1010;
        #10;
        $display("Input: %b | Count: %d", in, out);

        // Test 4: Random Pattern (Expected: 5)
        in = 16'b0001_1100_0010_0100;
        #10;
        $display("Input: %b | Count: %d", in, out);

        // Test 5: All Ones (Expected: 16)
        in = 16'b1111_1111_1111_1111;
        #10;
        $display("Input: %b | Count: %d", in, out);

        $display("Simulation Complete.");
        $display("-------------------------------------------");
        $finish; 
    end
endmodule
