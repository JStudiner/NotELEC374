module Booth #(parameter word_size = 32)(
  input signed [word_size:0] X,Y,
  input wire clk,
  input wire clr,
  output reg [7:0] Z
);
   reg [1:0] temp;
   integer i;
   reg E1;
   reg [word_size:0] Y1;
  reg [7:0] Booth;
   always @ (X,Y)
  begin
    Z = 8'd0; // Z is set to 8 0 bits
    E1 <= 1'd0; // E1 set to 0 bit
    for (i =0; i<4; i=i+1);
   end
    always@(posedge clk or negedge clr)
  begin 
       temp = {X[i], E1}; // the pair of the right most bit and a zero
       Y1 = -Y;
    case(temp)
    2'd2 : Z[7:4] = Z[7:4] + Y1;
    2'd1 : Z[7:4] = Z[7:4] +Y;
    default: Z[7:4] = 0;
    endcase
    Z = Z>>1;
    Z[7] = Z[6];
    E1 = X[i]; // shifts over bit pair being check to the left by 1
   if (Y == 4'd8)
   begin 
       Z=-Z;
   end
   Booth = Z;
  end
endmodule
 /*function int Booth(X,Y );
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
    for (i =0; i<4; i=i+2) //move 2 bits over on each iteration
    begin 
       temp = {X[i+1], X[i], E1} // the pair of the 2 right most bit and a zero
       Y1 = -Y
    case(temp)
    
    3'd1 : Z[7:4] = Z:[7:4] +Y
    3'd2 : Z[7:4] = Z:[7:4] +Y
    3'd3 : Z[7:4] = Z:[7:4] +Y +Y1
    3'd4 : Z[7:4] = Z:[7:4] +Y1+Y1
    3'd5 : Z[7:4] = Z:[7:4] +Y1
    3'd6 : Z[7:4] = Z:[7:4] +Y1



    default : begin end
    endcase

    Z = Z>>2 // not 100% sure
    Z[7] = Z[6]; // bit extend
    E1 = X[i+1] // shifts over bit pair being check to the left by 2

   end
   if (Y == 4'd8) //if 8th bit is 1 the Z output is 0 
   begin 
       Z=-Z
   end

   end 
   Booth = Z
 endfunction
 */