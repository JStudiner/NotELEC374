<<<<<<< HEAD

=======
`timescale 1ns/10ps
>>>>>>> 873d53c1c01c22c7e7dc839d249f772f71dce159
module ALU_AddTB1(
input wire A,
output reg B
); 
<<<<<<< HEAD
reg [7:0] in_a;
reg [7:0] in_b;  //A and B
=======
reg [31:0] in_a;
reg clk;
reg [31:0] in_b;  //A and B
>>>>>>> 873d53c1c01c22c7e7dc839d249f772f71dce159
reg [4:0] in_c;  // select
reg clk;
wire [7:0] out_res_rc; // Output 
wire [7:0] Carryout;

<<<<<<< HEAD
initial begin 
    forever begin
    clk = 0;
    #10 clk = ~clk;
 end end

ALU test(in_a, in_b, in_c, out_res_rc, Carryout);
always@(posedge clk)

begin
    //in_a <= 5;
    in_b <= 2;
    in_c <= 0;
end

 
=======
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

>>>>>>> 873d53c1c01c22c7e7dc839d249f772f71dce159
endmodule 
