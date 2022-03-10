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

reg [31:0] temp;
reg [1:0] last;
integer i;


always @(clk)

 begin
    
     case(ALU_Sel)
     0 : ALU_Out <= A + B; // addition
     1 : ALU_Out <= B - A; // Subtraction
     2 : ALU_Out <= A / B; // Division
     3 : ALU_Out <= A & B; // Logical AND
     4 : ALU_Out <= A | B; // Logical OR
     5 : ALU_Out <= A ^ B; // Logical XOR
     6 : ALU_Out<=  A*B;       //Booth_out; // Logical MUL
	  7 : ALU_Out <= B>>1; // Shift right operator
	  8 : ALU_Out <= B<<1; // Shift left operator
	  
	  9 : begin				  // Rotate right logic
				temp = B;
			for( i = 0; i < A%32; i=i+1)begin
				
				last = B[0];
				temp = temp>>1;
				temp[31] = last;
				end
				ALU_Out <= temp;
			end
			
		10 : begin				  // Rotate left logic
				temp = B;
			for( i = 0; i < A%32; i=i+1)begin
				
				last = B[31];
				temp = temp<<1;
				temp[0] = last;
				end
				ALU_Out <= temp;
			end
		11 : begin 
				temp = A;
				temp = ~temp;
				temp = temp +1;
				ALU_Out <= temp;
		
			  end 
		12 : begin
				temp = A;
				temp = !temp;
				ALU_Out <= temp;
			  end 
	  
     default: begin 

     end
     endcase
     ALU_low<=ALU_Out [31:0];
    ALU_high<= ALU_Out [63:32];
 end
endmodule