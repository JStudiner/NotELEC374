module Booth #(parameter word_size = 32);
    input signed [word_size] X,Y;
    input wire clk
    input wire clr
    output signed [7:0] Z

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
      always@(posedge clk or negedge clr) begin  
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
   end
 endfunction