module mux_SrcBE2(input [31:0] WriteDataE, ExtImmE, input ALUSrcE, output [31:0] SrcBE);
     assign SrcBE = ALUSrcE ?  ExtImmE:WriteDataE;
endmodule
