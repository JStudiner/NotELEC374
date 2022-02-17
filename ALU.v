
module ALU #(parameter word_size =32)(
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [5:0] ALU_Sel,
    output wire [31:0] ALU_low,
    output wire [31:0] ALU_high,
    output wire CarryOut //carry out flag 
);

reg [31:0] ALU_Result;
wire [8:0] temp;
assign ALU_low = ALU_Result;

always @(ALU_Sel)
 begin
     case(ALU_Sel)
     0 : ALU_Result <= A + B; // addition
     1 : ALU_Result <= A - B; // Subtraction
     2 : ALU_Result <= A / B; // Division
     3 : ALU_Result <= A & B; // Logical AND
     4 : ALU_Result <= A | B; // Logical OR
     5 : ALU_Result <= A ^ B; // Logical XOR
     default: ALU_Result = 0;
     endcase
 end
endmodule
