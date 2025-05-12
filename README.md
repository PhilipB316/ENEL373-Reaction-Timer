# ENEL373 Reaction Time Project

Ever wondered how fast you are? How long it takes you to react to Dr. Moore saying, "Well, that's it for today, folks?". Well, now you can find out! This project is a simple reaction time tester implemented on a Nexys-4 DDR FPGA development kit.

##

### Prerequisites

- Access to a Vivado toolchain
- Access to a Nexys-4 DDR FPGA development kit.

## Importing Project

- In any directory, open a terminal and type `git clone https://eng-git.canterbury.ac.nz/enel373-2025/ThuGroup13`.
- A new directory called ThuGroup13 will appear.

### Running Project

- Open Vivado, and open the `reaction_timer.xpr` project file found in the `ThuGroup13/reaction_timer` directory.
- Run the generate bitstream tool.
- Once the bitstream is generated, open the hardware manager and connect to the FPGA.
- Once connected, open the program device tool and select the generated bitstream.

## Operating Instructions

### Reaction timing

1. Three LCD dots on the seven segment display will disappear sequentially with a random delay between each dot.
2. Once the last dot has disappeared, the timer will start counting. The user must press the center button on the FPGA board to stop the timer.
3. The delay in milliseconds between the last dot disappearing and the user pressing the button will be displayed on the seven segment display.
4. The user can press the center button again to reset the timer and start a new test.
5. If the user presses the center button before the last dot has disappeared, an error message will be displayed and the user must start the test again by pressing the center button.

### Reaction statistics

When there is no test running:
1. The user can press the right button on the FPGA board to view the average of the last 3 tests.
2. The user can press the top button on the FPGA board to view the maximum of the last 3 tests.
3. The user can press the bottom button on the FPGA board to view the minimum of the last 3 tests.
4. The user can press the left button to clear the stored reaction times.

## Additional Notes

### Expressions of Gratitude

- Thanks to Dr. Moore for his help and support with the requirements for this readme and the project in general.
- Thanks to Support Team [@ allaboutfpga.com](https://allaboutfpga.com/vhdl-code-for-binary-to-bcd-converter/) for the binary to bcd converter code.
- Thanks to Mum and Dad for hosting Michael and Philip during project development.
- Thanks to Miriam Brand for extended testing of the reaction timer during development.
- Thanks to the University of Canterbury for providing the Nexys A7 boards and Vivado toolchain.
- Thanks to tea and coffee for keeping the group somewhat sane.

### Authors

- Philip Brand (pbr73)
- Michael Brown (mbr206)
- Boston Black (bbl .......)
