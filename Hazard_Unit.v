`timescale 1ns/1ns

module hazard_unit (
    input clk,
    input      [4:0] Rs1E,
    input      [4:0] Rs2E,
    input      [4:0] RdM,
    input      [4:0] RdW,
    input      [4:0] A1,
    input      [4:0] A2,
    input      [4:0] RdE,
    input      [1:0] ResultSrcE,
    input            RegWriteM,
    input            RegWriteW,
    input      [1:0] PCSrcE,
    output reg       StallF,
    output reg       StallD,
    output reg       FlushE,
    output reg       FlushD,
    output reg [1:0] ForwardAE,
    output reg [1:0] ForwardBE
);
    reg lwStall;

    always @(*) begin
        if (((Rs1E == RdM) && RegWriteM) && (Rs1E != 0) ) begin
            ForwardAE = 2'b10;
        end
        else if ( ((Rs1E == RdW) && RegWriteW) && (Rs1E != 0) ) begin
            ForwardAE = 2'b01;
        end
        else begin
            ForwardAE = 2'b00;
        end
        
    end

    always @ (*) begin
        if (((Rs2E == RdM) && RegWriteM) && (Rs2E != 0) ) begin
            ForwardBE = 2'b10;
        end
        else if ( ((Rs2E == RdW) && RegWriteW) && (Rs2E != 0) ) begin
            ForwardBE = 2'b01;
        end
        else begin
            ForwardBE = 2'b00;
        end
        
    end

    always @ (* ) begin
        lwStall = (ResultSrcE[0] & ((A1 == RdE) | (A2 == RdE)));
        StallD  = lwStall;
        FlushE  = lwStall | (PCSrcE!=2'b00);
        StallF  = lwStall; 
        FlushD  = (PCSrcE!=2'b00);
    end

endmodule
