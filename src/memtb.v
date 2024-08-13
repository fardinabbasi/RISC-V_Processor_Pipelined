`timescale 1ns/1ns
module datamem_TB();
reg clk,WE,rst;
reg[31:0] A,WD;
wire [31:0]RD;
datamem DM(WD,A,clk,WE,rst,RD);
 initial
  begin
    WD=32'd0;
    A=32'd0;
    WE=1'b0;
    rst = 1'b1;
    clk = 1'b0;
    #20 rst = 1'b0;
  end
  
  always #8 clk = ~clk;
  initial begin
    # 5 A=32'd5;
    # 30 A=32'd6;

    #500 $stop;
  end
endmodule