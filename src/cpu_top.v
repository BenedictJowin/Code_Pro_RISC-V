module cpu_top(
    input clk,
    input reset
);

wire [31:0] pc, instruction;
wire [4:0] rs1, rs2, rd;
wire [6:0] opcode;
wire [31:0] reg1, reg2, imm;
wire [3:0] alu_op;
wire alu_src, mem_to_reg, reg_write;
wire [31:0] alu_result, mem_out, write_data;

if_stage IF (
    .clk(clk),
    .reset(reset),
    .pc_in(pc),
    .pc_out(pc),
    .instruction(instruction)
);

id_stage ID (
    .instruction(instruction),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .opcode(opcode)
);

control_unit CU (
    .opcode(opcode),
    .alu_src(alu_src),
    .mem_to_reg(mem_to_reg),
    .reg_write(reg_write),
    .alu_op(alu_op)
);

register_file RF (
    .clk(clk),
    .we(reg_write),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .wd(write_data),
    .rd1(reg1),
    .rd2(reg2)
);

// For now, setting immediate value to zero. If the instruction set includes immediate values, this should be modified accordingly.
assign imm = 32'b0;

ex_stage EX (
    .reg_data1(reg1),
    .reg_data2(reg2),
    .imm(imm),
    .alu_src(alu_src),
    .alu_op(alu_op),
    .alu_result(alu_result)
);

mem_stage MEM (
    .alu_result(alu_result),
    .mem_out(mem_out)
);

wb_stage WB (
    .alu_result(alu_result),
    .mem_out(mem_out),
    .mem_to_reg(mem_to_reg),
    .write_data(write_data)
);

endmodule
