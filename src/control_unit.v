module control_unit(
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    output reg alu_src,
    output reg mem_to_reg,
    output reg reg_write,
    output reg [3:0] alu_op
);

always @(*) begin
    alu_src     = 0;
    mem_to_reg  = 0;
    reg_write   = 0;
    alu_op      = 4'b0000;

    case (opcode)
        7'b0110011: begin // R-type
            alu_src    = 0;
            reg_write  = 1;

            case ({funct7, funct3})
                10'b0000000000: alu_op = 4'b0000; // ADD
                10'b0100000000: alu_op = 4'b0001; // SUB
                10'b0000000111: alu_op = 4'b0010; // AND
                10'b0000000110: alu_op = 4'b0011; // OR
                10'b0000000100: alu_op = 4'b0100; // XOR
                default:         alu_op = 4'b1111; // INVALID
            endcase
        end

        7'b0010011: begin // I-type (e.g., ADDI — if supported)
            alu_src    = 1;
            reg_write  = 1;
            alu_op     = 4'b0000; // ADD
        end

        default: begin
            // Leave defaults
        end
    endcase
end

endmodule
