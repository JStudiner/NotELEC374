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
    input  [31:0]MDR_data_out,
    input  wire[31:0] r0_data_out,r1_data_out,r2_data_out,r3_data_out,r4_data_out,r5_data_out,r6_data_out,
    r7_data_out,r8_data_out,r9_data_out,r10_data_out, r11_data_out,r12_data_out,r13_data_out,r14_data_out,r15_data_out,
    HI_data_out,LO_data_out,Zhigh_data_out,Zlow_data_out,PC_data_out,IR_data_out,MAR_data_out,Y_data_out,
    input wire [31:0] i,
    input wire clk,
    input wire [5:0] ALU_Sel,
    input wire [31:0] Mdatain,
    input wire read,
    input wire clr
);
    reg [31:0] MDR_Out;
    wire [4:0] S;
    reg [31:0] enc_input;
    encoder_32_5 ENC(S,enc_input);
    //mux stuff
    mux_32_to_1 MUX(bus_contents,S,r0_data_out,r1_data_out,r2_data_out,r3_data_out,r4_data_out,r5_data_out,r6_data_out,r7_data_out,r8_data_out,r9_data_out,r10_data_out, r11_data_out,r12_data_out,r13_data_out,r14_data_out,r15_data_out,
    HI_data_out,LO_data_out,Zhigh_data_out,Zlow_data_out,PC_data_out,IR_data_out,MDR_data_out,MAR_data_out,Y_data_out,clk);
    //MDR stuff
    wire [31:0] MdMUXout;
    mux_2_to_1 MDMUX(MdMUXout,bus_contents,Mdatain,read);
     reg MDR_enable;
    reg_32bit MDR(clk,clr,MDR_enable,MdMUXout,MDR_data_out);
    reg r0_enable; 
    reg r1_enable; 
    reg r2_enable;
    reg r3_enable; 
    reg r4_enable; 
    reg r5_enable; 
    reg r6_enable; 
    reg r7_enable; 
    reg r8_enable; 
    reg r9_enable; 
    reg r10_enable; 
    reg  r11_enable; 
    reg r12_enable; 
    reg r13_enable; 
    reg r14_enable;
    reg r15_enable;
    reg HI_enable; 
    reg LO_enable;
    reg Zhigh_enable;
    reg Zlow_enable;
    reg PC_enable;
    reg IR_enable;
    reg MAR_enable;
    reg Y_enable;
    reg_32bit R0(clk, clr, r0_enable, bus_contents, r0_data_out); // data out is bus input
    reg_32bit R1(clk, clr, r1_enable, bus_contents, r1_data_out);
    reg_32bit R2(clk, clr, r2_enable, bus_contents, r2_data_out);
    reg_32bit R3(clk, clr, r3_enable, bus_contents, r3_data_out);
    reg_32bit R4(clk, clr, r4_enable, bus_contents, r4_data_out);
    reg_32bit R5(clk, clr, r5_enable, bus_contents, r5_data_out);
    reg_32bit R6(clk, clr, r6_enable, bus_contents, r6_data_out);
    reg_32bit R7(clk, clr, r7_enable, bus_contents, r7_data_out);
    reg_32bit R8(clk, clr, r8_enable, bus_contents, r8_data_out);
    reg_32bit R9(clk, clr, r9_enable, bus_contents, r9_data_out);
    reg_32bit R10(clk, clr, r10_enable, bus_contents, r10_data_out);
    reg_32bit R11(clk, clr, r11_enable, bus_contents, r11_data_out);
    reg_32bit R12(clk, clr, r12_enable, bus_contents, r12_data_out);
    reg_32bit R13(clk, clr, r13_enable, bus_contents, r13_data_out);
    reg_32bit R14(clk, clr, r14_enable, bus_contents, r14_data_out);
    reg_32bit R15(clk, clr, r15_enable, bus_contents, r15_data_out);
    reg_32bit HI(clk, clr, HI_enable, bus_contents, HI_data_out);
    reg_32bit LO(clk, clr, LO_enable, bus_contents, LO_data_out);
    reg_32bit Zhigh(clk, clr, Zhigh_enable, bus_contents, Zhigh_data_out);
    reg_32bit Zlow(clk, clr, Zlow_enable, bus_contents, Zlow_data_out);
    reg_32bit PC(clk, clr, PC_enable, bus_contents, PC_data_out);
    reg_32bit IR(clk, clr,IR_enable, bus_contents, IR_data_out);
    reg_32bit MAR(clk, clr, MAR_enable, bus_contents, MAR_data_out);
    reg_32bit Y(clk, clr, Y_enable, bus_contents, Y_data_out);
    //ALU stuff
    wire ALU_carry_out;
    ALU alu(Y_data_out,bus_contents,ALU_Sel,Zlow_data_out,Zhigh_data_out,ALU_carry_out);
    always @(i)
    begin   
    r0_enable<=i[0];
    r1_enable<=i[1];
    r2_enable<=i[2];
    r3_enable<=i[3];
    r4_enable<=i[4];
    r5_enable<=i[5];
    r6_enable <= i[6];
    r7_enable <= i[7];
	r8_enable <= i[8];
	 r9_enable <= i[9];
    r10_enable <= i[10];
	 r11_enable <= i[11];
    r12_enable <= i[12];
    r13_enable <= i[13];
    r14_enable <= i[14];
    r15_enable <= i[15];
    HI_enable <= i[16];
    LO_enable <= i[17];
    Zhigh_enable <= i[18];
    Zlow_enable <= i[19];
    PC_enable <= i[20];
    IR_enable <= i[21];
    MDR_enable <= i[22];
    MAR_enable <= i[23];
    Y_enable <= i[24];
    enc_input[0] <= r0_enable;
    enc_input[1] <= r1_enable;
    enc_input[2] <= r2_enable;
    enc_input[3] <= r3_enable;
    enc_input[4] <= r4_enable;
    enc_input[5] <= r5_enable;
    enc_input[6] <= r6_enable;
    enc_input[7] <= r7_enable;
    enc_input[8] <= r8_enable;
    enc_input[9] <= r9_enable;
    enc_input[10] <= r10_enable;
    enc_input[11] <=  r11_enable;
    enc_input[12] <= r12_enable;
    enc_input[13] <= r13_enable;
    enc_input[14] <= r14_enable;
    enc_input[15] <= r15_enable;
    enc_input[16] <=  HI_enable;
    enc_input[17] <= LO_enable;
    enc_input[18] <= Zhigh_enable;
    enc_input[19] <= Zlow_enable;
    enc_input[20] <= PC_enable;
    enc_input[21] <= IR_enable;
    enc_input[22] <= MDR_enable;
    enc_input[23] <= MAR_enable;
    enc_input[24] <= Y_enable;
    enc_input[25]<=0;
    enc_input[26]<=0;
    enc_input[27]<=0;
    enc_input[28]<=0;
    enc_input[29]<=0;
    enc_input[30]<=0;
    enc_input[31]<=0;
    end
endmodule
     
