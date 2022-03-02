
module ALU #(parameter word_size =32)(
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [4:0] ALU_Sel,
    output reg [31:0] ALU_low,
    output reg [31:0] ALU_high,
    output wire CarryOut,
    input wire clk //carry out flag 
);

always @(clk)
 begin
    
    ALU_high<=0;
     case(ALU_Sel)
     0 : ALU_low <= A + B; // addition
     1 : ALU_low <= A - B; // Subtraction
     2 : ALU_low <= A / B; // Division
     3 : ALU_low <= A & B; // Logical AND
     4 : ALU_low <= A | B; // Logical OR
     5 : ALU_low <= A ^ B; // Logical XOR
     default: begin end
     endcase
 end
endmodule
