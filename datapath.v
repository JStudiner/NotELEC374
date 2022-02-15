
module datapath(
    output bus_contents [31:0],
    input wire enc_input [31:0],
    input wire [31:0]  mux_input [31:0],
);
    //output from ENC, input to Mux
    input wire [4:0] S;
    //inputs to Mux
    input wire [31:0] r0_data_out,r1_data_out,r2_data_out,r3_data_out,r4_data_out,r5_data_out,r6_data_out,r7_data_out,r8_data_out,r9_data_out,r10_data_out, r11_data_out,r12_data_out,r13_data_out,r14_data_out,r15_data_out,
    HI_data_out,LO_data_out,Zhigh_data_out,Zlow_data_out,PC_data_out,IR_data_out,MDR_data_out,MAR_data_out,Y_data_out;
     mux_input[0]=r0_data_out;
     mux_input[1]=r1_data_out;
     mux_input[2]=r2_data_out;
     mux_input[3]=r3_data_out;
     mux_input[4]=r4_data_out;
     mux_input[5]=r5_data_out;
     mux_input[6]=r6_data_out;
     mux_input[7]=r7_data_out;
     mux_input[8]=r8_data_out;
     mux_input[9]=r9_data_out;
     mux_input[10]=r10_data_out;
     mux_input[11]=r11_data_out;
     mux_input[12]=r12_data_out;
     mux_input[13]=r13_data_out;
     mux_input[14]=r14_data_out;
     mux_input[15]=r15_data_out;
     mux_input[16]=HI_data_out;
     mux_input[17]=LO_data_out;
     mux_input[18]=Zhigh_data_out;
     mux_input[19]=Zlow_data_out;
     mux_input[20]=PC_data_out;
     mux_input[21]=IR_data_out;
     mux_input[22]=MDR_data_out;
     mux_input[23]=MAR_data_out;
     mux_input[24]=Y_data_out;
    //inputs to Enc
    input wire [1:0] r0_enable,r1_enable,r2_enable,r3_enable,r4_enable,r5_enable,r6_enable,r7_enable,r8_enable,r9_enable,r10_enable, r11_enable,r12_enable,r13_enable,r14_enable,r15_enable,
    HI_enable,LO_enable,Zhigh_enable,Zlow_enable,PC_enable,IR_enable,MDR_enable,MAR_enable,Y_enable;
    enc_input[0]=r0_enable;
    enc_input[1]=r1_enable;
    enc_input[2]=r2_enable;
    enc_input[3]=r3_enable;
    enc_input[4]=r4_enable;
    enc_input[5]=r5_enable;
    enc_input[6]=r6_enable;
    enc_input[7]=r7_enable;
    enc_input[8]=r8_enable;
    enc_input[9]=r9_enable;
    enc_input[10]=r10_enable;
    enc_input[11]=r11_enable;
    enc_input[12]=r12_enable;
    enc_input[13]=r13_enable;
    enc_input[14]=r14_enable;
    enc_input[15]=r15_enable;
    enc_input[16]=HI_enable;
    enc_input[17]=LO_enable;
    enc_input[18]=Zhigh_enable;
    enc_input[19]=Zlow_enable;
    enc_input[20]=PC_enable;
    enc_input[21]=IR_enable;
    enc_input[22]=MDR_enable;
    enc_input[23]=MAR_enable;
    enc_input[24]=Y_enable;
    //make the enable symbols, combine and send to encoder
    //do the same with the data out symbols but send to the mux
    input wire clr;
    input wire clk;
    //make the registers
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
    reg_32bit Zlow(clk, clr, Zhigh_enable, bus_contents, Zlow_data_out);
    reg_32bit PC(clk, clr, PC_enable, bus_contents, PC_data_out);
    reg_32bit IR(clk, clr,IR_enable, bus_contents, IR_data_out);
    reg_32bit MAR(clk, clr, MAR_enable, bus_contents, MAR_data_out);
    reg_32bit Y(clk, clr, Y_enable, bus_contents, Y_data_out);
    encoder_32_5 ENC(S,enc_input);
    mux_32_to_1 MUX(bus_contents,mux_input,S);
    //MDR stuff
    input wire [31:0] MdMUXout,Mdatain;
    input wire [1:0] read;
    mux_2_to_1 MDMUX(MdMUXout,bus_contents,Mdatain,read);
    input wire [1:0] MDRin;
    reg_32_bit MDR(clk,clr,MDRin,MDMUXout,MDR_data_out);
    //ALU Stuff
endmodule