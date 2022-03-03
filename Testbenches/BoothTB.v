module BoothTB(
input wire M,
output reg N
);



    // Inputs
    reg [15:0] A;
    reg [15:0] B;
	 reg clk1;

    wire [31:0] C;
	 
	 initial 
begin
       clk1 = 0;  
end
always
#10 clk1 = ~ clk1; 

    // Instantiate the Unit Under Test (UUT)
    Booth uut(A,B,C,clk1);
	
    initial begin
        // Initialize Inputs
        
        A= 5;
        B= 7;

    end
      
endmodule

