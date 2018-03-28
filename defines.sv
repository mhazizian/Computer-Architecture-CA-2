// OPCODEs

`define REGISTER_TYPE_OPCODE 2'b00
`define IMMEDIATE_TYPE_OPCODE 2'b01
`define SHIFT_TYPE_OPCODE 3'b110
`define	MEMORY_TYPE_OPCODE 3'b100
`define CONDITIONAL_JUMP_TYPE_OPCODE 3'b101
`define OTHER_TYPE_OPCODE 6'b111100

// Non-conditional functions

`define JMP_OPCODE 5'b11100
`define JSB_OPCODE 5'b11101

// Register type functions

`define ADD_FN 3'b000
`define ADDC_FN 3'b001
`define SUB_FN 3'b010
`define SUBC_FN 3'b011
`define AND_FN 3'b100
`define OR_FN 3'b101
`define XOR_FN 3'b110
`define MASK_FN 3'b111

// Shift type functions

`define SHL_FN 2'b00
`define SHR_FN 2'b01
`define ROL_FN 2'b10
`define ROR_FN 2'b11

// Memory type functions

`define LDM_FN 2'b00
`define STM_FN 2'b01

// Conditional type functions

`define BZ_FN 2'b00
`define BNZ_FN 2'b01
`define BC_FN 2'b10
`define BNC_FN 2'b11

// Registers

`define R0 3'b000
`define R1 3'b001
`define R2 3'b010
`define R3 3'b011
`define R4 3'b100
`define R5 3'b101
`define R6 3'b110
`define R7 3'b111

