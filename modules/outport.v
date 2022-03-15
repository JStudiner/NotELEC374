module outputUnit(input wire clr,clk,OutPortin,
input wire [31:0] D,
output reg [31:0] Q);
always @(posedge clk) begin
    if(OutPortin)begin
        Q<=D;
    end
    if(clr)begin
    Q<=0;
    end
end
endmodule