module SelectAndEncode(input Gra,Grb,Grc,Rin,Rout,BAout,clk,
input [31:0] Instruction,
output reg[15:0] RegIn, 
output reg[15:0] RegOut,
output reg[31:0] C_sign_extended);
reg outSig;
reg[3:0] A,B,C,D;
reg[3:0]Ra,Rb,Rc;
wire [15:0]data_out;
decode_4_16 decode(data_out,D,clk);
always @(posedge clk) begin
    Ra<=Instruction[26:23];
    A<=Ra&Gra;
    Rb<=Instruction[22:19];
    B<=Rb&Grb;
    Rc<=Instruction[18:15];
    C<=Rc&Grc;
    D<=A|B|C;
    if(Instruction[18]<=1)begin
        C_sign_extended<={4'h1FFF,Instruction[18:0]};
    end.
    else begin
        C_sign_extended<={4'h0000,Instruction[18:0]};
    end
end
always @(D) begin
    //setting Rin
    RegIn[0]<=D[0]&Rin;
    RegIn[1]<=D[1]&Rin;
    RegIn[2]<=D[2]&Rin;
    RegIn[3]<=D[3]&Rin;
    RegIn[4]<=D[4]&Rin;
    RegIn[5]<=D[5]&Rin;
    RegIn[6]<=D[6]&Rin;
    RegIn[7]<=D[7]&Rin;
    RegIn[8]<=D[8]&Rin;
    RegIn[9]<=D[9]&Rin;
    RegIn[10]<=D[10]&Rin;
    RegIn[11]<=D[11]&Rin;
    RegIn[12]<=D[12]&Rin;
    RegIn[13]<=D[13]&Rin;
    RegIn[14]<=D[14]&Rin;
    RegIn[15]<=D[15]&Rin;
    //setting Rout
    outSig<=Rout|BAout;
    RegOut[0]<=D[0]&outSig;
    RegOut[1]<=D[1]&outSig;
    RegOut[2]<=D[2]&outSig;
    RegOut[3]<=D[3]&outSig;
    RegOut[4]<=D[4]&outSig;
    RegOut[5]<=D[5]&outSig;
    RegOut[6]<=D[6]&outSig;
    RegOut[7]<=D[7]&outSig;
    RegOut[8]<=D[8]&outSig;
    RegOut[9]<=D[9]&outSig;
    RegOut[10]<=D[10]&outSig;
    RegOut[11]<=D[11]&outSig;
    RegOut[12]<=D[12]&outSig;
    RegOut[13]<=D[13]&outSig;
    RegOut[14]<=D[14]&outSig;
    RegOut[15]<=D[15]&outSig;
    
end
endmodule
