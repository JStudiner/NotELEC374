module ram(input Read,Write, input [7:0] Address,input [31:0] dataIn,output reg [31:0] dataOut,clk);
reg[31:0] memory[0:511];
always @(posedge clk) begin
    if(Write) begin
        memory[Address]<=dataIn;
    end
    else if(Read) begin
        dataOut<=memory[Address];
    end
end
endmodule
 