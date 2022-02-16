module mux_2_to_1 #(parameter word_size =32)(
    output reg [31:0] mux_out,
    input wire [31:0] BusMuxOut,
    input wire [31:0] Mdatain,
    input wire [1:0]       Read

); 
always @ (Read or Mdatain or BusMuxOut or mux_out )
begin

case(Read)

    0 : mux_out <= BusMuxOut;
    1 : mux_out <= Mdatain;
endcase

    end
    endmodule


