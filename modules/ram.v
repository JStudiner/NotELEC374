module ram(input Read,Write, input [7:0] Address,input [31:0] dataIn,output reg [31:0] dataOut,clk);
reg[31:0] memory[511:0];

initial
begin
  $readmemb("C:/Users/jstud/OneDrive/Desktop/ELEC374-CPU/modules/InitRAM.txt", memory);
end

always @(posedge clk) begin
    if(Write) begin
        memory[Address]<=dataIn;
    end
    else if(Read) begin
        dataOut<=memory[Address];
    end
end
endmodule
 