module inputUnit(input wire clr,clk,strobe,input wire [31:0] D,output reg [31:0] Q);
always @(posedge strobe) begin
    if(strobe)begin
        Q<=D;
    end
    if(clr)begin
    Q<=0;
    end
end
endmodule