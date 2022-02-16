
`timescale 1ns/10ps 
module AND_tb; 
      //define the initial values to be passed into the datapath      
    reg  [31:0] buscontents;           // add any other signals to see in your simulation 
    reg  [31:0] i;    
    reg  [31:0]r0_data_out,r1_data_out,r2_data_out,r3_data_out,r4_data_out,r5_data_out,r6_data_out,r7_data_out,r8_data_out,r9_data_out,r10_data_out, r11_data_out,r12_data_out,r13_data_out,r14_data_out,r15_data_out,
    HI_data_out,LO_data_out,Zhigh_data_out,Zlow_data_out,PC_data_out,IR_data_out,MDR_data_out,MAR_data_out,Y_data_out; 
    reg IncPC;
    reg  Clock; 
    reg Read;
    reg [4:0] ALU_Sel;
    reg [31:0] Mdatain;
  parameter   Default = 4’b0000, Reg_load1a = 4’b0001, Reg_load1b = 4’b0010, Reg_load2a = 4’b0011,  
                             Reg_load2b = 4’b0100, Reg_load3a = 4’b0101, Reg_load3b = 4’b0110, T0 = 4’b0111,  
                             T1 = 4’b1000, T2 = 4’b1001, T3 = 4’b1010, T4 = 4’b1011, T5 = 4’b1100; 
    reg   [3:0] Present_state = Default; 
datapath DUT(bus_contents,r0_data_out,r1_data_out,r2_data_out,r3_data_out,r4_data_out,r5_data_out,r6_data_out,r7_data_out,r8_data_out,r9_data_out,r10_data_out, r11_data_out,r12_data_out,r13_data_out,r14_data_out,r15_data_out,
    HI_data_out,LO_data_out,Zhigh_data_out,Zlow_data_out,PC_data_out,IR_data_out,MDR_data_out,MAR_data_out,Y_data_out,i,Clock,ALU_Sel,Mdatain,Read?); 
 
// add test logic here 
initial  
    begin 
       Clock = 0; 
       forever #10 Clock = ~ Clock; 
end 
 
always @(posedge Clock)  // finite state machine; if clock rising-edge 
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
   end   
                                                          
always @(Present_state)  // do the required job in each state 
   begin 
      case (Present_state)               // assert the required signals in each clock cycle 
Default: begin 
//codes we need to find MARin, MDRin,IR,Yin, Read?,R5in,r2in,r4in,mdatain
//codes we need to find MARin, MDRin,IR,Yin, Read?,R5in,r2in,r4in,mdatain 23,22,21,24,5,2,4
    PC_data_out <= 0;   
    Zlow_data_out <= 0;   
    MDR_data_out <= 0;       
    R2_data_out <= 0;  
    R4_data_out <= 0;   
    i[23] <=0; //MARin
    i[22] <=0; //MDRin 
    i[20] <=0; //PCin
    i[21] <=0; //IRin  
    i[24] <=0; //Yin
    i[5] <= 0; //r5in
    i[2] <=0; //r2in
    i[4] <=0;  //r4in
    IncPC <= 0;   
    Read <= 0;   
    ALU_Sel <= 3; 
    Mdatain <= 32’h00000000; 
end 
Reg_load1a: begin   
      Mdatain <= 32’h00000022; 
      Read = 0; MDRin = 0;                   // the first zero is there for completeness 
    #10 Read <= 1; MDRin <= 1;   
    #15 Read <= 0; MDRin <= 0;    
end 
              Reg_load1b: begin  
                             #10 MDRout <= 1; R2in <= 1;   
                #15 MDRout <= 0; R2in <= 0;     // initialize R2 with the value $22           
end 
Reg_load2a: begin   
      Mdatain <= 32’h00000024; 
      #10 Read <= 1; MDRin <= 1;   
    #15 Read <= 0; MDRin <= 0;       
end 
              Reg_load2b: begin  
                            #10 MDRout <= 1; R4in <= 1;   
               #15 MDRout <= 0; R4in <= 0;  // initialize R4 with the value $24           
end 
Reg_load3a: begin   
      Mdatain <= 32’h00000026; 
      #10 Read <= 1; MDRin <= 1;   
    #15 Read <= 0; MDRin <= 0; 
end 
              Reg_load3b: begin  
                            #10 MDRout <= 1; R5in <= 1;   
               #15 MDRout <= 0; R5in <= 0;  // initialize R5 with the value $26           
end 
 
T0: begin                                                                                  // see if you need to de-assert these signals 
      PCout <= 1; MARin <= 1; IncPC <= 1; Zin <= 1;   
end 
T1: begin 
      Zlowout <= 1; PCin <= 1; Read <= 1; MDRin <= 1;   
      Mdatain <= 32’h4A920000;       // opcode for “and R5, R2, R4” 
end 
T2: begin 
      MDRout <= 1; IRin <= 1;    
end 
 
13
T3: begin 
      R2out <= 1; Yin <= 1;    
end 
T4: begin 
      R4out <= 1; AND <= 1; Zin <= 1;    
end 
T5: begin 
      Zlowout <= 1; R5in <= 1;    
end 
          endcase 
    end 
endmodule 