`timescale 1ns/1ns
module datamem (
    input [31:0] WD,
    input [31:0] A,
    input clk,WE,rst,
    output reg [31:0] ReadData
);
    reg [31:0] Data_Mem [0:999];
    /*
initial begin
       Data_Mem[0] <= 32'h0x00000005;
       Data_Mem[1] <= 32'h0xFFFFFFFB; //32'hFFC4A303; 0x8CDEFAB7
       Data_Mem[2] <= 32'h0x0000000A;
       Data_Mem[3] <= 32'h0x00000041;
       Data_Mem[4] <= 32'h0xFFFFFFDC; 
       Data_Mem[5] <= 32'h0xFFFFFF91;
       Data_Mem[6] <= 32'h0x0000004B;
       Data_Mem[7] <= 32'h0x00000059;
       Data_Mem[8] <= 32'h0x00000290;
       Data_Mem[9] <= 32'h0xFFFFFCFE; 
end
*/
initial begin
    $readmemh("datamemory.txt", Data_Mem);
end
    integer i;
    always @(*) begin
        ReadData <= Data_Mem[A/4];
    end
    always @(posedge clk) begin
       // if (rst) begin
         //   for(i=0;i<32;i=i+1)
        //         Data_Mem[i] <= 32'd0;end
        if (WE) begin
            Data_Mem[A/4] <= WD; 
        end
    end
endmodule