module pc_mux (input  [31:0] PCPlus4F,PCTargetE,ALUResultM,input  [1:0] PCSrcE,output [31:0] PCnext);
     assign PCnext = (PCSrcE==2'b00)?PCPlus4F:(PCSrcE==2'b01)?PCTargetE:ALUResultM;
endmodule
