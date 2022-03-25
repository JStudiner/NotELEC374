module inputUnit#(parameter val=0)(input wire clr,input wire clk,input wire strobe,output reg [31:0] Q,output reg inportEnable);
reg [31:0] D;
initial begin 
    D<=val;
end
always @(clk) begin
    if (strobe)begin
        inportEnable<=1;
    end
    else begin
        inportEnable<=0;
    end
    if(clr)begin
    Q<=0;
    end
end
endmodule