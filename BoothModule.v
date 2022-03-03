// This is the working Booth 1


module Booth(X, Y, Z, clk);
      input signed [15:0] X, Y;
		input wire clk;
       output signed [31:0] Z;
       reg signed [31:0] Z;
       reg [1:0] temp;
       integer i;
       reg E1;
       reg [15:0] Y1;
      
		 
       initial begin
       Z = 31'd0;
       E1 = 1'b0;
		 i=0;
		 end
		  always @ (X, Y );
       //for (i = 0; i < 4; i = i + 1) begin
		  always @ (posedge clk )
		  begin 
		  
		 if (i<16) begin
		
			temp = {X[i], E1};
			Y1 = - Y;
			case (temp)
				2'd1 : Z [31 : 16] = Z [31: 16] + Y; // if pair is "01" add Y
				2'd2 : Z [31 : 16] = Z [31: 16] + Y1;  // if pair is "10" add -Y
			default : begin end // if "00" or "11" keep the pre existing 0
			endcase
		 
			Z = Z >> 1; // shift over 16 bits to "lock: in another bit
       
			Z[31] = Z[30]; // sign extend last bit after shift 
      
			E1 = X[i]; //shift over left side of bit pair by 1
       
			if (Y == 16'd16)begin
         
               Z = - Z;
			end
			i=i+1; // increase index by 1 
			
		 
		end
	end 
       
endmodule

