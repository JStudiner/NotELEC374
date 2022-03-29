module ALU #(parameter word_size =32)(
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [5:0] ALU_Sel,
    output reg [31:0] ALU_low,
    output reg [31:0] ALU_high,
    output wire CarryOut,
    input wire clk //carry out flag 
);
reg[31:0]remainder;
reg [63:0] ALU_Out;
wire [63:0] Booth_out;
Booth BoothMod(A,B,Booth_out,clk);
reg [31:0] temp,temp1,temp2;
reg [1:0] last;
integer i;
always @(clk)
 begin
     case(ALU_Sel)
     0 : ALU_Out <= A + B; // addition
     1 : ALU_Out <= A-B; // Subtraction
     2 : begin
		 ALU_Out<=A/B;
		 remainder<=A%B;
	 	end  // Division
     3 : ALU_Out <= A & B; // Logical AND
     4 : ALU_Out <= A | B; // Logical OR
     5 : ALU_Out <= A ^ B; // Logical XOR
     6 : ALU_Out<=  A*B;       //Booth_out; // Logical MUL
	  7 : ALU_Out <= B>>1; // Shift right operator
	  8 : ALU_Out <= B<<1; // Shift left operator
	  
	  9 : begin		
			temp = B%32;
			temp1=(A>>temp)|(A<<(32-temp));
			ALU_Out<=temp1;
			end
			
		10 : begin				  // Rotate left logic
			temp = B%32;
			temp1=(A<<temp)|(A>>(32-temp));
			ALU_Out<=temp1;
			end
		11 : begin //negate
				temp = A;
				temp = ~temp;
				temp = temp +1;
				ALU_Out <= temp;
		
			  end 
		12 : begin //not
				temp = A;
				temp=~temp;
				ALU_Out <= temp;
			  end 
	  
     default: begin 

     end
     endcase
     ALU_low<=ALU_Out [31:0];
	 if (ALU_Sel==2)begin
		 ALU_high<=remainder;
	 end
	 else begin
		     ALU_high<= ALU_Out [63:32];
	 end
 end
endmodule