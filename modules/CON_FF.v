module CONFF (
    input [31:0] IR,
    input conIn,
    output reg Q,
    input [31:0] bus_contents,
    input clk
);
reg isZero;
wire [3:0] Decoded;
reg bit31;
reg A,B,C,D,E,F,G;
reg [1:0] unDecoded;
decode_2_4 decoder(Decoded,unDecoded,clk);
always @(IR)begin
    unDecoded<=IR[20:19];
    
end
always @(posedge clk) begin
    if(bus_contents==0)begin
        isZero<=1;
    end else begin
        isZero<=0;
    end
    bit31<=IR[31];
    A<=!isZero;
    B<=!bit31;
    C<=Decoded[0]&isZero;
    D<=Decoded[1]&A;
    E<=Decoded[2]&B;
    F<=Decoded[3]&bit31;
    G<=C|D|E|F;
    if(conIn)begin
        Q<=G;
    end
end
endmodule