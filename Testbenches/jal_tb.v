//This testbench will work for each branch command, just ensure that the instruction is encoded differently
`timescale 1ns/10ps
module jal_tb(input A,output B);
//time control
reg [3:0] flag;
//parameters to the FSM
parameter T0=4'b0000,T1=4'b0001,T2=4'b0010,T3=4'b0011,T4=4'b0100,T5=4'b0101,Default=4'b1111;
//Control and other signals
wire [31:0] bus_contents;
reg [31:0] enc_input;
reg [5:0] ALU_Sel;
wire [31:0] Mdatain;
reg read,write;
wire clr;
reg [31:0] reg_enable;
reg incPC;
reg [3:0] Gra,Grb,Grc;
reg Rin,Rout,BAout;
reg conIn;
wire CONFFOut;
reg clock;
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
    Gra,Grb,Grc,Rin,Rout,BAout,
    conIn,
    CONFFOut);
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
endcase
flag=0;
end
else begin
   flag=flag+1;
end
end     
//out means encoder input, in means register enable
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
   incPC<=0;
   Grb<=0;
   BAout<=0;
   read<=0;
   Gra<=0;
   Grc<=0;
   Rin<=0;
   Rout<=0;
end
T0: begin 
//we are putting the PC value onto the bus then loading that into MAR? that's stupid oh wait its not because mar picks the address of ram to read
   enc_input[20]<=1;
#25
  reg_enable[23]<=1;
  incPC<=1;
  #25
  incPC<=0;
   enc_input[20]<=0;
 reg_enable[23]<=0;
  
#25
   reg_enable[19]<=0;
end
T1: begin 
   read<=1;
   //getting the MDR
enc_input[19]<=1;
   #5
   
reg_enable[20]<=1;
#25
   enc_input[19]<=0;
   reg_enable[20]<=0;
   reg_enable[22]<=1;
#25
   read<=0;
   reg_enable[22]<=0;
end 
//setting the IR value to the instruction
T2: begin 
   enc_input[22]<=1;
   reg_enable[21]<=1;
#35
   enc_input[22]<=0;
#25
   reg_enable[21]<=0;

end 
//set R15 to the current PC value
T3: begin
    enc_input[20]<=1;
    Rin<=1;
    #35
    enc_input[20]<=1;
    #25
    Rin<=0;
       
end
//Set PC to the value in R1
T4: begin 
   Gra<=1;
   Rout<=1;
#45
reg_enable[20]<=1;
#25
Gra<=0;
Rout<=0;
end
T5: begin
#10
reg_enable[20]<=0;
end  
endcase
end
endmodule