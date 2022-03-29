//inputs and outputs to control unit
`timescale 1ns/10ps
/*
  control_unit CU(clk,reset,stop,CONFFOut,IR_data_out,read,write,incPC,Gra,Grb,Grc,Rin,Rout,conIn,
    outport1Enable,strobeInport1,BAout,clr,enc_input,reg_enable,ALU_Sel);
*/
module control_unit(
input wire clock,reset,Stop,CONFFOut,
input wire [31:0] IR,
output reg read,write,incPC,
output reg [3:0] Gra,Grb,Grc,
output reg Rin,Rout,conIn,outport1Enable,strobeInport1,BAout,clr,
output reg [31:0] enc_input,reg_enable,
output reg [5:0] ALU_Sel
);
reg[3:0] flag;
reg[4:0] RA,RB,RC;
//FSM wite all states we will ever need
parameter Reset_state=0,fetch0=1,fetch1=2,fetch2=3,
ld3=4,ld4=5,ld5=6,ld6=7,ld7=8,
ldi3=9,ldi4=10,ldi5=11,
st3=12,st4= 13,st5= 14,st6= 15,st7= 16,
add3=17,add4= 18,add5=19,
sub3=20,sub4=21,sub5=22,
shr3= 23,shr4= 24,shr5= 25,
shl3= 26,shl4= 27,shl5= 28,
ror3= 29,ror4= 30,ror5= 31,
rol3= 32,rol4= 33,rol5= 34,
and3= 35,and4= 36,and5= 37,
or3= 38,or4= 39,or5= 40,
addi3= 41,addi4= 42,addi5= 43,
andi3= 44,andi4= 45,andi5= 46,
ori3= 47,ori4= 48,ori5= 49,
mul3= 50,mul4= 51,mul5= 52,mul6= 53,
div3= 54,div4= 55,div5= 56,div6= 57,
neg3= 58,neg4= 59,neg5=79,
not3= 60,not4= 61, not5=80,
branch3= 62,branch4= 63,branch5= 64,branch6= 65,
jr3= 66,jr4= 67,
jal3= 68,jal4= 69,jal5= 70,
in3= 71,in4= 72,
out3= 73,out4= 74,
mfhi3= 75,
mflo3=76,
nop3= 77, 
halt3=78;
reg[6:0] Present_state=Reset_state;
//initialize the flag
initial begin
    flag=3;
end
//change state at clock edge or when reset is asserted, only if flag 

always @(posedge clock)begin
if(reset)begin
    Present_state=Reset_state;
end
if(flag==3)begin
case(Present_state)
    Reset_state : Present_state=fetch0;
    fetch0 : Present_state=fetch1;
    fetch1 : Present_state=fetch2; //10010001100110000000000000000011
    fetch2 : begin
        case(IR[31:27])
            5'b00000 : Present_state=ld3;
            5'b00001 : Present_state=ldi3;
            5'b00010 : Present_state=st3;
            5'b00011 : Present_state=add3;
            5'b00100 : Present_state=sub3;
            5'b00101 : Present_state=shr3;
            5'b00110 : Present_state=shl3;
            5'b00111 : Present_state=ror3;
            5'b01000 : Present_state=rol3;
            5'b01001 : Present_state=and3;
            5'b01010 : Present_state=or3;
            5'b01011 : Present_state=addi3;
            5'b01100 : Present_state=andi3;
            5'b01101 : Present_state=ori3;
            5'b01110 : Present_state=mul3;
            5'b01111 : Present_state=div3;
            5'b10000 : Present_state=neg3;
            5'b10001 : Present_state=not3;
            5'b10010 : Present_state=branch3;
            5'b10011 : Present_state=jr3;
            5'b10100 : Present_state=jal3;
            5'b10101 : Present_state=in3;
            5'b10110 : Present_state=out3;
            5'b10111 : Present_state=mfhi3;
            5'b11000 : Present_state=mflo3;
            5'b11001 : Present_state=nop3;
            5'b11010 : Present_state=halt3;
        endcase
        RA<=IR[26:23];
        RB<=IR[22:19];
        RC<=IR[18:15];
    end  

    ld3 : Present_state=ld4;
    ld4 : Present_state=ld5;
    ld5 : Present_state=ld6;
    ld6 : Present_state=ld7;
    ld7 : Present_state=Reset_state;

    ldi3 : Present_state=ldi4;
    ldi4 : Present_state=ldi5;
    ldi5 : Present_state=Reset_state;

    st3 : Present_state=st4;
    st4 : Present_state=st5;
    st5 : Present_state=st6;
    st6 : Present_state=st7;
    st7 : Present_state=Reset_state;

    add3 : Present_state=add4;
    add4 : Present_state=add5;
    add5 : Present_state=Reset_state;

    sub3 : Present_state=sub4;
    sub4 : Present_state=sub5;
    sub5 : Present_state=Reset_state;

    shr3 : Present_state=shr4;
    shr4 : Present_state=shr5;
    shr5 : Present_state=Reset_state;

    shl3 : Present_state=shl4;
    shl4 : Present_state=shl5;
    shl5 : Present_state=Reset_state;

    ror3 : Present_state=ror4;
    ror4 : Present_state=ror5;
    ror5 : Present_state=Reset_state;

    ror3 : Present_state=ror4;
    ror4 : Present_state=ror5;
    ror5 : Present_state=Reset_state;

    rol3 : Present_state=rol4;
    rol4 : Present_state=rol5;
    rol5 : Present_state=Reset_state;

    and3 : Present_state=and4;
    and4 : Present_state=and5;
    and5 : Present_state=Reset_state;

    or3 : Present_state=or4;
    or4 : Present_state=or5;
    or5 : Present_state=Reset_state;

    addi3 : Present_state=addi4;
    addi4 : Present_state=addi5;
    addi5 : Present_state=Reset_state;

    andi3 : Present_state=andi4;
    andi4 : Present_state=andi5;
    andi5 : Present_state=Reset_state;

    ori3 : Present_state=ori4;
    ori4 : Present_state=ori5;
    ori5 : Present_state=Reset_state;

    mul3 : Present_state=mul4;
    mul4 : Present_state=mul5;
    mul5 : Present_state=mul6;
    mul6 : Present_state=Reset_state;

    div3 : Present_state=div4;
    div4 : Present_state=div5;
    div5 : Present_state=div6;
    div6 : Present_state=Reset_state;

    neg3 : Present_state=neg4;
    neg4 : Present_state=neg5;
    neg5: Present_state=Reset_state;

    not3 : Present_state=not4;
    not4 : Present_state=not5;
    not5 : Present_state=Reset_state;

    branch3 : Present_state=branch4;
    branch4 : Present_state=branch5;
    branch5 : Present_state=branch6;
    branch6 : Present_state=Reset_state;

    jr3 : Present_state=jr4;
    jr4 : Present_state=Reset_state;

    jal3 : Present_state=jal4;
    jal4 : Present_state=jal5;
    jal5 : Present_state=Reset_state;

    in3 : Present_state=in4;
    in4 : Present_state=Reset_state;

    out3 : Present_state=out4;
    out4 : Present_state=Reset_state;

    mfhi3 : Present_state=Reset_state;

    mflo3 : Present_state=Reset_state;

    nop3 : Present_state=Reset_state;

    halt3 : Present_state=Reset_state;
endcase
    flag=0;
end
else begin
    flag=flag+1;
end
end
/*
Enc inputs/reg enables
HI: 16
LO: 17
PC: 20
MAR: 23
Zlow: 19
MDR: 22
IR: 21
Y: 24
C: 25
*/   
//performing the required task by state
always @(Present_state)begin
case (Present_state)
    Reset_state : begin 
        read<=0;
        write<=0;
        incPC<=0;
        Gra<=0;
        Grb<=0;
        Grc<=0;
        Rin<=0;
        Rout<=0;
        conIn<=0;
        outport1Enable<=0;
        strobeInport1<=0;
        BAout<=0;
        enc_input<=0;
        reg_enable<=0;
        ALU_Sel<=13;
    end
    //we are putting the PC value onto the bus then loading that into MAR? that's stupid oh wait its not because mar picks the address of ram to read
    //also incrementing the PC value
    fetch0 : begin 
        enc_input[20]<=1;
        #25
        reg_enable[23]<=1;
        incPC<=1;
        #25
        incPC<=0;
        enc_input[20]<=0;
        reg_enable[23]<=0;
        
    end
    //getting the instruciton from memory and placing it in the MDR
    fetch1 : begin 
        read<=1;
        #35
        reg_enable[22]<=1;
        #25
        read<=0;
        reg_enable[22]<=0;
    end
    //taking the instruction from the MDR and placing it in the IR 
    fetch2 : begin 
        enc_input[22]<=1;
        reg_enable[21]<=1;
        #35
        enc_input[22]<=0;
        #25
        reg_enable[21]<=0;
    end
    //setting Y to the constant value in RB or 0
    ld3 : begin
        #5 
        Grb<=RB;
        BAout<=1;
        #45
        #25
        reg_enable[24]<=1;
        BAout<=0;
        Grb<=0;
    end
    //Send C to bus, add to Y, send to Z
    ld4 : begin 
        enc_input[25]<=1;
        #10
        reg_enable[24]<=0;
        #15
        ALU_Sel<=0;
        enc_input[25]<=0;
        reg_enable[19]<=1;
        #45
        ALU_Sel<=13;
        #10
        reg_enable[19]<=0;
    end 
    //send Z to MAR
    ld5 : begin 
        enc_input[19]<=1;
        reg_enable[23]<=1;
        #35
        enc_input[19]<=0;
        #25
        reg_enable[23]<=0;

    end 
    //send data at MAR address to MDR
    ld6 : begin 
        read<=1;
        #35
        reg_enable[22]<=1;
        #25
        reg_enable[22]<=0;
    end 
    //we're going to store the result of the load in the RA variable
    ld7 : begin 
        enc_input[22]<=1;
        Gra<=RA;
        Rin<=1;
        #35
        enc_input[22]<=0;
        #25
        Gra<=0;
        Rin<=0;
        read<=0;
    end 
//00001001100110000000000000000001
    ldi3 : begin 
        #5
        Grb<=RB;
        BAout<=1;
        #45
        #25
        reg_enable[24]<=1;
        BAout<=0;
        Grb<=0;
    end 
    ldi4 : begin 
        enc_input[25]<=1;
        #10
        reg_enable[24]<=0;
        #15
        ALU_Sel<=0;
        enc_input[25]<=0;
        reg_enable[19]<=1;
        #45
        ALU_Sel<=13;
        #10
        reg_enable[19]<=0;
    end 
    ldi5 : begin 
        enc_input[19]<=1;
        Gra<=RA;
        Rin<=1;
        #35
        enc_input[19]<=0;
        #25
            Gra<=0;
        Rin<=0;
        read<=0;
    end 
    st3 : begin 
        #5
        BAout<=1;
        Grb<=RB;
        #45
        #25
        reg_enable[24]<=1;
        BAout<=0;
        Grb<=0;
    end 
    st4 : begin 
        enc_input[25]<=1;
        #10
        reg_enable[24]<=0;
        #15
        ALU_Sel<=0;
        enc_input[25]<=0;
        reg_enable[19]<=1;
        #45
        
        ALU_Sel<=13;
        #10
        reg_enable[19]<=0;
    end 
    st5 : begin 
        enc_input[19]<=1;
        reg_enable[23]<=1;
        #35
        enc_input[19]<=0;
        #25
        reg_enable[23]<=0;

    end 
    st6 : begin 
        Gra<=RA;
        Rout<=1;
        #60
        Rout<=0;
        Gra<=0;
        reg_enable[22]<=1;
    end 
    st7 : begin 
        #30
        reg_enable[22]<=0;
        #20
        write<=1;
    end 
    //send RB or 0 to Y
    add3 : begin 
        #5
        Grb<=RB;
        BAout<=1;
        #70
        reg_enable[24]<=1;
        BAout<=0;
        Grb<=0;
    end 
    //send RC or 0 to bus
    add4 : begin 
        Grc<=RC;
        BAout<=1;
        #10
        reg_enable[24]<=0;
        #60
        ALU_Sel<=0;
        Grc<=0;
        BAout<=0;
        reg_enable[19]<=1;

    end 
    add5 : begin 
        #20
        reg_enable[19]<=0;
        ALU_Sel<=13;
        enc_input[19]<=1;
        Gra<=RA;
        Rin<=1;
        #45
        enc_input[19]<=0;
        #10
        Gra<=0;
        Rin<=0;
    end 

    sub3 : begin 
        #5
        Grb<=RB;
        BAout<=1;
        #70
        reg_enable[24]<=1;
        BAout<=0;
        Grb<=0;
    end 
    sub4 : begin 
        Grc<=RC;
        BAout<=1;
        #10
        reg_enable[24]<=0;
        #60
        Grc<=0;
        BAout<=0;
        ALU_Sel<=1;
        reg_enable[19]<=1;
    end 
    sub5 : begin 
        #20
        reg_enable[19]<=0;
        ALU_Sel<=13;
        enc_input[19]<=1;
        Gra<=RA;
        Rin<=1;
        #45
        enc_input[19]<=0;
        #10
        Gra<=0;
        Rin<=0;
    end 
    //take the RB value and throw it into the Y register
    shr3 : begin 
        #5
        Grb<=RB;
        BAout<=1;
        #70
        reg_enable[24]<=1;
        BAout<=0;
        Grb<=0;
    end 
    //take RC or the R0 value
    shr4 : begin 
        Grc<=RC;
        BAout<=0;
        #10
        reg_enable[24]<=0;
        #60
        Grc<=0;
        BAout<=0;
        ALU_Sel<=7;
        reg_enable[19]<=1;
    end 
    shr5 : begin 
        #20
        reg_enable[19]<=0;
        ALU_Sel<=13;
        enc_input[19]<=1;
        Gra<=RA;
        Rin<=1;
        #45
        enc_input[19]<=0;
        #10
        Gra<=0;
        Rin<=0;
    end 

    shl3 : begin 
        #5
        Grb<=RB;
        BAout<=1;
        #70
        reg_enable[24]<=1;
        BAout<=0;
        Grb<=0;
    end 
    //take
    shl4 : begin 
        Grc<=RC;
        BAout<=0;
        #10
        reg_enable[24]<=0;
        #60
        Grc<=0;
        BAout<=0;
        ALU_Sel<=8;
        reg_enable[19]<=1;
    end 
    shl5 : begin 
        #20
        reg_enable[19]<=0;
        ALU_Sel<=13;
        enc_input[19]<=1;
        Gra<=RA;
        Rin<=1;
        #45
        enc_input[19]<=0;
        #10
        Gra<=0;
        Rin<=0;
    end 
    //Take RB and Place in the Y register
    ror3 : begin 
        #5
        Grb<=RB;
        BAout<=1;
        #70
        reg_enable[24]<=1;
        BAout<=0;
        Grb<=0;
    end
    ror4 : begin 
        Grc<=RC;
        Rout<=1;
        #10
        reg_enable[24]<=0;
        #60
        Grc<=0;
        Rout<=0;
        ALU_Sel<=9;
        reg_enable[19]<=1;
    end 
    ror5 : begin 
        #20
        reg_enable[19]<=0;
        ALU_Sel<=13;
        enc_input[19]<=1;
        Gra<=RA;
        Rin<=1;
        #45
        enc_input[19]<=0;
        #10
        Gra<=0;
        Rin<=0;
    end 

    rol3 : begin 
        #5
        Grb<=RB;
        BAout<=1;
        #70
        reg_enable[24]<=1;
        BAout<=0;
        Grb<=0;
    end 
    rol4 : begin 
        Grc<=RC;
        Rout<=1;
        #10
        reg_enable[24]<=0;
        #60
        Grc<=0;
        Rout<=0;
        ALU_Sel<=10;
        reg_enable[19]<=1;
    end 
    rol5 : begin 
        #20
        reg_enable[19]<=0;
        ALU_Sel<=13;
        enc_input[19]<=1;
        Gra<=RA;
        Rin<=1;
        #45
        enc_input[19]<=0;
        #10
        Gra<=0;
        Rin<=0;
    end 

    and3 : begin 
        #5
        Grb<=RB;
        BAout<=1;
        #70
        reg_enable[24]<=1;
        BAout<=0;
        Grb<=0;
    end 
    and4 : begin 
        Grc<=RC;
        BAout<=1;
        #10
        reg_enable[24]<=0;
        #60
        Grc<=0;
        BAout<=0;
        ALU_Sel<=3;
        reg_enable[19]<=1;
    end 
    and5 : begin 
        #20
        reg_enable[19]<=0;
        ALU_Sel<=13;
        enc_input[19]<=1;
        Gra<=RA;
        Rin<=1;
        #45
        enc_input[19]<=0;
        #10
        Gra<=0;
        Rin<=0;
    end 

    or3 : begin 
        #5
        Grb<=RB;
        BAout<=1;
        #70
        reg_enable[24]<=1;
        BAout<=0;
        Grb<=0;
    end 
    or4 : begin 
        Grc<=RC;
        Rout<=1;
        #10
        reg_enable[24]<=0;
        #60
        Rout<=0;
        Grc<=0;
        ALU_Sel<=4;
        reg_enable[19]<=1;
    end 
    or5 : begin 
        #20
        reg_enable[19]<=0;
        ALU_Sel<=13;
        enc_input[19]<=1;
        Gra<=RA;
        Rin<=1;
       #45
        enc_input[19]<=0;
        #10
        Gra<=0;
        Rin<=0;
    end 

    addi3 : begin 
        #5
        Grb<=RB;
        Rout<=1;
        #45
        #25
        reg_enable[24]<=1;
        Rout<=0;
        Grb<=0;
    end 
    addi4 : begin 
        enc_input[25]<=1;
        #10
        reg_enable[24]<=0;
        #15
        ALU_Sel<=0;
        enc_input[25]<=0;
        reg_enable[19]<=1;
        #45
        ALU_Sel<=13;
        reg_enable[19]<=0;
    end 
    addi5 : begin 
        enc_input[19]<=1;
        Gra<=RA;
        Rin<=1;
        #35
        enc_input[19]<=0;
        #25
        Gra<=0;
        Rin<=0;
    end 

    andi3 : begin 
        #5
        Grb<=RB;
        Rout<=1;
        #45
        #25
        reg_enable[24]<=1;
        Rout<=0;
        Grb<=0;
    end 
    andi4 : begin 
        enc_input[25]<=1;
        #10
        reg_enable[24]<=0;
        #15
        ALU_Sel<=3;
        enc_input[25]<=0;
        reg_enable[19]<=1;
        #45
        ALU_Sel<=13;
        reg_enable[19]<=0;
    end 
    andi5 : begin 
        enc_input[19]<=1;
        Gra<=RA;
        Rin<=1;
        #35
        enc_input[19]<=0;
        #25
        Gra<=0;
        Rin<=0;
    end

    ori3 : begin 
        #5
        Grb<=RB;
        Rout<=1;
        #45
        #25
        reg_enable[24]<=1;
        Rout<=0;
        Grb<=0;
    end 
    ori4 : begin 
        enc_input[25]<=1;
        #10
        reg_enable[24]<=0;
        #15
        ALU_Sel<=4;
        enc_input[25]<=0;
        reg_enable[19]<=1;
        #45
        ALU_Sel<=13;
        reg_enable[19]<=0;
    end 
    ori5 : begin 
        enc_input[19]<=1;
        Gra<=RA;
        Rin<=1;
        #35
        enc_input[19]<=0;
        #25
        Gra<=0;
        Rin<=0;
    end  

    mul3 : begin 
        #5
        Gra<=RA;
        BAout<=1;
        #70
        reg_enable[24]<=1;
        BAout<=0;
        Gra<=0;
    end 
    mul4 : begin 
        Grb<=RB;
        BAout<=1;
        #10
        reg_enable[24]<=0;
        #60
        Grb<=0;
        BAout<=0;
        ALU_Sel<=6;
        reg_enable[19]<=1;
        reg_enable[18]<=1;
    end 
    mul5 : begin 
        #20
        reg_enable[19]<=0;
        reg_enable[18]<=0;
        ALU_Sel<=13;
        enc_input[19]<=1;
        reg_enable[17]<=1;
        #35
        enc_input[19]<=0;
        #15
        reg_enable[17]<=0;

    end 
    mul6 : begin 
        enc_input[18]<=1;
        reg_enable[16]<=1;
        #35
        enc_input[18]<=0;
        #25
        reg_enable[16]<=0;
    end 

    div3 : begin 
        #5
        Gra<=RA;
        BAout<=1;
        #70
        reg_enable[24]<=1;
        BAout<=0;
        Gra<=0;
    end 
    div4 : begin 
        Grb<=RB;
        BAout<=1;
        #10
        reg_enable[24]<=0;
        #60
        Grb<=0;
        BAout<=0;
        ALU_Sel<=2;
        reg_enable[19]<=1;
        reg_enable[18]<=1;
    end 
    div5 : begin 
        #20
        reg_enable[19]<=0;
        reg_enable[18]<=0;
        ALU_Sel<=13;
        enc_input[19]<=1;
        reg_enable[17]<=1;
        #35
        enc_input[19]<=0;
        #15
        reg_enable[17]<=0;

    end 
    div6 : begin 
        enc_input[18]<=1;
        reg_enable[16]<=1;
        #35
        enc_input[18]<=0;
        #25
        reg_enable[16]<=0;
    end  
    //send RB to the Y register
    neg3 : begin 
        #5
        Grb<=RB;
        Rout<=1;
        #45
        #25
        reg_enable[24]<=1;
        Rout<=0;
        Grb<=0;
    end 
    //store the result in ZLow
    neg4 : begin 
        #10
        reg_enable[24]<=1;
        #25
        ALU_Sel<=11;
        reg_enable[19]<=1;
        #40
        reg_enable[19]<=0;
        ALU_Sel<=13;


    end 
    neg5: begin
        enc_input[19]<=1;
        Gra<=RA;
        Rin<=1;
        #35
        enc_input[19]<=0;
        #25
        Gra<=0;
        Rin<=0;
        read<=0;
    end

    not3 : begin 
        #5
        Grb<=RB;
        Rout<=1;
        #45
        #25
        reg_enable[24]<=1;
        Rout<=0;
        Grb<=0;
    end 
    not4 : begin 
       
        #10
        reg_enable[24]<=1;
        #25
        ALU_Sel<=12;
        reg_enable[19]<=1;
        #40
        reg_enable[19]<=0;
        ALU_Sel<=13;


    end 
    not5: begin
        enc_input[19]<=1;
        Gra<=RA;
        Rin<=1;
        #35
        enc_input[19]<=0;
        #25
        Gra<=0;
        Rin<=0;
        read<=0;
    end

    branch3 : begin 
        #5
        Gra<=RA;
        Rout<=1;
        #45
        #25
        Gra<=0;
        Rout<=0;
        conIn<=1;
    end 
    branch4 : begin 
        enc_input[20]<=1;
        reg_enable[24]<=1;
        #15
        #10
        enc_input[20]<=0;
        #25
        conIn<=0;
        reg_enable[24]<=0;
    end 
    branch5 : begin 
        enc_input[25]<=1;
        #25
        ALU_Sel<=0;
        enc_input[25]<=0;
        reg_enable[19]<=1;
        #45
        ALU_Sel<=13;
        #10
        reg_enable[19]<=0;
    end 
    branch6 : begin 
        if(CONFFOut)begin
        enc_input[19]<=1;
        #35
        reg_enable[20]<=1;
        enc_input<=1;
        #25
        reg_enable[20]<=1;
        end
    end 

    jr3 : begin 
        #5
        Gra<=RA;
        Rout<=1;
        #45
        reg_enable[20]<=1;
        #25
        Gra<=0;
        Rout<=0;
    end 
    jr4 : begin 
        #10
        reg_enable[20]<=0;
    end 

    jal3 : begin 
        #5
        enc_input[20]<=1;
        Grb<=RB;
        Rin<=1;
        #35
        enc_input[20]<=0;
        #25
        Grb<=0;
        Rin<=0;
    end 
    jal4 : begin 
        Gra<=RA;
        Rout<=1;
        #45
        reg_enable[20]<=1;
        #25
        Gra<=0;
        Rout<=0;
    end 
    jal5 : begin 
        #10
        reg_enable[20]<=0;
    end 

    in3 : begin 
        #5
        Rin<=1;
        Gra<=1;
        strobeInport1<=1;
        #40
        strobeInport1<=0;   
        #30
        Rin<=0;
        Gra<=0;  
    end 
    in4 : begin 
        #10
        Gra<=0;
    end 

    out3 : begin 
        #5
        Rout<=1;
        Gra<=1;
        #70
        outport1Enable<=1;
       
    end 
    out4 : begin 
        #10
        outport1Enable<=0;
    end 

    mfhi3 : begin 
        #5
        enc_input[16]<=1;
        Rin<=1;
        Gra<=RA;
        #35
        enc_input[16]<=0;
        #25
        Rin<=0;
        Gra<=0;
    end 

    mflo3 : begin 
        #5
        enc_input[17]<=1;
        Rin<=1;
        Gra<=RA;
        #35
        enc_input[17]<=0;
        #25
        Rin<=0;
        Gra<=0;
    end 
    halt3: begin
        $finish;
    end
    default: begin
    end
endcase
end
endmodule