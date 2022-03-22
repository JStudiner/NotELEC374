module decode_2_4(output  [3:0] d_out,input [1:0] d_in,input wire clk);

reg [3:0]tmp;
assign d_out=tmp;
initial begin
tmp<=4'b0;
end
always @(clk)
begin
case(d_in)
0: tmp <=1'h1;
1: tmp<=1'h2;
2: tmp<=1'h4;
3: tmp<=1'h8;
default: begin end
endcase
end
endmodule