Phase 1 Scripts
add wave -position insertpoint sim:/AND_tb/DUT/bus_contents;
add wave -position insertpoint sim:/AND_tb/DUT/S;
add wave -position insertpoint sim:/AND_tb/DUT/ALU_Low_Out;
add wave -position insertpoint sim:/AND_tb/DUT/ALU_Sel;
add wave -position insertpoint sim:/AND_tb/DUT/bus_contents;
add wave -position insertpoint sim:/AND_tb/DUT/S;
add wave -position insertpoint sim:/AND_tb/DUT/ALU_Low_Out;
add wave -position insertpoint sim:/AND_tb/DUT/ALU_Sel;

restart -f;
run 1500ns;

Phase 2 Scripts
add wave -position insertpoint sim:/ld_tb/DUT/Y_data_out;
add wave -position insertpoint sim:/ld_tb/DUT/Zlow_data_out;
add wave -position insertpoint sim:/ld_tb/DUT/r0_data_out;
add wave -position insertpoint sim:/ld_tb/DUT/r1_data_out;
add wave -position insertpoint sim:/ld_tb/DUT/Mdatain;
add wave -position insertpoint sim:/ld_tb/DUT/PC_data_out;
add wave -position insertpoint sim:/ld_tb/DUT/MDR_data_out;
add wave -position insertpoint sim:/ld_tb/DUT/MAR_data_out;
add wave -position insertpoint sim:/ld_tb/DUT/IR_data_out;
sim:/ld_tb/DUT/bus_contents
add wave -position insertpoint  \
sim:/ld_tb/DUT/ENC/S
add wave -position insertpoint  \
sim:/ld_tb/DUT/i
add wave -position insertpoint  \
sim:/ld_tb/DUT/Ram/*
restart -f;
run 1500ns;

//we need to look at the 4 to 16 decoder value
//it should be 1
//reg
Test for SAE
add wave -position insertpoint  \
sim:/ld_tb/DUT/ENC/S
add wave -position insertpoint  \
sim:/ld_tb/DUT/regIn
add wave -position insertpoint  \
sim:/ld_tb/DUT/SAE/A \
sim:/ld_tb/DUT/SAE/B \

sim:/ld_tb/DUT/SAE/C \
sim:/ld_tb/DUT/SAE/C_sign_extended \
sim:/ld_tb/DUT/SAE/D \
sim:/ld_tb/DUT/SAE/Gra \
sim:/ld_tb/DUT/SAE/Grb \
sim:/ld_tb/DUT/SAE/Grc \
sim:/ld_tb/DUT/SAE/Instruction \
sim:/ld_tb/DUT/SAE/Ra \
sim:/ld_tb/DUT/SAE/Rb \
sim:/ld_tb/DUT/SAE/Rc \
sim:/ld_tb/DUT/SAE/RegIn \
sim:/ld_tb/DUT/SAE/RegOut \
sim:/ld_tb/DUT/SAE/Rin \
sim:/ld_tb/DUT/SAE/Rout \
sim:/ld_tb/DUT/SAE/clk \
sim:/ld_tb/DUT/SAE/data_out \
sim:/ld_tb/DUT/SAE/outSig
restart -f;
run 1500 ns;

add wave -position insertpoint  \
sim:/ld_tb/DUT/SAE/BAout \
add wave -position insertpoint  \
sim:/ld_tb/DUT/SAE/RegOut
add wave -position insertpoint  \
sim:/ld_tb/DUT/SAE/decode/d_out
add wave -position insertpoint  \
sim:/ld_tb/DUT/R0/val
add wave -position insertpoint sim:/ld_tb/DUT/SAE/decode/*

add wave -position insertpoint  \
sim:/ld_tb/DUT/SAE/RegOut

add wave -position insertpoint  \
sim:/ld_tb/DUT/ENC/S
add wave -position insertpoint sim:/ld_tb/DUT/R0/*
restart -f;

run 1500 ns;

add wave -position insertpoint  \
{sim:/ld_tb/DUT/Ram/memory[0]}
add wave -position insertpoint  \
{sim:/ld_tb/DUT/Ram/memory[35]}
add wave -position insertpoint  \
{sim:/ld_tb/DUT/Ram/memory[85]}

add wave -position insertpoint sim:/ld_tb/DUT/SAE/*
restart -f;

run 1500 ns;
