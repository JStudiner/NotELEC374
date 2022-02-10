
module encoder_32_5(
    output reg [4:0] o,
    input wire[31:0] i
);
always @(*)
case(i)
32'h01: o=5'b00000;
32'h02: o=5'b00001;
32'h04: o=5'b00010;
32'h08: o=5'b00011;
32'h10: o=5'b00100;
32'h20: o=5'b00101;
32'h40: o=5'b00110;
32'h80: o=5'b00111;
32'h100: o=5'b01000;
32'h200: o=5'b01001;
32'h400: o=5'b01010;
32'h800: o=5'b01011;
32'h1000: o=5'b01101;
32'h2000: o=5'b01110;
32'h4000: o=5'b01111;
32'h8000: o=5'b10000;
32 'h10000: o=5'b10001;
32 'h20000: o=5'b10010;
32 'h40000: o=5'b10011;
32 'h80000: o=5'b10100;
32 'h100000: o=5'b10101;
32 'h200000: o=5'b10110;
32 'h400000: o=5'b10111;
32 'h800000: o=5'b11000; 
default: o = 5'b11111;

endcase
endmodule;
