module register_file(
    input clk,
    input we,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input [31:0] wd,
    output [31:0] rd1,
    output [31:0] rd2
);

reg [31:0] regs[0:31];

// Read ports (combinational)
assign rd1 = regs[rs1];
assign rd2 = regs[rs2];

// Write port (synchronous)
always @(posedge clk) begin
    if (we && rd != 0)
        regs[rd] <= wd;
end

// Initialize register values for simulation
integer i;
initial begin
    for (i = 0; i < 32; i = i + 1)
        regs[i] = i;  // Set register x0 = 0, x1 = 1, ..., x31 = 31
end

endmodule

