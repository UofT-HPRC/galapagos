// Credit for this approach belongs to Camilo
// Remember to add 1 to the output!
// Credit for this approach belongs to Camilo
module one_hot_decoder #(
    parameter ONE_HOT_WIDTH = 256, // Must be a power of 2
    localparam BINARY_WIDTH = $clog2(ONE_HOT_WIDTH)
)
(
    input [ONE_HOT_WIDTH-1:0] i_one_hot, 
    output [BINARY_WIDTH-1:0] o_binary
);
    // Declarations
    wire [(ONE_HOT_WIDTH>>1)-1:0] bit_concat [BINARY_WIDTH-1:0];

    // Compare the bits with 0
    genvar i;
    genvar j;
    generate
        for (i = 0; i < BINARY_WIDTH; i = i + 1)
            assign o_binary[i] = (bit_concat[i] == 0) ? 0 : 1;
    endgenerate

    // Concatenate bits
    generate
        for (i = BINARY_WIDTH-1; i >= 0; i = i - 1) begin
            for (j = 0; j < (1 << (BINARY_WIDTH-1-i)); j = j + 1) begin
                assign bit_concat[i][j*(1<<i)+:(1<<i)] = i_one_hot[((1<<i)+(j <<(i+1)))+:(1<<i)];
            end
        end
    endgenerate
endmodule