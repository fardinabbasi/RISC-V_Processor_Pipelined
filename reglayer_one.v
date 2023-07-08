`timescale 1ns/1ns
module reglayer_one(input rst,clk,StallD,FlushD,input [31:0] instruction,PCF,PCPlus4F,
output reg [31:0] instructionD,PCD,PCPlus4D);
    always @(posedge clk) begin
        if (rst)begin
            PCD <= 32'd0;
            instructionD <= 32'd0;
            PCPlus4D <= 32'd0;
        end
        else if(StallD)begin
            PCD <= PCD;
            instructionD <= instructionD;
            PCPlus4D <= PCPlus4D;
        end
        else if(FlushD)begin
            PCD <= 32'd0;
            instructionD <= 32'd0;
            PCPlus4D <= 32'd0; 
        end
        else begin
            instructionD <=instruction;
            PCD <= PCF;
            PCPlus4D <= PCPlus4F;
        end
    end 
endmodule