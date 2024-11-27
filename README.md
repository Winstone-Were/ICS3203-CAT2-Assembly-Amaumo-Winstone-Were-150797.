![License](https://img.shields.io/badge/License-MIT-green.svg)
![Assembly](https://img.shields.io/badge/Assembly-Language-blue.svg)



# Assembly Programming Tasks

This repository contains four assembly programs that demonstrate various fundamental concepts in assembly language programming. Below is an overview of each program, its purpose, and instructions for compiling and running the code.

---
## General Notes:
- These programs are written for 32-bit architecture and assume a Linux environment.
- Ensure you have `nasm` and `ld` installed before compiling.
- Follow the specific instructions above for each program to compile and execute successfully.

---

## 1. Control Flow and Conditional Logic

### Purpose:
This program prompts the user to input a number and classifies it as:
- "POSITIVE"
- "NEGATIVE"
- "ZERO"

### How It Works:
- The program uses conditional and unconditional jump instructions to determine the category of the number.
- User input is compared to zero:
  - If the number is greater than zero, a jump directs to the "POSITIVE" label.
  - If the number is less than zero, a jump directs to the "NEGATIVE" label.
  - Otherwise, the program labels it as "ZERO."

### Compilation and Running:
```bash
nasm -f elf32 01_control_flow_conditional_logic.asm -o control_flow.o
ld -m elf_i386 control_flow.o -o control_flow
./control_flow
```

## 2. Array Manipulation with Looping and Reversal

### Purpose:
This program accepts an array of integers as input, reverses the array in place, and outputs the reversed array.

### How It Works:
- The program uses a loop to swap elements at symmetric positions in the array.
- It avoids additional memory allocation by directly modifying the array in place.
- Comments in the code explain memory handling and loop logic, ensuring clarity.

### Compilation and Running:
```bash
nasm -f elf32 02_array_manipulation.asm -o array_manipulation.o
ld -m elf_i386 array_manipulation.o -o array_manipulation
./array_manipulation
```

## 3. Modular Program with Subroutines for Factorial Calculation

### Purpose:
This program calculates the factorial of a number using a subroutine.

### How It Works:
- The program uses a modular design:
  - A separate subroutine computes the factorial using a loop.
  - Registers are preserved and restored using the stack to ensure the program's state is not corrupted.
- The final result is stored in a general-purpose register for output.

### Compilation and Running:
```bash
nasm -f elf32 03_factorial.asm -o factorial.o
ld -m elf_i386 factorial.o -o factorial
./factorial
```

## 4. Data Monitoring and Control Using Port-Based Simulation

### Purpose:
This program simulates a control system for a "sensor" (e.g., a water level sensor) and performs actions like turning on a motor, triggering an alarm, or stopping the motor.

### How It Works:
- The program reads the "sensor value" from a specified memory location.
- Based on the input:
  - If the water level is high, an alarm is triggered.
  - If the water level is moderate, the motor stops.
  - If the water level is low, the motor starts.
- Specific bits in memory locations are set or cleared to simulate motor and alarm actions.

### Compilation and Running:
```bash
nasm -f elf32 04_memory_locations_control_logic.asm -o control_logic.o
ld -m elf_i386 control_logic.o -o control_logic
./control_logic
```

## Insights and Challenges Encountered

### 1. Control Flow and Conditional Logic
#### Insights:
- Using both conditional and unconditional jumps allowed the program to handle different conditions effectively. The use of `je` (jump if equal) and `jne` (jump if not equal) was straightforward for branching based on the comparison to zero.
- I was able to understand how jumps work at a low level and how they impact the program flow.

#### Challenges:
- The challenge was ensuring that the logic was correct for all cases, especially when dealing with negative numbers. Correctly handling all branches required careful testing of edge cases (e.g., zero and negative numbers).
- Debugging the jumps in assembly was tricky initially, as incorrect jumps led to unexpected results.

---

### 2. Array Manipulation with Looping and Reversal
#### Insights:
- Reversing an array in place without using extra memory required careful use of indexing and looping. The swapping logic was key to ensuring the array was reversed without creating a new array.
- The loop helped me better understand how memory is accessed and modified in assembly.

#### Challenges:
- One of the challenges was handling memory directly and ensuring no data was lost or overwritten during the reversal process.
- Debugging array manipulations was also difficult because of potential pointer errors when accessing array elements.

---

### 3. Modular Program with Subroutines for Factorial Calculation
#### Insights:
- This task deepened my understanding of modular programming and how subroutines can be used to break down complex tasks.
- The use of the stack to preserve registers and maintain program state helped me grasp low-level memory management.

#### Challenges:
- A major challenge was understanding how to properly use the stack for saving and restoring registers. Keeping track of the values pushed to the stack and popped back was critical for ensuring the program worked correctly.
- The factorial calculation itself was straightforward, but managing the subroutine and stack operations required attention to detail.

---

### 4. Data Monitoring and Control Using Port-Based Simulation
#### Insights:
- This task provided a hands-on understanding of how hardware control systems might work, including reading sensor values and triggering actions like motor control.
- I gained valuable experience in manipulating specific bits in memory locations to simulate actions like turning on/off a motor or triggering an alarm.

#### Challenges:
- A challenge was simulating the control system in a way that reflected real-world sensor data and actions. Understanding how to read and write to specific memory locations was tricky at first.
- Debugging the motor and alarm control logic required ensuring that bits were correctly set or cleared based on the sensor value.

---

### General Insights:
- Throughout these tasks, I gained a deeper appreciation for low-level programming and the direct control assembly language offers over system resources.
- The biggest challenge across all tasks was understanding how memory works at such a granular level and correctly using jumps, loops, and the stack.

