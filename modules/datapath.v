`timescale 1ns/10ps
module datapath( input A,
output reg B
);
    //initializing the clock
    reg clk;
    initial begin
        clk = 0;
    end
    always begin
        #10 clk = ~ clk; 
    end
    //initializing inputs for control unit
    wire reset,stop;
    wire CONFFOut;
    wire [31:0]IR_data_out;
    wire read,write,incPC,Rin,Rout,conIn,outport1Enable,strobeInport1,BAout,clr;
    wire [3:0] Gra,Grb,Grc;
    wire [31:0] enc_input,reg_enable;
    wire [5:0] ALU_Sel;
    //setting up the control unit
    control_unit CU(clk,reset,stop,CONFFOut,IR_data_out,read,write,incPC,Gra,Grb,Grc,Rin,Rout,conIn,
    outport1Enable,strobeInport1,BAout,clr,enc_input,reg_enable,ALU_Sel);
    //signals for select and encode
    //enable
    wire [31:0] C_sign_extended;
    wire [15:0] regIn;
    //signals for inport
    wire [31:0] Inport1DataOut;
    wire inport1Enable;
    wire [15:0] regOut;
    wire[31:0] r0_data_out,r1_data_out,r2_data_out,r3_data_out,r4_data_out,r5_data_out,r6_data_out,
    r7_data_out,r8_data_out,r9_data_out,r10_data_out, r11_data_out,r12_data_out,r13_data_out,r14_data_out,r15_data_out,
    HI_data_out,LO_data_out,Zhigh_data_out,Zlow_data_out,PC_data_out,MAR_data_out,Y_data_out,MDR_data_out;
    //encoder stuff
    wire [4:0] S;
    encoder_32_5 ENC(S,enc_input,regOut,inport1Enable,clk);
    //mux stuff

    wire [31:0] bus_contents;
    mux_32_to_1 MUX(bus_contents,S,r0_data_out,r1_data_out,r2_data_out,r3_data_out,r4_data_out,r5_data_out,r6_data_out,r7_data_out,r8_data_out,r9_data_out,r10_data_out, r11_data_out,r12_data_out,r13_data_out,r14_data_out,r15_data_out,
    HI_data_out,LO_data_out,Zhigh_data_out,Zlow_data_out,PC_data_out,IR_data_out,MDR_data_out,MAR_data_out,C_sign_extended,Inport1DataOut,clk);

    //MDR stuff
    wire [31:0] MdMUXout;
    wire [31:0] Mdatain;
    mux_2_to_1 MDMUX(MdMUXout,bus_contents,Mdatain,read,clk);
    reg_32bit #(16'hFFFF) MDR(clk,clr,reg_enable[22],MdMUXout,MDR_data_out);
    reg_32bit #(16'hFFFF) MAR(clk, clr, reg_enable[23], bus_contents, MAR_data_out);
    //ALU stuff
    wire [31:0] ALU_Low_Out,ALU_High_Out;
    wire ALU_carry_out;
    ALU alu(Y_data_out,bus_contents,ALU_Sel,ALU_Low_Out,ALU_High_Out,ALU_carry_out,clk);
    //PC Register
    PC_reg #(0) PC(clk, clr, reg_enable[20], incPC, bus_contents, PC_data_out);
    //General Purpose Registers]
    reg_32bit #(16'h5a) R1(clk, clr, regIn[1], bus_contents, r1_data_out);
    reg_32bit#(16'h1) R2(clk, clr, regIn[2], bus_contents, r2_data_out);
    reg_32bit R3(clk, clr, regIn[3], bus_contents, r3_data_out);
    reg_32bit R4(clk, clr, regIn[4], bus_contents, r4_data_out);
    reg_32bit R5(clk, clr, regIn[5], bus_contents, r5_data_out);
    reg_32bit R6(clk, clr, regIn[6], bus_contents, r6_data_out);
    reg_32bit R7(clk, clr, regIn[7], bus_contents, r7_data_out);
    reg_32bit R8(clk, clr, regIn[8], bus_contents, r8_data_out);
    reg_32bit R9(clk, clr, regIn[9], bus_contents, r9_data_out);
    reg_32bit R10(clk, clr, regIn[10], bus_contents, r10_data_out);
    reg_32bit R11(clk, clr, regIn[11], bus_contents, r11_data_out);
    reg_32bit R12(clk, clr, regIn[12], bus_contents, r12_data_out);
    reg_32bit R13(clk, clr, regIn[13], bus_contents, r13_data_out);
    reg_32bit R14(clk, clr, regIn[14], bus_contents, r14_data_out);
    reg_32bit R15(clk, clr, regIn[15], bus_contents, r15_data_out);
    //I have no idea what these 2 do
    reg_32bit HI(clk, clr, reg_enable[16], bus_contents, HI_data_out);
    reg_32bit LO(clk, clr, reg_enable[17], bus_contents, LO_data_out);
    //ALU output regs
    reg_32bit Zhigh(clk, clr, reg_enable[18], ALU_High_Out, Zhigh_data_out);
    reg_32bit #(16'hFFFF)Zlow(clk, clr, reg_enable[19], ALU_Low_Out, Zlow_data_out);
    //ALU input reg
    reg_32bit #(16'hFFFF)Y(clk, clr,reg_enable[24], bus_contents, Y_data_out);
    //IR
    reg_32bit #(16'hFFFF)IR(clk, clr,reg_enable[21], bus_contents, IR_data_out);
    //RAM stuff
    ram Ram(read,write,MAR_data_out,MDR_data_out,Mdatain,clk);
    //Select and Encode Stuff
    SelectAndEncode SAE(Gra,Grb,Grc,Rin,Rout,BAout,clk,IR_data_out,regIn,regOut,C_sign_extended);
    //Updated R0
    R0_reg #(0) R0(clk, clr, regIn[0],BAout,bus_contents, r0_data_out);
    //CONFF
    CONFF conff(IR_data_out,conIn,CONFFOut,bus_contents,clk);
    //inport
    wire clearInport1;
    inputUnit #(16'hFEFE)inport1(clrInport,clk,strobeInport1,Inport1DataOut,inport1Enable);
    //outport
    wire clearOutport1;
    wire [31:0] OutportData;
    outputUnit outport1(clearOutport1,clk,outport1Enable,bus_contents,OutportDataOut);
 
endmodule
     
