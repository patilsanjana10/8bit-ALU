# 8-bit ALU in Verilog
This project implements an 8-bit Arithmetic Logic Unit (ALU) using Verilog HDL.  
The ALU performs basic arithmetic and logical operations including:
- Addition
- Subtraction
- AND, OR, XOR
- Logical shifts

## Tools Used
- Verilog
- Xilinx / ModelSim

## Simulation
Screenshots of simulation results are included below:

![ALU Diagram](alu_diagram.png)

## ALU Schematic

![8-bit ALU Schematic](alu_schematic.png)  
*Figure 1: Synthesized schematic of the 8-bit ALU.*

### Inputs
- **a[7:0]** → First 8-bit operand (input A).  
- **b[7:0]** → Second 8-bit operand (input B).  
- **op[2:0]** → 3-bit control signal that selects the ALU operation (e.g., ADD, SUB, AND, OR, etc.).

### Operations
Each green block in the schematic is a hardware operator generated from the Verilog code:
- **RTL_ADD** → Adds `a` and `b` (produces 9-bit output: 8-bit result + carry-out).  
- **RTL_SUB** → Subtracts `b` from `a`.  
- **RTL_AND** → Bitwise AND of `a` and `b`.  
- **RTL_OR** → Bitwise OR of `a` and `b`.  
- **RTL_XOR** → Bitwise XOR of `a` and `b`.  
- **RTL_INV** → Bitwise NOT (inversion) of `a`.  
- **RTL_LSHIFT** → Logical left shift of `a`.  
- **RTL_RSHIFT** → Logical right shift of `a`.  

### Multiplexers (MUX)
- **RTL_MUX (top)** → Selects the carry output from the ADD operation only (other operations don’t produce a carry).  
- **RTL_MUX (right)** → Selects which operation’s result becomes the final `result[7:0]` based on `op[2:0]`.  

### Outputs
- **result[7:0]** → Final 8-bit ALU output.  
- **carry** → Carry-out bit from the addition operation.  
