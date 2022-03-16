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
add wave -position insertpoint  \
{sim:/ld_tb/DUT/Ram/memory[0]}
add wave -position insertpoint  \
{sim:/ld_tb/DUT/Ram/memory[35]}
add wave -position insertpoint  \
{sim:/ld_tb/DUT/Ram/memory[85]}

restart -f;
run 1500ns;
