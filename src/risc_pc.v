`timescale 1ns/1ns
module Adress_Generator (
     input rst,clk,StallF,input[31:0]PCnext,
    output reg [31:0] PCF
);
    always @(posedge clk) begin
        if (rst)
            PCF <= 32'd0;
        else if(StallF)
            PCF <= PCF;
        else
            PCF <= PCnext;    
    end 
endmodule
