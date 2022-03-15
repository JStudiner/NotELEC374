module decode_4_16(output [15:0] d_out,input [3:0] d_in,clk);

reg [15:0] tmp;
assign d_out=tmp;
initial begin
    tmp<=16'b1;
end
always @(posedge clk)
begin
case(d_in)
0: begin end
1: tmp<=tmp<<1;
2: tmp<=tmp<<2;
3: tmp<=tmp<<3;
4: tmp<=tmp<<4;
5: tmp<=tmp<<5;
6: tmp<=tmp<<6;
7: tmp<=tmp<<7;
8: tmp<=tmp<<8;
9: tmp<=tmp<<9;
10: tmp<=tmp<<10;
11: tmp<=tmp<<11;
12: tmp<=tmp<<12;
13: tmp<=tmp<<13;
14: tmp<=tmp<<14;
15: tmp<=tmp<<15;
default: begin end
endcase
end
endmodule