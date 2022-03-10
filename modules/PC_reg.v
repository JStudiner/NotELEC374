module PC_reg(
    input wire clk,
    input wire clr,
    input wire enable,
    input wire incPC,
    input wire [31:0] d,
    output reg [31:0] q
);
    always@(clk) begin
        if (clr) begin
            q[31:0] <= 32'b0;
        end
        else if(enable) begin
            q[31:0]<=d[31:0];
        end
        if(incPC) begin
            q<=q+1;
        end
    end 
endmodule


// somewhere in ur datapath module, 
//reg_32bit R1(clk, clr, r1_enable, bus_contents, r1_data_out);
//reg_32bit Zlow(clk, clr, Z_enable, bus_contents, Zlow_data_out);