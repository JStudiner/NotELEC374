/*
bus_contents,MDR_data_out,r0_data_out,r1_data_out,r2_data_out,
      r3_data_out,r4_data_out,r5_data_out,r6_data_out,
      r7_data_out,r8_data_out,r9_data_out,r10_data_out, 
      r11_data_out,r12_data_out,r13_data_out,r14_data_out,r15_data_out,
    HI_data_out,LO_data_out,Zhigh_data_out,Zlow_data_out,PC_data_out,
    IR_data_out,MAR_data_out,Y_data_out,i,Clock,ALU_Sel,Mdatain,Read,clr
*/   
module datapath(
    output wire [31:0] bus_contents,
    input  wire[31:0]MDR_data_out,
    input  wire[31:0] r0_data_out,r1_data_out,r2_data_out,r3_data_out,r4_data_out,r5_data_out,r6_data_out,
    r7_data_out,r8_data_out,r9_data_out,r10_data_out, r11_data_out,r12_data_out,r13_data_out,r14_data_out,r15_data_out,
    HI_data_out,LO_data_out,Zhigh_data_out,Zlow_data_out,PC_data_out,IR_data_out,MAR_data_out,Y_data_out,
    input wire [31:0] i,
    input wire clk,
    input wire [5:0] ALU_Sel,
    input wire [31:0] Mdatain,
    input wire read,
    input wire clr,
    input wire [31:0] reg_enable,
    input wire incPC

);
    reg [31:0] MDR_Out;
    wire [4:0] S;
    reg [31:0] enc_input;
    encoder_32_5 ENC(S,i,clk);
    //mux stuff
    wire [31:0] dummyZLow, dummyZHigh;
    mux_32_to_1 MUX(bus_contents,S,r0_data_out,r1_data_out,r2_data_out,r3_data_out,r4_data_out,r5_data_out,r6_data_out,r7_data_out,r8_data_out,r9_data_out,r10_data_out, r11_data_out,r12_data_out,r13_data_out,r14_data_out,r15_data_out,
    HI_data_out,LO_data_out,dummyZHigh,Zlow_data_out,PC_data_out,IR_data_out,MDR_data_out,MAR_data_out,clk);
    //MDR stuff
    wire [31:0] MdMUXout;
    mux_2_to_1 MDMUX(MdMUXout,bus_contents,Mdatain,read);
    reg_32bit MDR(clk,clr,reg_enable[22],MdMUXout,MDR_data_out);
    //ALU stuff
    wire [31:0] ALU_Low_Out,ALU_High_Out;
    wire ALU_carry_out;
    ALU alu(Y_data_out,bus_contents,ALU_Sel,Zlow_data_out,Zhigh_data_out,ALU_carry_out,clk);
    //PC reg
    PC_reg PC(clk, clr, reg_enable[20], incPC, bus_contents, PC_data_out);
    reg_32bit R0(clk, clr, reg_enable[0], bus_contents, r0_data_out); // data out is bus input
    reg_32bit R1(clk, clr, reg_enable[1], bus_contents, r1_data_out);
    reg_32bit R2(clk, clr, reg_enable[2], bus_contents, r2_data_out);
    reg_32bit R3(clk, clr, reg_enable[3], bus_contents, r3_data_out);
    reg_32bit R4(clk, clr, reg_enable[4], bus_contents, r4_data_out);
    reg_32bit R5(clk, clr, reg_enable[5], bus_contents, r5_data_out);
    reg_32bit R6(clk, clr, reg_enable[6], bus_contents, r6_data_out);
    reg_32bit R7(clk, clr, reg_enable[7], bus_contents, r7_data_out);
    reg_32bit R8(clk, clr, reg_enable[8], bus_contents, r8_data_out);
    reg_32bit R9(clk, clr, reg_enable[9], bus_contents, r9_data_out);
    reg_32bit R10(clk, clr, reg_enable[10], bus_contents, r10_data_out);
    reg_32bit R11(clk, clr, reg_enable[11], bus_contents, r11_data_out);
    reg_32bit R12(clk, clr, reg_enable[12], bus_contents, r12_data_out);
    reg_32bit R13(clk, clr, reg_enable[13], bus_contents, r13_data_out);
    reg_32bit R14(clk, clr, reg_enable[14], bus_contents, r14_data_out);
    reg_32bit R15(clk, clr, reg_enable[15], bus_contents, r15_data_out);
    reg_32bit HI(clk, clr, reg_enable[16], bus_contents, HI_data_out);
    reg_32bit LO(clk, clr, reg_enable[17], bus_contents, LO_data_out);
    reg_32bit Zhigh(clk, clr, reg_enable[18], ALU_High_Out, Zhigh_data_out);
    reg_32bit Zlow(clk, clr, reg_enable[19], ALU_Low_Out, Zlow_data_out);
    
    reg_32bit IR(clk, clr,reg_enable[21], bus_contents, IR_data_out);
    reg_32bit MAR(clk, clr, reg_enable[23], bus_contents, MAR_data_out);
    reg_32bit Y(clk, clr,reg_enable[24], bus_contents, Y_data_out);
    //ALU stuff
endmodule
     
