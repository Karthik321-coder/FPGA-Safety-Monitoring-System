`ifndef SAFETY_PARAMS_VH
`define SAFETY_PARAMS_VH

// SYSTEM CONSTANTS
`define CLK_FREQ_HZ     100_000_000
`define DATA_WIDTH      16       // Q8.8 Format
`define NUM_TREES       50       // Matches Report ML Config

// ML THRESHOLDS (Q8.8 Fixed Point)
// Accel: 1.85 G -> 0x01D9
// Brake: 42.3 Bar -> 0x2A4C
`define THRESH_ACCEL    16'h01D9
`define THRESH_BRAKE    16'h2A4C

// FSM STATE ENCODING
`define STATE_IDLE      3'b000
`define STATE_WARNING   3'b001
`define STATE_CRITICAL  3'b010
`define STATE_EMERGENCY 3'b011
`define STATE_FAILSAFE  3'b100

// FAULT TOLERANCE
`define FAULT_TIMEOUT   200      // Cycles for stuck-at detection

`endif
