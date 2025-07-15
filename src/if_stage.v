module if_stage(
    input clk,
    input reset,
    output reg [31:0] pc_out,
    output reg [31:0] instruction
);

reg [31:0] instr_mem [0:255]; // 256-word instruction memory
reg [31:0] pc;

initial begin
    $readmemh("testbench/test_program.hex", instr_mem); // Load program
end

// PC update logic
always @(posedge clk or posedge reset) begin
    if (reset)
        pc <= 0;
    else if ((pc >> 2) < 5)  // 5 instructions only
        pc <= pc + 4;

    pc_out <= pc; // Expose current PC
end

// Instruction fetch with bounds check
always @(*) begin
    if ((pc >> 2) < 5)
        instruction = instr_mem[pc >> 2];
    else
        instruction = 32'b0; // Output NOP after instruction list
end

endmodule
