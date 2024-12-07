module tb_traffic();

reg clk;
wire red,yellow,green;

traffic_project tl(clk,red,yellow,green);

always #1 clk=~clk;

initial begin
clk = 1'b0;
end

initial
begin
$dumpfile("dump.vcd");
$dumpvars;
  $monitor($time,"clk=%b,count=%d,red=%b,green=%b,yellow=%b",clk,tl.count,red,green,yellow);
  #100 $finish();
end
endmodule