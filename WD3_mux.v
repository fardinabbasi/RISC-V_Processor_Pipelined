module WD3_mux (input  [31:0] PCPlus4D,ResultW,input WD3_SrcD,output [31:0] OUTWD3);
     assign OUTWD3 = WD3_SrcD ? PCPlus4D:ResultW;
endmodule

