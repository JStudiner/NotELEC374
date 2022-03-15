module init_RAM(indx, instr, clk);
input wire [9:0] indx ;
output reg [31:0] instr;
input wire clk;



reg [31:0] in_ram [512:0]; // length of data is 32 bits and there are 1 

always @ (indx )
begin
  instr = in_ram[indx] ;
end


initial
begin
  $readmemb("C:/Users/Chris2/Uni 2021-2022/ELEC 374/VsCode/Lab1/GitLab1/ELEC374/modules/RAM.txt", in_ram);
end

endmodule





/*
//Initialize with a file



(* ram_init_file = "ram.mif" *) reg [7:0] ram[0:15]

 

//Initialize with Verilog HDL's $readmemb
reg [7:0] ram[0:15];

initial
begin
$readmemb("ram.txt", ram);
end

 

//Initialize with initial construct
reg integer ram[0:15];

initial
begin
for(i = 0; i < 16; i = i + 1)
begin
  ram[i] = i;
end
end

*/