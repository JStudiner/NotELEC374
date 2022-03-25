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
add wave -position insertpoint sim:/addi_tb/DUT/Y_data_out;
add wave -position insertpoint sim:/addi_tb/DUT/Zlow_data_out;
add wave -position insertpoint sim:/addi_tb/DUT/r0_data_out;
add wave -position insertpoint sim:/addi_tb/DUT/r1_data_out;
add wave -position insertpoint sim:/addi_tb/DUT/r2_data_out;
add wave -position insertpoint sim:/addi_tb/DUT/Mdatain;
add wave -position insertpoint sim:/addi_tb/DUT/PC_data_out;
add wave -position insertpoint sim:/addi_tb/DUT/MDR_data_out;
add wave -position insertpoint sim:/addi_tb/DUT/MAR_data_out;
add wave -position insertpoint sim:/addi_tb/DUT/IR_data_out;
add wave -position insertpoint sim:/addi_tb/DUT/SAE/*;
restart -f;
run 1500ns;

branch 
add wave -position insertpoint sim:/brzr_tb/DUT/r2_data_out;
add wave -position insertpoint sim:/brzr_tb/DUT/PC_data_out;
add wave -position insertpoint sim:/brzr_tb/DUT/Y_data_out;
add wave -position insertpoint sim:/brzr_tb/DUT/Zlow_data_out;
add wave -position insertpoint sim:/brzr_tb/DUT/conff/*;
add wave -position insertpoint sim:/brzr_tb/DUT/IR_data_out;

restart -f;
run 1500ns;
jump
add wave -position insertpoint sim:/brzr_tb/DUT/r1_data_out;
add wave -position insertpoint sim:/brzr_tb/DUT/r15_data_out;
add wave -position insertpoint sim:/brzr_tb/DUT/PC_data_out;
add wave -position insertpoint sim:/brzr_tb/DUT/Y_data_out;

add wave -position insertpoint  \
sim:/ld_tb/DUT/Ram/*
add wave -position insertpoint  \
sim:/st_tb/DUT/i
add wave -position insertpoint  \
sim:/st_tb/DUT/ENC/*
add wave -position insertpoint  \
sim:/ld_tb/DUT/SAE/*
restart -f;
run 1500ns;
add wave -position insertpoint  \
sim:/st_tb/DUT/Ram/*

add wave -position insertpoint  \
sim:/st_tb/DUT/Ram/*
add wave -position insertpoint  \
sim:/st_tb/DUT/SAE/*
add wave -position insertpoint sim:/st_tb/DUT/MAR_data_out;
add wave -position insertpoint sim:/st_tb/DUT/MDR_data_out;
add wave -position insertpoint sim:/st_tb/DUT/r1_data_out;
add wave -position insertpoint  \
{sim:/st_tb/DUT/Ram/memory[91]}
add wave -position insertpoint  \
{sim:/st_tb/DUT/Ram/memory[90]}
add wave -position insertpoint  \
{sim:/st_tb/DUT/Ram/memory[89]}
add wave -position insertpoint  \

run 1500ns;


