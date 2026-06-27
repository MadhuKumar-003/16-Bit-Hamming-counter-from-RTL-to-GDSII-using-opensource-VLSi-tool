module hamming_counter (
    input  [15:0] in,
    output reg [4:0] out
);
    integer i;

    always @(*) begin
        // Initialize the count to 0 every time the input changes
        out = 5'd0;
        
        // Loop through all 16 bits and add them up
        for (i = 0; i < 16; i = i + 1) begin
            out = out + in[i];
        end
    end

endmodule
