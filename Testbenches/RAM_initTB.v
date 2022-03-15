module RAM_initTB(
    input wire A,
    output wire B
);
//reg [0:5] indx; 
reg [9:0] indx;
wire [31:0] instr;
reg clk;


initial 

begin
       clk = 0;  
end
always
#10 clk = ~ clk; 

init_RAM RAAAM(indx, instr, clk); 

    initial
        begin
         indx = 0;
        end

endmodule