module Seven_Seg_Display_Out(
    output reg[7:0] 7SegOut,
    input clk,
    input [3:0] dataIn
);
always @(clk)
begin
case (dataIn[3:0])
4'b0000 : 7SegOut <= 8'b11000000;
4'b0001 : 7SegOut <= 8'b11111001;
4'b0010 : 7SegOut <= 8'b10100100;
4'b0011 : 7SegOut <= 8'b10110000;
4'b0100 : 7SegOut <= 8'b10011001;
4'b0101 : 7SegOut <= 8'b10010010;
4'b0110 : 7SegOut <= 8'b10000010;
4'b0111 : 7SegOut <= 8'b11111000;
4'b1000 : 7SegOut <= 8'b10000000;
4'b1001 : 7SegOut <= 8'b10010000;
4'b1010 : 7SegOut <= 8'b10001000;
4'b1011 : 7SegOut <= 8'b10000011;
4'b1100 : 7SegOut <= 8'b11000110;
4'b1101 : 7SegOut <= 8'b10100001;
4'b1110 : 7SegOut <= 8'b10000110;
4'b1111 : 7SegOut <= 8'b10001110;
endcase
end
endmodule
