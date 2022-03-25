module encoder_32_5(
    output reg [4:0] S,
    input wire [31:0] i,
    input wire [15:0] RegIn,
    input wire inport1Enable,
    input wire clk
);
reg [31:0]comboSig;
always @(clk)
begin
comboSig[15:0]<=RegIn;
comboSig[24:16]<=i[31:16];
comboSig[25]<=inport1Enable;
comboSig[31:25]<=0;
case(comboSig)
32'h01: S<=5'b00000;
32'h02: S<=5'b00001;
32'h04: S<=5'b00010;
32'h08: S<=5'b00011;
32'h10: S<=5'b00100;
32'h20: S<=5'b00101;
32'h40: S<=5'b00110;
32'h80: S<=5'b00111;
32'h100: S<=5'b01000;
32'h200: S<=5'b01001;
32'h400: S<=5'b01010;
32'h800: S<=5'b01011;
32'h1000: S<=5'b01100;
32'h2000: S<=5'b01101;
32'h4000: S<=5'b01110;
32'h8000: S<=5'b01111;
32 'h10000: S<=5'b10000;
32 'h20000: S<=5'b10001;
32 'h40000: S<=5'b10010;
32 'h80000: S<=5'b10011;
32 'h100000: S<=5'b10100;
32 'h200000: S<=5'b10101;
32 'h400000: S<=5'b10110;
32 'h800000: S<=5'b10111;
32 'h2000000: S<=5'b11001;
32 'h4000000: S<=5'b11010;
default: begin end
endcase
end
endmodule
