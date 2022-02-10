module bus()
    wire[31:0] input_wire
    wire[4:0] output_wire
    input_wire[0] = R0out


    //MDR I/O
    input wire clr,
    input wire Clk,
    input wire MDRin, 
    input wire [31:0] MDMux,
    output reg [31:0] toBus

    //MDR MUX I/O
     output [word_size] mux_out
    input [word_size] BusMuxOut
    input [word_size] Mdatain
    input [1:0]       Read

    // ALU I/O
     input [word_size] A,B;
    input [4:0] ALU_Sel;
    output [7:0] ALU_Out; //AKA C
    output CarryOut //carry out flag 

    //simulated control signals coming from Control Unit
    R0in, R0out; R1in, R1out; ...; R15in, R15out; HIin; HIout; LOin; LOout; PCin, PCout; IRin; 
    Zin; Zhighout, Zlowout; Yin; MARin; MDRin, MDRout; Read; Mdatain[31..0]

    //Mandatory outputs
     R0, R1, ..., R15, HI, LO, IR, BusMuxOut, Z

    
    encoder_32_5 encoder()
endmodule