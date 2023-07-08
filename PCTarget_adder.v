`timescale 1ns/1ns
module PCTarget_adder(input[31:0]PCE,ExtImmE,output[31:0]PCTargetE);
    assign PCTargetE = PCE + ExtImmE;
endmodule
