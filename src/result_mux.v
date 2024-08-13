`timescale 1ns/1ns
module result_mux (input  [31:0] ALUResultW, ReadDataW, PCPlus4W,ExtImmW,input  [1:0] ResultSrcW,output [31:0] ResultW);
     assign ResultW = (ResultSrcW==2'b00)?ALUResultW:(ResultSrcW==2'b01)?ReadDataW:(ResultSrcW==2'b10)?PCPlus4W:ExtImmW;
endmodule