module wb_stage(
    input [31:0] alu_result,
    input [31:0] mem_out,
    input mem_to_reg,
    output [31:0] write_data
);

assign write_data = mem_to_reg ? mem_out : alu_result;

endmodule
