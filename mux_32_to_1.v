module mux_32_to_1 #(parameter word_size = 32)(
    output [word_size]   mux_out,
    input  [word_size]   data_0,data_1,data_2,data_3, data_4,data_5, data_6, data_7,data_8, data_9, data_10, data_11, data_12,data_13, data_14,data_15,data_16,data_17,data_18,data_19,data_20,data_21,data_22.data_23,data_24,data_25, data_26,data_27,data_28, data_29,data_30,data_31
    input  [4:0]         select
);

always @ (mux_out or select or data_0 or data_1 or data_2 or data_3 or data_4 or data_5 or data_6 or data_7
 or data_8 or data_9 or data_10 or data_11 or data_12 or data_13 or data_14 or data_15 or data_16 or data_17 or data_18
  or data_19 or data_20 or data_21 or data_22 or data_23 or data_24 or data_25 or data_26 or data_27 or data_28 or data_29
   or data_30 or data_31)

case(select)
     0 : mux_out <=data_0
     1 : mux_out <=data_1
     2 : mux_out <=data_2
     3 : mux_out <=data_3
     4 : mux_out <=data_4
     5 : mux_out <=data_5
     6 : mux_out <=data_6
     7 : mux_out <=data_7
     8 : mux_out <=data_8
     9 : mux_out <=data_9
     10 : mux_out <=data_10
     11 : mux_out <=data_11
     12 : mux_out <=data_12
     13 : mux_out <=data_13
     14 : mux_out <=data_14
     15 : mux_out <=data_15
     16 : mux_out <=data_16
     17 : mux_out <=data_17
     18 : mux_out <=data_18
     19 : mux_out <=data_19
     20 : mux_out <=data_20
     21 : mux_out <=data_21
     22 : mux_out <=data_22
     23 : mux_out <=data_23
     24 : mux_out <=data_24
     25 : mux_out <=data_25
     26 : mux_out <=data_26
     27 : mux_out <=data_27
     28 : mux_out <=data_28
     29 : mux_out <=data_29
     30 : mux_out <=data_30
     31 : mux_out <=data_13
endcase
end
end module



//assign mux_out = select ? data_1 : data_0

