module decode_2_4(output  [3:0] d_out,input [1:0] d_in,clk);

reg [3:0]tmp;
assign d_out=tmp;
initial begin
tmp<=4'b1;
end
always @(posedge clk)
begin
case(d_in)
0: begin end
1: tmp<=tmp<<1;
2: tmp<=tmp<<2;
3: tmp<=tmp<<3;
default: begin end
endcase
end
endmodule