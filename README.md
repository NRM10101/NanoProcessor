# NanoProcessor

## Introduction

In this lab We will design a very simple microprocessor (hence, called a nanoprocessor) capable of
executing a simple set of instructions. Block diagram of the nanoprocessor is given in Fig. 1. Set
of instructions supported by the nanoprocessor is given in Table 1. To build this circuit we need
to develop/extend several components/modules:

### 4-bit Add/Subtract Unit

- Capable of adding and subtracting numbers represented using 2’s complement.
- Modified from a 4-bit ripple carry adder unit.

### 3-bit Adder

- Used for incrementing the Program Counter.
- Modified from a 4-bit ripple carry adder unit.

### 3-bit Program Counter (PC)

- Resets to 0 when required.
- Built using D flip-flops with a clear input (FDC component).

### k-way b-bit Multiplexers

- A multiplexer that can take in k inputs, each with b bits, and outputs a group of b bits based on log2 k control bits.
- Implemented versions:
  - 2-way 3-bit multiplexer
  - 2-way 4-bit multiplexer
  - 8-way 4-bit multiplexer
- Utilizes an 8-to-1 multiplexer developed previously.


![image](https://github.com/NRM10101/NanoProcessor/assets/126091408/4d51bf04-c286-4725-af9e-b1836e60bee9)

### Register Bank

- Contains 7, 4-bit registers (R0 to R7).
- R0 is hardcoded to all 0s.
- Implemented using D flip-flops with a clear input, connected to a reset button.
- Utilizes a 3-to-8 decoder for addressing.

### Program ROM

- Stores the Assembly program.
- Built using 12 ROM16×1s.
- Modified LUTs from Lab 5 are used for implementation.

### Buses

- 3-bit, 4-bit, and 12-bit buses used for connecting components.
- Simplifies design by reducing the number of wires.
- Utilizes labels such as D(3:0), I(11:0), M(3:0), and R(3:0).

### Instruction Decoder

- Decodes instructions to activate necessary components.
- Ensures proper execution of instructions like MOVI, ADD, NEG, etc.
- Uses internal logic to activate specific modules based on the instruction set.
- Implements optimizations like hardwiring R0 as a read-only register for the NEG instruction.

![image](https://github.com/NRM10101/NanoProcessor/assets/126091408/0b1050e9-8207-45eb-8ebf-1404b6dd9e88)

We wish to execute an Assembly program similar to the following in our nanoprocessor:

```assembly
MOVI R1, 10  ; R1 <- 10
MOVI R2, 1   ; R2 <- 1
NEG R2       ; R2 <- -R2
ADD R1, R2   ; R1 <- R1 + R2
JZR R1, 7    ; If R1 = 0 jump to line 7
JZR R0, 3    ; If R0 = 0 jump to line 3
```

As the microprocessor only understands machine language, we need to provide those
instructions as a binary value. We will hard code our program to ROM as we have only 8
switches on the BASYS 2 board (where as each instruction is specified using 12-bits).
Pushbutton (BTN0) is used as the clock input and BTN3 is used to reset the PC and Register
Bank (this enables us to restart the program at any time).

## Steps to Build and Test the Nanoprocessor

### Step 1: Design the Instruction Decoder

Design the internal structure of the Instruction Decoder. Clearly identify the role of each output pin and how to activate them when necessary.

### Step 2: Build Necessary Sub-components

Build and test each sub-component using simulation tools.

### Step 3: Build the Top-Level Design

Construct the top-level design, resembling a structure similar to Fig. 2 in your lab manual.

### Step 4: Write and Hardcode the Assembly Program

Write an Assembly program to calculate the total of all integers up to 3. Ensure the final answer is stored in Register R7. Convert and hardcode the Assembly program into the ROM.

### Step 5: Connect Inputs and Outputs

Connect inputs and outputs:
- Output of R7 connected to LEDs (LD0 – LD3 outputs).
- Use LD7 for carry output.

### Step 6: Test on BASYS2 and Verify Functionality

Test the nanoprocessor on the BASYS2 FPGA board. Verify the functionality and ensure the program calculates the total correctly.

### Step 7: Lab Report

Prepare and submit a comprehensive lab report including:
- Student names and index numbers.
- Brief statement of the lab task.
- Schematic circuits for all components.
- Timing diagrams illustrating critical paths and signals.
- Assembly program listing and its corresponding machine code representation.
- Conclusions drawn from the lab experiment.
- Attach the Lab Completion Log signed by the instructor.

## Example Assembly Program

```assembly
MOVI R1, 3   ; Initialize R1 with 3
MOVI R2, 0   ; Initialize R2 with 0 (accumulator)
ADDLOOP:
    ADD R2, R1    ; Accumulate R1 into R2
    SUBI R1, 1    ; Decrement R1
    JZR R1, ADDLOOP ; Jump back if R1 != 0
MOVI R7, 0   ; Move result to R7
```

## Usage

Each component has its Verilog HDL implementation and can be simulated or synthesized using appropriate tools.

## Conclusion

This lab exercise provided hands-on experience in designing and implementing a nanoprocessor using FPGA technology. By following structured steps, we successfully implemented and tested the processor's functionality according to the specified requirements


