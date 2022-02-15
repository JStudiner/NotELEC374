module ALU #(parameter word_size =32)(
    input [word_size] A,B,
    input [4:0] ALU_Sel,
    output [7:0] ALU_Out,
    output CarryOut //carry out flag 
);

reg [7:0] ALU_Result;
wire [8:0] temp;
assign ALU_Out = ALU_Result;

always @(*)
 begin
     case(ALU_Sel)
     0 : ALU_Result <= A + B; // addition
     1 : ALU_Result <= A - B; // Subtraction
     2 : ALU_Result <= A / B; // Division
     3 : ALU_Result <= A & B; // Logical AND
     4 : ALU_Result <= A | B; // Logical OR
     5 : ALU_Result <= A ^ B; // Logical XOR
     
     
     default: ALU_Result = A;
     endcase
 end
    
endmodule
