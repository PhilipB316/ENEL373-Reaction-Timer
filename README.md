# ENEL373 Reaction Time Project ⏱️

Welcome to the ENEL373 Reaction Time Project! This project is a VHDL implementation of a reaction time tester, complete with a user interface on a seven-segment display and buttons for interaction. It was written for the ENEL373 - Digital Electronics and Devices course at the University of Canterbury for the Nexys-4 DDR FPGA board.

---

## 🚀 Overview

This project implements a simple reaction time tester on a Nexys-4 DDR FPGA.  
Challenge yourself or your friends and see who has the quickest reflexes!

---

## 📦 Prerequisites

- Vivado toolchain
- Nexys-4 DDR FPGA development kit

---

## 📥 Getting Started

Clone the repository:
```bash
git clone https://eng-git.canterbury.ac.nz/enel373-2025/ThuGroup13
```
A new directory called `ThuGroup13` will appear.

---

## 🛠️ Running the Project

1. Open Vivado and load the `reaction_timer.xpr` project file in `ThuGroup13/reaction_timer`.
2. Generate the bitstream.
3. Open the hardware manager and connect to the FPGA.
4. Program the device with the generated bitstream.

---

## 🎮 Operating Instructions

### Reaction Timing

1. Three LCD dots on the seven segment display will disappear sequentially with a random delay.
2. When the last dot disappears, the timer starts. Press the center button to stop the timer.
3. Your reaction time (in ms) will be displayed.
4. Press the center button again to reset and start a new test.
5. Pressing the center button too early shows an error—restart by pressing it again.

### Reaction Statistics

When idle:
- ▶️ **Right button:** View average of last 3 tests.
- 🔼 **Top button:** View maximum of last 3 tests.
- 🔽 **Bottom button:** View minimum of last 3 tests.
- ◀️ **Left button:** Clear stored reaction times.

---

## 📁 Project Structure

```
ThuGroup13/
├── figures/                 # Images and diagrams for the report and documentation
├── reaction_timer/          
│   ├── reaction_timer.xpr
│   └── reaction_timer.srcs/
│       |── sources_1/
│       |   └── new/         # Main Vivado project files and sources
│       └── sim_1/
│           └── new/         # Simulation files
├── report/                  # Project report (LaTeX sources, PDF, references)
├── README.md                # This file
└── LICENSE                  # Project license
```

---

## 🙏 Acknowledgements

- Thanks to Dr. Moore for his guidance and support.
- Thanks to [allaboutfpga.com](https://allaboutfpga.com/vhdl-code-for-binary-to-bcd-converter/) for the binary to BCD converter code.
- Thanks to Mum and Dad for hosting Michael and Philip during development.
- Thanks to Miriam Brand for extended testing.
- Thanks to the University of Canterbury for providing the Nexys A7 boards and Vivado toolchain.

---

## 👥 Authors

- Philip Brand
- Michael Brown
- Boston Black

---

## 📄 License

See the [LICENSE](LICENSE) file for license information.

---
