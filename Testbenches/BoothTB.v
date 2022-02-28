module Booth_TB(
input wire X,Y
//input wire clk,
//output reg Z
); 
reg [7:0] in_X;
reg [7:0] in_Y;  //X and Y
reg clk;
wire [7:0] Z; // Output 


initial begin 
    forever begin
    clk = 0;
    #10 clk = ~clk;
 end end

ALU test(in_a, in_b, in_c, out_res_rc, Carryout);
always@(posedge clk)

begin
    in_X <= 5;
    in_Y <= 2;
    
end

 
endmodule 