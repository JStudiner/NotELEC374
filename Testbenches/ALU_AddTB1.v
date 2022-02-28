
module ALU_AddTB1(
input wire A,
output reg B
); 
reg [7:0] in_a;
reg [7:0] in_b;  //A and B
reg [4:0] in_c;  // select
reg clk;
wire [7:0] out_res_rc; // Output 
wire [7:0] Carryout;

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

 
endmodule 
