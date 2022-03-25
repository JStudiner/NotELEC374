module SelectAndEncode(
input wire[3:0] Gra,Grb,Grc,
input wire Rin,Rout,BAout,
input wire clk,
input [31:0] Instruction,
output reg[15:0] RegIn, 
output reg[15:0] RegOut,
output reg[31:0] C_sign_extended);
reg outSig;
reg[3:0] A,B,C;
reg [15:0]D;
reg[3:0]Ra,Rb,Rc;
wire [15:0]data_out;
decode_4_16 decode(data_out,D,clk);
always @(clk) begin
    Ra<=Instruction[26:23];
    A<=Ra&Gra;
    Rb<=Instruction[22:19];
    B<=Rb&Grb;
    Rc<=Instruction[18:15];
    C<=Rc&Grc;
    D<=A|B|C;
    if(Instruction[18])begin
        C_sign_extended[31:19]<=13'b1111111111111;
        C_sign_extended[18:0]<=Instruction[18:0];
    end
    else begin
        C_sign_extended[31:19]<=13'b0000000000000;
        C_sign_extended[18:0]<=Instruction[18:0];    
    end
     //setting Rin
    RegIn[0]<=data_out[0]&Rin;
    RegIn[1]<=data_out[1]&Rin;
    RegIn[2]<=data_out[2]&Rin;
    RegIn[3]<=data_out[3]&Rin;
    RegIn[4]<=data_out[4]&Rin;
    RegIn[5]<=data_out[5]&Rin;
    RegIn[6]<=data_out[6]&Rin;
    RegIn[7]<=data_out[7]&Rin;
    RegIn[8]<=data_out[8]&Rin;
    RegIn[9]<=data_out[9]&Rin;
    RegIn[10]<=data_out[10]&Rin;
    RegIn[11]<=data_out[11]&Rin;
    RegIn[12]<=data_out[12]&Rin;
    RegIn[13]<=data_out[13]&Rin;
    RegIn[14]<=data_out[14]&Rin;
    RegIn[15]<=data_out[15]&Rin;
    //setting Rout
    outSig<=Rout|BAout;
    RegOut[0]<=data_out[0]&outSig;
    RegOut[1]<=data_out[1]&outSig;
    RegOut[2]<=data_out[2]&outSig;
    RegOut[3]<=data_out[3]&outSig;
    RegOut[4]<=data_out[4]&outSig;
    RegOut[5]<=data_out[5]&outSig;
    RegOut[6]<=data_out[6]&outSig;
    RegOut[7]<=data_out[7]&outSig;
    RegOut[8]<=data_out[8]&outSig;
    RegOut[9]<=data_out[9]&outSig;
    RegOut[10]<=data_out[10]&outSig;
    RegOut[11]<=data_out[11]&outSig;
    RegOut[12]<=data_out[12]&outSig;
    RegOut[13]<=data_out[13]&outSig;
    RegOut[14]<=data_out[14]&outSig;
    RegOut[15]<=data_out[15]&outSig;
    
end
endmodule
