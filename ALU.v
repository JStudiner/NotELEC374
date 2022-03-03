
module ALU #(parameter word_size =32)(
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [4:0] ALU_Sel,
    output reg [31:0] ALU_low,
    output reg [31:0] ALU_high,
    output wire CarryOut,
    input wire clk //carry out flag 
);
reg [63:0] ALU_Out;
wire [63:0] Booth_out;
Booth BoothMod(A,B,Booth_out,clk);

always @(clk)

 begin
    
     case(ALU_Sel)
     0 : ALU_Out <= A + B; // addition
     1 : ALU_Out <= A - B; // Subtraction
     2 : ALU_Out <= A / B; // Division
     3 : ALU_Out <= A & B; // Logical AND
     4 : ALU_Out <= A | B; // Logical OR
     5 : ALU_Out <= A ^ B; // Logical XOR
     6 : ALU_Out<=Booth_out;
     default: begin 

     end
     endcase
     ALU_low<=ALU_Out [31:0];
    ALU_high<= ALU_Out [63:32];
 end
endmodule
