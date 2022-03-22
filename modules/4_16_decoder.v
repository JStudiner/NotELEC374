module decode_4_16(output [15:0] d_out,input [3:0] d_in,input wire clk);
reg [15:0] tmp;
assign d_out=tmp;
initial begin
    tmp<=16'b0;
end
always @(clk)
begin
case(d_in)
0: tmp<=4'h1;
1: tmp<=4'h2;
2: tmp<=4'h4;
3: tmp<=4'h8;
4: tmp<=4'h10;
5: tmp<=4'h20;
6: tmp<=4'h40;
7: tmp<=4'h80;
8: tmp<=4'h100;
9: tmp<=4'h200;
10: tmp<=4'h400;
11: tmp<=4'h800;
12: tmp<=4'h1000;
13: tmp<=4'h2000;
14: tmp<=4'h4000;
15: tmp<=4'h8000;
default: tmp<=0;
endcase
end
endmodule