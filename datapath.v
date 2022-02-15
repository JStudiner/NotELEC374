
module datapath(
    output bus_contents [31:0],
    input wire [31:0] i
);
    //create input wire of 5 bits,
    input wire [4:0] S;
    input wire [31:0] r0_data_out,r1_data_out,r2_data_out,r3_data_out,r4_data_out,r5_data_out,r6_data_out,r7_data_out,r8_data_out,r9_data_out,r10_data_out, r11_data_out,r12_data_out,r13_data_out,r14_data_out,r15_data_out,
    HI_data_out,LO_data_out,Zhigh_data_out,Zlow_data_out,PC_data_out,IR_data_out,MDR_data_out,MAR_data_out;
    //make the enable symbols, combine and send to encoder
    //do the same with the data out symbols but send to the mux
    input wire clr;
    input wire clk;
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
    encoder_32_5 ENC(S,i); //what the encoder input is?
    //what is the second mux input
    mux_32_to_1 MUX(bus_contents,?,S);
    //MDR stuff
    input wire [31:0] MdMUXout,Mdatain;
    input wire [1:0] read;
    mux_2_to_1 MDMUX(MdMUXout,bus_contents,Mdatain,read);
    input wire [1:0] MDRin;
    reg_32_bit MDR(clk,clr,MDRin,MDMUXout,MDR_data_out)
    
    //simulated control signals coming from Control Unit
    //are the ins the enables?
    R0in, R0out; R1in, R1out; ...; R15in, R15out; HIin; HIout; LOin; LOout; PCin, PCout; IRin; 
    Zin; Zhighout, Zlowout; Yin; MARin; MDRin, MDRout; Read; Mdatain[31..0]
end datapath

