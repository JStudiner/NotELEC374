`timescale 1ns/10ps
module ALU_AddTB1(
input wire A,
output reg B
); 
reg [31:0] in_a;
reg clk;
reg [31:0] in_b;  //A and B
reg [4:0] in_c;  // select
wire [7:0] out_res_rc; // Output 
wire [7:0] Carryout;

ALU test(in_a, in_b, in_c, out_res_rc, Carryout);
initial 
begin
       clk = 0;  
end
always
#10 clk = ~ clk; 
always@(posedge clk)
	begin
	 B=1;
    in_a <= 5;
    in_b <= 2;
    in_c <= 0;
	end

endmodule 
