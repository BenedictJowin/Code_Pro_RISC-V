module mem_stage(
    input [31:0] alu_result,
    output [31:0] mem_out
);

assign mem_out = alu_result;

endmodule
