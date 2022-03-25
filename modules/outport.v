module outputUnit(input wire clr,input wire clk,input OutPortin,
input wire [31:0] D,
output reg [31:0] Q);
always @(clk) begin
    if(OutPortin)begin
        Q<=D;
    end
    if(clr)begin
    Q<=0;
    end
end
endmodule