`timescale 1ns/1ps

module cpu_tb;

reg clk;
reg reset;

cpu_top uut (
    .clk(clk),
    .reset(reset)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock
end

initial begin
    reset = 1;
    #15 reset = 0; // clock starts after 15ns
    #200 $finish;
end

endmodule
