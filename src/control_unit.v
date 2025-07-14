module control_unit(
    input [6:0] opcode,
    output reg alu_src,
    output reg mem_to_reg,
    output reg reg_write,
    output reg [3:0] alu_op
);

always @(*) begin
    alu_src = 0;
    mem_to_reg = 0;
    reg_write = 0;
    alu_op = 4'b0000;

    case (opcode)
        7'b0110011: begin // R-type
            alu_src = 0;
            reg_write = 1;
            alu_op = 4'b0000; // Default to ADD
        end
        7'b0010011: begin // I-type (ADDI)
            alu_src = 1;
            reg_write = 1;
            alu_op = 4'b0000; // ADD
        end
        default: begin
            // Defaults are fine
        end
    endcase
end

endmodule
