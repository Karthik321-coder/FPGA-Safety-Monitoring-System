PROJECT: FPGA-Based Transport Safety Monitoring System
-----------------------------------------------------

PLATFORM: Artix-7 FPGA (XC7A35T)
LANGUAGE: Verilog HDL / Python

CONTENTS:
1. /RTL - Verilog source files (.v) implementing the 7-stage pipeline.
2. /TB  - SystemVerilog testbench (.sv) verifying 7 safety scenarios.
3. /Py  - Machine Learning training script and Real-time Dashboard.

INSTRUCTIONS:
- SIMULATION: Load 'system_tb.sv' and all .v files into Vivado. Run Behavioral Sim.
- DEMO: Run 'python dashboard_demo.py' to see the fault injection visualization.

PERFORMANCE:
- Latency: 42ms
- Accuracy: 93.2%
- Logic Utilization: ~65% LUTs
