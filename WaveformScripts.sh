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