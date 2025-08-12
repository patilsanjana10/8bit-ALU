`timescale 1ns / 1ps

module alu(
    input  [7:0] a,
    input  [7:0] b,
    input  [2:0] op,
    output reg [7:0] result,  // Must be reg
    output reg carry          // Must be reg
    );

    always @(*) begin
        carry = 0; // Default value
        case(op)
            3'b000: {carry, result} = a + b; // Addition
            3'b001: {carry, result} = a - b; // Subtraction
            3'b010: result = a & b;          // AND
            3'b011: result = a | b;          // OR
            3'b100: result = a ^ b;          // XOR
            3'b101: result = ~a;             // NOT A
            3'b110: result = a << 1;         // Shift left
            3'b111: result = a >> 1;         // Shift right
            default: result = 8'b0;
        endcase
    end
endmodule
