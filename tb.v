`timescale 1ns / 1ps

module alu_tb;

    reg [7:0] a, b;
    reg [2:0] op;
    wire [7:0] result;
    wire carry;

    // Instantiate ALU
    alu uut (
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .carry(carry)
    );

    initial begin
        // Auto display whenever something changes
        $monitor("t=%0t | a=%h | b=%h | op=%b | result=%h | carry=%b",
                  $time, a, b, op, result, carry);

        // --- Normal ALU tests ---
        a=10;  b=5;   op=3'b000; #10; // ADD
        a=15;  b=3;   op=3'b001; #10; // SUB
        a=12;  b=7;   op=3'b010; #10; // AND
        a=12;  b=7;   op=3'b011; #10; // OR
        a=12;  b=7;   op=3'b100; #10; // XOR
        a=12;  b=0;   op=3'b101; #10; // NOT
        a=12;  b=0;   op=3'b110; #10; // Shift Left
        a=12;  b=0;   op=3'b111; #10; // Shift Right

        // --- Carry-related cases ---
        a=8'hFF; b=8'h01; op=3'b000; #10; // 255 + 1 => carry=1
        a=8'h80; b=8'h80; op=3'b000; #10; // 128 + 128 => carry=1 (signed overflow)
        a=8'hFE; b=8'h05; op=3'b000; #10; // 254 + 5 => carry=1, result=3

        // --- Borrow check in subtraction ---
        a=8'h00; b=8'h01; op=3'b001; #10; // 0 - 1 => borrow, carry=0
        a=8'h02; b=8'h05; op=3'b001; #10; // 2 - 5 => borrow, carry=0

        $stop;
    end
endmodule
