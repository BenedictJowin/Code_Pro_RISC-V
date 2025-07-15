module mem_stage(
    input [31:0] alu_result,
    input mem_to_reg_in,              // ? new input
    output [31:0] mem_out,
    output mem_to_reg_out             // ? new output
);

assign mem_out = alu_result;          // still passthrough
assign mem_to_reg_out = mem_to_reg_in; // ? forward control signal

endmodule

