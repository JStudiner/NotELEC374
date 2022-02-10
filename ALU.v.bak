module ALU #(parameter word_size =8)(
    input [word_size] A,B;
    input [4:0] ALU_Sel;
    output [7:0] ALU_Out;
    output CarryOut //carry out flag 
)

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


 function int Booth(X,Y );
   input signed [word_size] X,Y;
   reg signed [7:0] Z;
   reg [1:0] temp
   integer i;
   reg E1;
   reg [word_size] Y1;

   always @ (X,Y)
   begin
    Z = 8'd0 // Z is set to 8 0 bits
    E1 = 1'd0 // E1 set to 0 bit
    for (i =0; i<4; i=i+1)
    begin 
       temp = {X[i], E1} // the pair of the right most bit and a zero
       Y1 = -Y
    case(temp)
    2'd2 : Z[7:4] = Z[7:4] + Y1
    2'd1 : Z[7:4] = Z:[7:4] +Y
    default : begin end
    endcase

    Z = Z>>1
    Z[7] = Z[6];
    E1 = X[i] // shifts over bit pair being check to the left by 1

   end
   if (Y == 4'd8)
   begin 
       Z=-Z
   end

   end 
   Booth = Z
 endfunction





    
endmodule
