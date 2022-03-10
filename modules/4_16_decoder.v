module decode_4_16(output [15:0] d_out,input [3:0] d_in,clk);

parameter tmp=16'1;
assign d_out=tmp;

always @(posedge clk)
begin
case(d_in)
0: begin end
1: tmp<<1;
2: tmp<<2;
3: tmp<<3;
4: tmp<<4;
5: tmp<<5;
6: tmp<<6;
7: tmp<<7;
8: tmp<<8;
9: tmp<<9;
10: tmp<<10;
11: tmp<<11;
12: tmp<<12;
13: tmp<<13;
14: tmp<<14;
15: tmp<<15;
default: begin end
endcase
end
endmodule