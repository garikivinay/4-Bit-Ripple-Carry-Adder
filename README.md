# 4-Bit Ripple Carry Adder using Verilog HDL

## CodeTech VLSI Internship 
## intern id :-CITS6509

### Project Overview
This project implements a **4-bit Smart Ripple Carry Adder** using **Verilog HDL**. The design consists of four cascaded full adders to perform binary addition. An **Enable (EN)** signal is included to control the operation of the adder. When EN is low, the outputs remain disabled; when EN is high, the circuit performs normal addition.

A Verilog testbench is also included to verify the functionality under different input combinations.

---

## Features

- 4-bit Ripple Carry Adder
- Modular Full Adder implementation
- Enable (EN) control
- Carry-In (Cin) support
- Carry-Out (Cout) generation
- Overflow (OVR) output
- Verilog Testbench for functional verification

---

## Repository Contents

| File | Description |
|------|-------------|
| `smart_ripple_adder.v` | Verilog source code for the Smart 4-bit Ripple Carry Adder |
| `tb_smart_ripple_adder.v` | Testbench used to verify the design functionality |

---

## Inputs

- **A[3:0]** – First 4-bit input
- **B[3:0]** – Second 4-bit input
- **Cin** – Carry input
- **EN** – Enable signal

## Outputs

- **Sum[3:0]** – 4-bit sum output
- **Cout** – Carry output
- **OVR** – Overflow output

---

## Working Principle

1. The Enable (EN) signal controls whether the adder is active.
2. When EN = 1, the inputs are processed through four cascaded full adders.
3. Each full adder passes its carry output to the next stage.
4. The final stage generates the Carry-Out (Cout) and Overflow (OVR).
5. When EN = 0, the outputs remain disabled.

---

## Simulation

The testbench verifies different test cases including:

- Enable disabled condition
- Normal binary addition
- Addition with Carry-In
- Carry generation
- Zero input condition

---

## Tools Used

- Verilog HDL
- ModelSim / Vivado Simulator / Icarus Verilog (any Verilog simulator)

---
