module mux_32_to_1 (
    output  reg [31:0] bus_contents,
    input  wire  [4:0] select,
    input wire [31:0] data_0, 
    input wire [31:0] data_1, 
    input wire[31:0] data_2,
     input wire [31:0] data_3 ,
     input wire [31:0]  data_4 ,
     input wire [31:0] data_5,
      input wire [31:0]  data_6,
      input wire [31:0]  data_7,
      input wire [31:0] data_8, 
      input wire [31:0]  data_9,
      input wire [31:0]  data_10,
       input wire [31:0]  data_11, 
       input wire [31:0]  data_12, 
       input wire [31:0] data_13 ,
       input wire [31:0]  data_14, 
       input wire [31:0] data_15 ,
       input wire [31:0] data_16 ,
       input wire [31:0] data_17 ,
       input wire [31:0] data_18 ,
       input wire [31:0] data_19 ,
       input wire [31:0] data_20,
       input wire [31:0] data_21 ,
       input wire [31:0] data_22,
       input wire [31:0] data_23,
       input wire [31:0] data_25,
       input wire [31:0] data_26,
       input wire clk
);


always @ (clk)
begin
case(select)
     0 : bus_contents <=data_0;
     1: bus_contents <=data_1;
     2 : bus_contents <=data_2;
     3 : bus_contents <=data_3;
     4 : bus_contents <=data_4;
     5 : bus_contents <=data_5;
     6 : bus_contents <=data_6;
     7 : bus_contents <=data_7;
     8 : bus_contents <=data_8;
     9 : bus_contents <=data_9;
     10 : bus_contents <=data_10;
     11 : bus_contents <=data_11;
     12 : bus_contents <=data_12;
     13 : bus_contents <=data_13;
     14 : bus_contents <=data_14;
     15 : bus_contents <=data_15;
     16 : bus_contents <=data_16;
     17 : bus_contents <=data_17;
     18 : bus_contents <=data_18;
     19 : bus_contents <=data_19;
     20 : bus_contents <=data_20;
     21 : bus_contents <=data_21;
     22 : bus_contents <=data_22;
     23 : bus_contents<=data_23;
     25: bus_contents<=data_25;
     default: begin end
endcase
end
endmodule
