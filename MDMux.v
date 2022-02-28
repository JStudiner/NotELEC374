module mux_2_to_1 #(parameter word_size =32)(
    output wire [31:0] mux_out,
    input wire [31:0] BusMuxOut,
    input wire [31:0] Mdatain,
    input wire  Read
); 
reg[31:0] temp;
assign mux_out=temp;
always @ (Read)
begin
case(Read)
    0 : temp <= BusMuxOut;
    1 : temp <= Mdatain;
endcase

    end
    endmodule


