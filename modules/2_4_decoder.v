module decode_2_4(output reg [3:0] d_out,input [1:0] d_in,clk);

parameter tmp=4'1;
assign d_out=tmp;

always @(posedge clk)
begin
case(d_in)
0: begin end
1: tmp<<1;
2: tmp<<2;
3: tmp<<3;.
default: begin end
endcase
end
endmodule