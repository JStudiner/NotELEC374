
`timescale 1ns/10ps 
module AND_tb(
      input wire A,
      output reg B
); 
      //define the initial values to be passed into the datapath      
    reg flag;
    reg  [31:0] buscontents; 
    reg[31:0] MDR_data_out_t;  
    wire[31:0] MDR_data_out;        // add any other signals to see in your simulation 
    reg  [31:0] i;    
    reg  [31:0]r0_data_out_t,r1_data_out_t,r2_data_out_t,r3_data_out_t,r4_data_out_t,r5_data_out_t,r6_data_out_t,r7_data_out_t,r8_data_out_t,r9_data_out_t,r10_data_out_t, r11_data_out_t,r12_data_out_t,r13_data_out_t,r14_data_out_t,r15_data_out_t,
    HI_data_out_t,LO_data_out_t,Zhigh_data_out_t,Zlow_data_out_t,PC_data_out_t,IR_data_out_t,MAR_data_out_t,Y_data_out_t; 
    wire [31:0]r0_data_out,r1_data_out,r2_data_out,r3_data_out,r4_data_out,r5_data_out,r6_data_out,r7_data_out,r8_data_out,r9_data_out,r10_data_out, r11_data_out,r12_data_out,r13_data_out,r14_data_out,r15_data_out,
    HI_data_out,LO_data_out,Zhigh_data_out,Zlow_data_out,PC_data_out,IR_data_out,MAR_data_out,Y_data_out; 
    assign r0_data_out=r0_data_out_t;
  assign r1_data_out=r1_data_out_t;
  assign r2_data_out=r2_data_out_t;
  assign r3_data_out=r3_data_out_t;
  assign r4_data_out=r4_data_out_t;
  assign r5_data_out=r5_data_out_t;
  assign r6_data_out=r6_data_out_t;
  assign r7_data_out=r7_data_out_t;
  assign r8_data_out=r8_data_out_t;
  assign r9_data_out=r9_data_out_t;
  assign r10_data_out=r10_data_out_t;
  assign  r11_data_out=r11_data_out_t;
  assign r12_data_out=r12_data_out_t;
  assign r13_data_out=r13_data_out_t;
  assign r14_data_out=r14_data_out_t;
  assign r15_data_out=r15_data_out_t;
  assign HI_data_out=HI_data_out_t;
      assign LO_data_out=LO_data_out_t;   
assign Zhigh_data_out=Zhigh_data_out_t;   
assign Zlow_data_out=Zlow_data_out_t;   
assign PC_data_out=PC_data_out_t;   
assign IR_data_out=IR_data_out_t;   
//assign MAR_data_out=MAR_data_out_t;   
assign Y_data_out=Y_data_out_t;
assign MDR_data_out=MDR_data_out_t;
    reg IncPC;
    reg Clock; 
    reg Read;
    reg clr;
    reg [4:0] ALU_Sel;
    reg [31:0] Mdatain;
  parameter   Default = 4'b00000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011,  
                             Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111,  
                             T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100; 
    reg   [3:0] Present_state = Default; 
      datapath DUT(bus_contents,MDR_data_out,r0_data_out,r1_data_out,r2_data_out,
      r3_data_out,r4_data_out,r5_data_out,r6_data_out,
      r7_data_out,r8_data_out,r9_data_out,r10_data_out, 
      r11_data_out,r12_data_out,r13_data_out,r14_data_out,r15_data_out,
    HI_data_out,LO_data_out,Zhigh_data_out,Zlow_data_out,PC_data_out,
    IR_data_out,MAR_data_out,Y_data_out,i,Clock,ALU_Sel,Mdatain,Read,clr); 

// add test logic here 
initial  
    begin 
       Clock = 0; 
       flag=0;
end 
always
      begin
      #10 Clock = ~ Clock; 
      end
      
//always
     // #10 Clock = ~ Clock; 
always @(posedge Clock)  // finite state machine; if clock rising-edge 
if (flag%4==0)
   begin 
      case (Present_state) 

   Default:Present_state = Reg_load1a; 
   Reg_load1a:Present_state = Reg_load1b; 
   Reg_load1b  :  Present_state = Reg_load2a; 
   Reg_load2a  :  Present_state = Reg_load2b; 
   Reg_load2b  :  Present_state = Reg_load3a; 
   Reg_load3a  :  Present_state = Reg_load3b; 
   Reg_load3b  :  Present_state = T0; 
   T0    :  Present_state = T1; 
   T1    :  Present_state = T2; 
   T2    :  Present_state = T3; 
   T3    :  Present_state = T4; 
   T4    :  Present_state = T5; 
     
       endcase 
      flag=2;
   end   
else
begin
      flag=flag+1;
end                                                
always @(Present_state)  // do the required job in each state 
begin 
case (Present_state)               // assert the required signals in each clock cycle 
Default: begin 
//codes we need to find MARin, MDRin,IR,Yin, Read?,R5in,r2in,r4in,mdatain
//codes we need to find MARin, MDRin,IR,Yin, Read?,R5in,r2in,r4in,mdatain 23,22,21,24,5,2,4
      clr<=0;
    //PC_data_out_t <= 0;   
    //Zlow_data_out_t <= 0;   
    //MDR_data_out_t <= 0;       
    //r2_data_out_t <= 0;  
    //r4_data_out_t <= 0; 
    //need to set the other initial enables to 0
    i[0] <=0;
    i[1] <=0;
    i[30] <=0;
    i[3] <=0;
    i[31] <=0;
    i[29] <=0;
    i[6] <=0;
    i[7] <=0;
    i[8] <=0;
    i[9] <=0;
    i[10] <=0;
    i[11] <=0;
    i[12] <=0;
    i[13] <=0;
    i[14] <=0;
    i[15] <=0;
    i[16] <=0;
    i[17] <=0;
    i[18] <=0;
    i[28] <=0;
    i[26] <=0;
    i[27] <=0;
    i[25] <=0;
    i[23] <=0; //MARin
    i[22] <=0; //MDRin 
    i[20] <=0; //PCin
    i[21] <=0; //IRin  
    i[24] <=0; //Yin
    i[5] <= 0; //r5in
    i[2] <=0; //r2in
    i[4] <=0;  //r4in
    i[19]<=0; //ZLowin
    IncPC <= 0;   
    Read <= 0;   
    ALU_Sel <= 7; 
    Mdatain <= 32'h00000000; 
end 
Reg_load1a: begin   
      
      Mdatain <= 32'h00000022; 
      Read = 0;  i[22] = 0;                   // the first zero is there for completeness 
    #10 Read <= 1;  i[22] <= 1;   
    #15 Read <= 0;  i[22] <= 0;    
end 
Reg_load1b: begin   
      #10 MDR_data_out_t <= 1;  i[2] <= 1;   
      #15 MDR_data_out_t <= 0;  i[2] <= 0;     // initialize R2 with the value $22           
end 
Reg_load2a: begin   
      Mdatain <= 32'h00000024; 
      #10 Read <= 1; i[22] <= 1;   
    #15 Read <= 0; i[22] <= 0;       
end 
Reg_load2b: begin  
      #10 MDR_data_out_t <= 1; i[4] <= 1;   
      #15 MDR_data_out_t <= 0; i[4] <= 0;  // initialize R4 with the value $24           
end 
Reg_load3a: begin   
      Mdatain <= 32'h00000026; 
      #10 Read <= 1; i[22] <= 1;   
    #15 Read <= 0; i[22] <= 0; 
end 
Reg_load3b: begin  
      #10 MDR_data_out_t <= 1;  i[5] <= 1;   
      #15 MDR_data_out_t <= 0; i[5] <= 0;  // initialize R5 with the value $26           
end 
 
T0: begin                                                                                  // see if you need to de-assert these signals 
      PC_data_out_t <= 1; i[23] <= 1; IncPC <= 1;  i[19] <= 1;   
end 
T1: begin 
      Zlow_data_out_t <= 0;  i[20] <= 1; Read <= 1; i[22] <= 1;   
      Mdatain <= 32'h4A920000;       // opcode for “and R5, R2, R4” 
end 
T2: begin 
      MDR_data_out_t <= 1; i[21] <= 1;    
end 
 
T3: begin 
      //r2_data_out_t <= 1;
       i[24] <= 1;   
end 
T4: begin 
      r4_data_out_t <= 1; ALU_Sel <= 3; i[19] <= 1;    
end 
T5: begin 
      Zlow_data_out_t <= 2; i[5] <= 1;    
end 
endcase 
end 
endmodule 