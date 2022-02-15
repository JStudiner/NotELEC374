module mux_2_to_1 #(parameter word_size =32)(
    output [word_size] mux_out,
    input [word_size] BusMuxOut,
    input [word_size] Mdatain,
    input [1:0]       Read

); 
always @ (Read or Mdatain or BusMuxOut or mux_out )
begin

case(Read)
    0 : mux_out <= BusMuxOut;
    1 : mux_out <= Mdatain;
endcase

    end
    endmodule

