
module RCAdd_tb; 
reg [7:0] in_a, in_b;  //A and B
reg [4:0] in_c         // select
wire [7:0] out_res_rc; // Output 
wire [7:0] Carryout

initial 
begin 
in_a => 5
in_b => 2
in_c => 0


end 
RCAdd ALU(in_a, in_b,in_c  out_res_rc,Carryout); 
endmodule 
