module R0_reg#(parameter val)(
    input wire clk,
    input wire clr,
   // input wire enable, 
    input wire R0in,
    input wire BAout,
    input wire [31:0] d,
    output reg [32:0] BusMuxIn_R0
     
);
reg [31:0] q;
reg [32:0] temp;
reg A;
    always@(clk) begin
        if (clr) begin
            q[31:0] <= 32'b0;
        end
        else if(R0in) begin
            q[31:0]<=d[31:0];
        end
        A<= !BAout;
        BusMuxIn_R0<= A & q;
    end 
    initial BusMuxIn_R0=val;
endmodule