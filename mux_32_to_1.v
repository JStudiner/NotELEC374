module mux_32_to_1 #(parameter word_size = 32)(
    output [word_size]   mux_out,
    //input wire [word_size]   data_0,data_1,data_2,data_3, data_4,data_5, data_6, data_7,data_8, data_9, data_10, data_11, data_12,data_13, data_14,data_15,data_16,data_17,data_18,data_19,data_20,data_21,data_22.data_23,data_24,data_25, data_26,data_27,data_28, mux_input[28],data_30,data_31
    input wire [31:0]  mux_input [31:0],
    input  [4:0]         select
);

/*always @ (mux_out or select or mux_input[0] or mux_input[1] or mux_input[2] or mux_input[3] or mux_input[4] or mux_input[2] or mux_input[5] or mux_input[6]
 or mux_input[7] or mux_input[8] or mux_input[9] or mux_input[10] or mux_input[11]  or mux_input[12] or mux_input[13] or mux_input[14] or data_16 or data_17 or data_18
  or data_19 or data_20 or data_21 or data_22 or data_23 or data_24 or data_25 or data_26 or data_27 or mux_input[22]or mux_input[28]
   or data_30 or data_31)
*/
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
end
endmodule



//assign mux_out = select ? data_1 : data_0

