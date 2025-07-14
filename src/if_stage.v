module if_stage(
    input clk,
    input reset,
    input [31:0] pc_in,
    output reg [31:0] pc_out,
    output reg [31:0] instruction
);

reg [31:0] instr_mem [0:255]; // 256-word instruction memory

initial begin
    $readmemh("testbench/test_program.hex", instr_mem); // Load program
end

always @(posedge clk or posedge reset) begin
    if (reset)
        pc_out <= 0;
    else
        pc_out <= pc_in + 4;

    instruction <= instr_mem[pc_in >> 2]; // Fetch instruction
end

endmodule
