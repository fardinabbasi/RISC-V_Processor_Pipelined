module mux_SrcBE1(input [31:0] RD2E, ResultW, ALUResultM,input [1:0] ForwardBE, output [31:0] WriteDataE);
    assign WriteDataE = (ForwardBE==2'b00) ? RD2E : (ForwardBE==2'b01) ? ResultW : ALUResultM;
endmodule
