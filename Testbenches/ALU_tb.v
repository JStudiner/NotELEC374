`timescale 1ns/10ps
module ld_tb(input A,output B);
//time control
reg [3:0] flag;
//parameters to the FSM
parameter T0=4'b0000,T1=4'b0001,T2=4'b0010,T3=4'b0011,T4=4'b0100,T5=4'b0101,T6=4'b0110,T7=4'b0111,Default=4'b1111;
//Control and other signals
wire [31:0] bus_contents;
reg [31:0] enc_input;
reg [5:0] ALU_Sel;
wire [31:0] Mdatain;
reg read,write;
wire clr;
reg [31:0] reg_enable;
reg incPC;
reg Gra,Grb,Grc,Rin,Rout,BAout;
wire conIn;
reg clock;
//data
datapath DUT(bus_contents,
    enc_input,
    clock,
    ALU_Sel,
    Mdatain,
    read,
    write,
    clr,
    reg_enable,
    incPC,
    Gra,Grb,Grc,Rin,Rout,Baout,
    conIn);
//clock stuff
reg[3:0] Present_state = Default; 
initial begin    
   clock = 0; 
   flag=1;
end 
always 
      begin
      #10 clock = ~ clock; 
      end
always @(posedge clock)  // finite state machine; if clock rising-edge 
begin 
if(flag==3)begin
case (Present_state) 
   Default:Present_state = T0; 
   T0    :  Present_state = T1; 
   T1    :  Present_state = T2; 
   T2    :  Present_state = T3; 
   T3    :  Present_state = T4; 
   T4    :  Present_state = T5;    
   T5    :  Present_state = T6;  
   T6    :  Present_state = T7; 
endcase
flag=0;
end
else begin
   flag=flag+1;
end
end     
//out means encoder input, //in means register enable
/*
Enc inputs/reg enables
PC: 20
MAR: 23
Zlow: 19
MDR: 22
IR: 21
Y: 24
C: 25
*/                            
always @(Present_state)  // do the required job in each state 
begin 
case (Present_state) // assert the required signals in each clock cycle 
//initialize parameters
Default: begin 
enc_input<=0;
reg_enable<=0;
IncPC<=0;
Grb<=0;
BAout<=0;
read<=0;
Gra<=0;
Rin<=0;
end

T0: begin 
enc_input[20]<=1;
reg_enable[23]<=1;
#25
enc_input[20]<=0;
reg_enable[23]<=0;
incPC<=1;
reg_enable[19]<=1;
#15
incPC<=0;
reg_enable[19]<=0;
end

T1: begin 
enc_input[19]<=1;
read<=1;
reg_enable[20]<=1;
#25
enc_input[19]<=0;
reg_enable[20]<=0;
#10
reg_enable[22]<=1;
#15
read<=0;
reg_enable[22]<=0;
end 

T2: begin 
enc_input[22]<=1;
reg_enable[21]<=1;
#25
enc_input[22]<=0;
reg_enable[21]<=0;
end 

T3: begin 
Grb<=1;
Rout<=1;
#25
reg_enable[24]<=1; //Yin
#25
reg_enable[24]<=0;
Grb<=0;
Rout<=0;
end 

T4: begin 
enc_input[25]<=1; //Cout
#25
ALU_Sel<=0;
enc_input[25]<=0;
#25
reg_enable[19]<=1; // Zin
#15
reg_enable[19]<=0;
end  

T5: begin 
enc_input[19]<=1; // Zout
Gra<=1;
Rin<=1;

enc_input[19]<=0;
Gra<=1;
Rin<=1;


reg_enable[19]<=0;
end  


endcase
end
endmodule