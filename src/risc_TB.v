`timescale 1ns/1ns
module risc_TB();
reg rst,clk;
risc_total CPU(rst,clk);
 initial
  begin
    rst = 1'b1;
    clk = 1'b1;
    #5 rst=0;
    
  end
  
  always #10 clk=~clk;
  initial 	begin
    
    #10000 $stop;
  end
endmodule
