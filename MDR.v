module MDR( 
    input wire clr,
    input wire Clk,
    input wire MDRin, 
    input wire [31:0] MDMux,
    output reg [31:0] toBus
);
    always@(posedge clk or negedge clr) begin
        if (clr) begin
            toBus [31:0] <= 32'b0;
        end
        else if(enable) begin
            q[31:0]<=d[31:0];
        end

    end 

endmodule