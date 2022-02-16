module mux_32_to_1 (
    output  reg [31:0] mux_out,
    input  wire  [4:0] select,
    input wire [31:0] data_0, 
    input wire [31:0] data_1, 
    input wire[31:0] data_2,
     input wire [31:0] data_3 ,
     input wire [31:0]  data_4 ,
     input wire [31:0] data_5,
      input wire [31:0]  data_6,
      input wire [31:0]  data_7 ,
      input wire [31:0] data_8, 
      input wire [31:0]  data_9 ,
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
       input wire [31:0] data_20 ,
       input wire [31:0] data_21 ,
       input wire [31:0] data_22,
       input wire [31:0] data_24 ,
       input wire [31:0] data_25 ,
       input wire [31:0]  data_26, 
       input wire [31:0] data_27 ,
       input wire [31:0] data_28 ,
       input wire [31:0] data_29 ,
       input wire [31:0] data_30 ,
       input wire [31:0] data_31 ,
       input wire [31:0] data_23
);

always @ (select or data_0 or data_1 or data_2 or data_3 or  data_4 or data_5 
or  data_6 or  data_7 or data_8 or  data_9 or data_10 or data_11 or data_12 or data_13 or data_14 or data_15 
or data_16 or data_17 or data_18 or data_19 or data_20 or data_21 or data_22 or data_23 or data_24 or data_25 
or data_26 or data_27 or data_28 or data_29 or data_30 or data_31)
begin
case(select)
     0 : mux_out <=data_0;
     1 : mux_out <=data_1;
     2 : mux_out <=data_2;
     3 : mux_out <=data_3;
     4 : mux_out <=data_4;
     5 : mux_out <=data_5;
     6 : mux_out <=data_6;
     7 : mux_out <=data_7;
     8 : mux_out <=data_8;
     9 : mux_out <=data_9;
     10 : mux_out <=data_10;
     11 : mux_out <=data_11;
     12 : mux_out <=data_12;
     13 : mux_out <=data_13;
     14 : mux_out <=data_14;
     15 : mux_out <=data_15;
     16 : mux_out <=data_16;
     17 : mux_out <=data_17;
     18 : mux_out <=data_18;
     19 : mux_out <=data_19;
     20 : mux_out <=data_20;
     21 : mux_out <=data_21;
     22 : mux_out <=data_22;
     23 : mux_out <=data_23;
     24 : mux_out <=data_24;
     25 : mux_out <=data_25;
     26 : mux_out <=data_26;
     27 : mux_out <=data_27;
     28 : mux_out <=data_28;
     29 : mux_out <=data_29;
     30 : mux_out <=data_30;
     31 : mux_out <=data_31;
endcase
end
endmodule
/*
always @ (mux_out or select or mux_input[0] or mux_input[1] or mux_input[2] or mux_input[3] or mux_input[4] or mux_input[5] or mux_input[6]
 or mux_input[7] or mux_input[8] or mux_input[9] or mux_input[10] or mux_input[11]  or mux_input[12] or mux_input[13] or mux_input[14] or mux_input[15] or mux_input[16] or mux_input[17]
  or mux_input[18] or mux_input[19] or mux_input[20] or mux_input[21] or mux_input[22] or mux_input[23] or mux_input[24] or mux_input[25] or mux_input[26] or mux_input[27] or mux_input[28]
   or mux_input[29] or mux_input[30]or mux_input[31])

case(select)
     0 : mux_out <=mux_input[0];
     1 : mux_out <=mux_input[1];
     2 : mux_out <=mux_input[2];
     3 : mux_out <=mux_input[3];
     4 : mux_out <=mux_input[4];
     5 : mux_out <=mux_input[5];
     6 : mux_out <=mux_input[6];
     7 : mux_out <=mux_input[7];
     8 : mux_out <=mux_input[8];
     9 : mux_out <=mux_input[9];
     10 : mux_out <=mux_input[10];
     11 : mux_out <=mux_input[11];
     12 : mux_out <=mux_input[12];
     13 : mux_out <=mux_input[13];
     14 : mux_out <=mux_input[14];
     15 : mux_out <=mux_input[15];
     16 : mux_out <=mux_input[16];
     17 : mux_out <=mux_input[17];
     18 : mux_out <=mux_input[18];
     19 : mux_out <=mux_input[19];
     20 : mux_out <=mux_input[20];
     21 : mux_out <=mux_input[21];
     22 : mux_out <=mux_input[22];
     23 : mux_out <=mux_input[23];
     24 : mux_out <=mux_input[24];
     25 : mux_out <=mux_input[25];
     26 : mux_out <=mux_input[26];
     27 : mux_out <=mux_input[27];
     28 : mux_out <=mux_input[28];
     29 : mux_out <=mux_input[29];
     30 : mux_out <=mux_input[30];
     31 : mux_out <=mux_input[31];
endcase
endmodule




//assign mux_out = select ? data_1 : data_0

*/