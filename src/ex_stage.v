module ex_stage(
    input [31:0] reg_data1,
    input [31:0] reg_data2,
    input [31:0] imm,
    input alu_src,
    input [3:0] alu_op,
    output [31:0] alu_result
);

wire [31:0] operand_b;
assign operand_b = alu_src ? imm : reg_data2;

alu alu_instance (
    .a(reg_data1),
    .b(operand_b),
    .alu_op(alu_op),
    .result(alu_result)
);

endmodule
