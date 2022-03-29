module decode_4_16(output reg [15:0] d_out,input [3:0] d_in,input wire clk);

initial begin
    d_out<=16'b0;
end
always @(clk)
begin
case(d_in)
0: d_out<=16'h1;
1: d_out<=16'h2;
2: d_out<=16'h4;
3: d_out<=16'h8;
4: d_out<=16'h10;
5: d_out<=16'h20;
6: d_out<=16'h40;
7: d_out<=16'h80;
8: d_out<=16'h100;
9: d_out<=16'h200;
10: d_out<=16'h400;
11: d_out<=16'h800;
12: d_out<=16'h1000;
13: d_out<=16'h2000;
14: d_out<=16'h4000;
default: d_out<=16'h0;
endcase
end
endmodule