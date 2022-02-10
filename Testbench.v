-- and datapath_tb.vhd file: <This is the filename> 
LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
 
-- entity declaration only; no definition here 
ENTITY datapath_tb IS 
END ENTITY datapath_tb; 
 
-- Architecture of the testbench with the signal names  
ARCHITECTURE datapath_tb_arch OF datapath_tb IS      -- Add any other signals to see in your simulation 
    SIGNAL  PCout_tb, Zlowout_tb, MDRout_tb, R2out_tb, R4out_tb:  std_logic; 
    SIGNAL  MARin_tb, Zin_tb, PCin_tb, MDRin_tb, IRin_tb, Yin_tb:    std_logic; 
    SIGNAL  IncPC_tb, Read_tb, AND_tb, R5in_tb, R2in_tb, R4in_tb:    std_logic; 
    SIGNAL  Clock_tb:              std_logic;      
    SIGNAL  Mdatain_tb    :          std_logic_vector (31 downto 0); 
     
  TYPE   State IS (default, Reg_load1a, Reg_load1b, Reg_load2a, Reg_load2b, Reg_load3a, Reg_load3b, T0, T1,  
                                             T2, T3, T4, T5); 
     SIGNAL   Present_state:  State := default; 
     
   -- component instantiation of the datapath 
  COMPONENT datapath  
      PORT ( 
      PCout, Zlowout, MDRout, R2out, R4out:     in  std_logic; 
        MARin, Zin, PCin, MDRin, IRin, Yin:      in  std_logic; 
        IncPC, Read, AND, R5in, R2in, R4in:      in  std_logic; 
              Clock:              in  Std_logic; 
        Mdatain:            in  std_logic_vector (31 downto 0); 
 END COMPONENT datapath; 
 
 BEGIN  
  DUT  : datapath 
 --port mapping: between the dut and the testbench signals 
    PORT MAP ( 
  PCout    =>  PCout_tb, 
  Zlowout  =>  Zlowout_tb, 
  MDRout  =>  MDRout_tb, 
  R2out    =>  R2out_tb, 
  R4out    =>  R4out_tb,      
  MARin    =>  MARin_tb, 
Zin    =>  Zin_tb, 
PCin    =>  PCin_tb, 
MDRin    =>  MDRin_tb, 
IRin    =>  IRin_tb, 
Yin    =>  Yin_tb, 
  IncPC     =>  IncPC_tb, 
  Read    =>  Read_tb, 
AND    =>  AND_tb, 
 
9
 
R2in    =>  R2in_tb, 
R4in    =>  R4in_tb, 
R5in    =>  R5in_tb, 
  Clock    =>  Clock_tb, 
  Mdatain  =>  Mdatain_tb); 
 
--add test logic here 
Clock_process: PROCESS IS 
  BEGIN 
    Clock_tb <= ‘1’, ‘0’ after 10 ns; 
               Wait for 20 ns; 
  END PROCESS Clock_process; 
 
PROCESS (Clock_tb)  IS               -- finite state machine 
  BEGIN 
    IF (rising_edge (Clock_tb)) THEN       -- if clock rising-edge 
      CASE Present_state IS 
                                                          WHEN Default => 
          Present_state <= Reg_load1a;             
        WHEN Reg_load1a => 
          Present_state <= Reg_load1b; 
        WHEN Reg_load1b => 
          Present_state <= Reg_load2a; 
        WHEN Reg_load2a => 
          Present_state <= Reg_load2b; 
        WHEN Reg_load2b => 
          Present_state <= Reg_load3a; 
                                                          WHEN Reg_load3a => 
          Present_state <= Reg_load3b; 
                                           WHEN Reg_load3b =>     
          Present_state <= T0;       
        WHEN T0 => 
          Present_state <= T1; 
        WHEN T1 => 
          Present_state <= T2; 
        WHEN T2 => 
          Present_state <= T3; 
        WHEN T3 => 
          Present_state <= T4; 
        WHEN T4 => 
          Present_state <= T5; 
        WHEN OTHERS => 
      END CASE; 
    END IF; 
  END PROCESS; 
 
PROCESS (Present_state) IS         -- do the required job in each state 
 
10
  BEGIN                   
    CASE Present_state IS        -- assert the required signals in each clock cycle 
                            WHEN Default => 
                                  PCout_tb <= ‘0’;   Zlowout_tb <= ‘0’;   MDRout_tb <= ‘0’;          -- initialize the signals 
                                  R2out_tb <= ‘0’;   R4out_tb <= ‘0’;   MARin_tb <= ‘0’;   Zin_tb <= ‘0’;   
                                  PCin_tb <=’0’;   MDRin_tb <= ‘0’;   IRin_tb  <= ’0’;   Yin_tb <= ‘0’;   
                                  IncPC_tb <= ‘0’;  Read_tb <= ‘0’;  AND_tb <= ‘0’;      
         R2in_tb <= ‘0’;  R4in_tb <= ‘0’;  R5in_tb <= ‘0’; Mdatain_tb <= x”00000000”;  
             
                            WHEN Reg_load1a =>  
            Mdatain_tb <= x"00000022";       
            Read_tb <= ‘0’, ‘1’ after 10 ns, ‘0’ after 25 ns;  -- the first zero is there for completeness 
                                   MDRin_tb <= ‘0’, ‘1’ after 10 ns, ‘0’ after 25 ns; 
                            WHEN Reg_load1b =>  
            MDRout_tb <= ‘1’ after 10 ns, ‘0’ after 25 ns;  
                                                 R2in_tb <= ‘1’ after 10 ns, ‘0’ after 25 ns;    --  initialize R2 with the value $22            
                      WHEN Reg_load2a =>  
            Mdatain_tb <= x"00000024";    
            Read_tb <= ‘1’ after 10 ns, ‘0’ after 25 ns;  
                                   MDRin_tb <= ‘1’ after 10 ns, ‘0’ after 25 ns; 
                             WHEN Reg_load2b =>  
            MDRout_tb <= ‘1’ after 10 ns, ‘0’ after 25 ns;  
                                                 R4in_tb <= ‘1’ after 10 ns, ‘0’ after 25 ns;    --  initialize R4 with the value $24                             
                             WHEN Reg_load3a =>  
            Mdatain_tb <= x"00000026"; 
            Read_tb <= ‘1’ after 10 ns, ‘0’ after 25 ns;  
                                   MDRin_tb <= ‘1’ after 10 ns, ‘0’ after 25 ns; 
                            WHEN Reg_load3b =>  
            MDRout_tb <= ‘1’ after 10 ns, ‘0’ after 25 ns;  
                                                 R5in_tb <= ‘1’ after 10 ns, ‘0’ after 25 ns;  --  initialize R5 with the value $26          
                  
                             WHEN T0 =>                                             -- see if you need to de-assert these signals 
             PCout_tb <= ‘1’;   MARin_tb <= ‘1’;   IncPC_tb <= ‘1’;   Zin_tb <= ‘1’;  
      WHEN T1 =>        
             Zlowout_tb <= ‘1’;   PCin_tb <= ‘1’;   Read_tb <= ‘1’;   MDRin_tb <= ‘1’; 
             Mdatain_tb <= x”4A920000”;       -- opcode for “and R5, R2, R4” 
                             WHEN T2 => 
             MDRout_tb <= ‘1’;   IRin_tb <= ‘1’; 
                                            WHEN T3 => 
                                    R2out_tb <= ‘1’;   Yin_tb <= ‘1’; 
                                            WHEN T4 => 
                                    R4out_tb <= ‘1’;   AND_tb <= ‘1’;   Zin_tb <= ‘1’; 
                                            WHEN T5 => 
                                    Zlowout_tb <= ‘1’;   R5in_tb <= ‘1’;       
      WHEN OTHERS => 
    END CASE; 
  END PROCESS;   
END ARCHITECTURE datapath_tb_arch; 
 
11
Here is a sample testbench template in Verilog for the logical AND instruction, and R5, R2, R4, which you 
may need to verify and revise for other instructions.   
 
// and datapath_tb.v file: <This is the filename> 
`timescale 1ns/10ps 
module datapath_tb;       
    reg  PCout, Zlowout, MDRout, R2out, R4out;           // add any other signals to see in your simulation 
    reg  MARin, Zin, PCin, MDRin, IRin, Yin;    
    reg   IncPC, Read, AND, R5in, R2in, R4in; 
    reg  Clock; 
    reg  [31:0] Mdatain;       
 
  parameter   Default = 4’b0000, Reg_load1a = 4’b0001, Reg_load1b = 4’b0010, Reg_load2a = 4’b0011,  
                             Reg_load2b = 4’b0100, Reg_load3a = 4’b0101, Reg_load3b = 4’b0110, T0 = 4’b0111,  
                             T1 = 4’b1000, T2 = 4’b1001, T3 = 4’b1010, T4 = 4’b1011, T5 = 4’b1100; 
    reg   [3:0] Present_state = Default; 
 
Datapath DUT(PCout, Zlowout, MDRout, R2out, R4out, MARin, Zin, PCin, MDRin, IRin, Yin, IncPC, Read, AND, R5in, 
R2in, R4in, Clock, Mdatain); 
 
// add test logic here 
initial  
    begin 
       Clock = 0; 
       forever #10 Clock = ~ Clock; 
end 
 
always @(posedge Clock)  // finite state machine; if clock rising-edge 
   begin 
      case (Present_state) 
   Default   :  Present_state = Reg_load1a; 
Reg_load1a  :  Present_state = Reg_load1b; 
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
 
12
   begin 
      case (Present_state)               // assert the required signals in each clock cycle 
Default: begin 
    PCout <= 0;   Zlowout <= 0;   MDRout <= 0;          // initialize the signals 
                             R2out <= 0;   R4out <= 0;   MARin <= 0;   Zin <= 0;   
                             PCin <=0;   MDRin <= 0;   IRin  <= 0;   Yin <= 0;   
                             IncPC <= 0;   Read <= 0;   AND <= 0; 
                R5in <= 0; R2in <= 0; R4in <= 0; Mdatain <= 32’h00000000; 
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