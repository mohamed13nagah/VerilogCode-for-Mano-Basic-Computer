# Verilog Code for Mano Basic Computer
## What is the Mano Basic Computer?
The Mano Basic Computer is a computer theoretically described by M. Morris Mano. It contains a central processing unit, random access memory, and an input-output bus.

![Mano Basic Computer Architecture1](https://github.com/mohamed13nagah/VerilogCode-for-Mano-Basic-Computer/assets/168983051/33c1096a-a524-4683-9009-14a28adaa8fb)



## Instruction Cycle
A program residing in the memory unit of the computer consists of a sequence of instructions. The program is executed in the computer by going through a cycle for each instruction. Each instruction cycle in turn is subdivided into a sequence of subcycles or phases. In the basic computer each instruction cycle consists of the following phases:

  1. Fetch an instruction from memory.
  2. Decode the instruction.
  3. Read the effective address from memory if the instruction has an indirect address.
  4. Execute the instruction.

Upon the completion of step 4, the control goes back to step 1 to fetch, decode, and execute the next instruction. This process continues indefinitely unless a HALT instruction is encountered.

![phpBZEt1n](https://github.com/mohamed13nagah/VerilogCode-for-Mano-Basic-Computer/assets/168983051/855ba6f3-9995-4633-a5dd-e0a90f1f7062)



## Instruction Set
The type of instruction is recognized by the computer control from the four bits in positions 12 through 15 of the instruction. If the three opcode bits in positions 12 through 14 are not equal to 111, the instruction is a memory-reference type and the bit in position 15 is taken as the addressing mode I. If the 3-bit opcode is equal to 111, control then inspects the bit in position 15. If this bit is 0, the instruction is a register-reference type. If the bit is 1, the instruction is an input-output type.

![Screenshot (206)](https://github.com/mohamed13nagah/VerilogCode-for-Mano-Basic-Computer/assets/168983051/ca0cb3cf-62ee-4571-86ae-0a66a6a7550a)

![php8r0tHw](https://github.com/mohamed13nagah/VerilogCode-for-Mano-Basic-Computer/assets/168983051/917549ca-6b6f-4f2c-95ae-e9e8719de89e)

