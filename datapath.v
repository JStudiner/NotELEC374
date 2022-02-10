module datapath(
    output BusMuxOut [31:0],
    input wire [31:0] i
);
    //create input wire of 5 bits,
    input wire [4:0] S
    input wire [31:0] r0_data_out,r1_data_out,r2_data_out,r3_data_out,r4_data_out,r5_data_out,r6_data_out,r7_data_out,r8_data_out,r9_data_out,r10_data_out, r11_data_out,r12_data_out,r13_data_out,r14_data_out,r15_data_out
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
    reg_32bit HIout(clk, clr, HIout_enable, bus_contents, HIout_data_out);
    reg_32bit LOout(clk, clr, Lout_enable, bus_contents, Lout_data_out);
    reg_32bit LOout(clk, clr, Lout_enable, bus_contents, Lout_data_out);
    reg_32bit Zhighout(clk, clr, Zhighout_enable, bus_contents, Zhighout_data_out);
    reg_32bit Zlowout(clk, clr, Zhighout_enable, bus_contents, Zlowout_data_out);
    reg_32bit Zlowout(clk, clr, Zhighout_enable, bus_contents, Zlowout_data_out);
    encoder_32_5 ENC(?,i);
    mux_32_to_1 MUX(BusMuxOut,?,?)
end datapath