`include "safety_params.vh"

module feature_extractor (
    input  wire                  clk,
    input  wire [`DATA_WIDTH-1:0] in_accel,
    input  wire [`DATA_WIDTH-1:0] in_brake,
    output reg  [`DATA_WIDTH-1:0] feat_accel_mag,
    output reg  [`DATA_WIDTH-1:0] feat_brake_rate,
    output reg                   data_valid
);
    // Simplified CORDIC Pipeline
    always @(posedge clk) begin
        // Direct pass-through for demo (Assumes pre-processed magnitude)
        feat_accel_mag <= in_accel; 
        feat_brake_rate <= in_brake;
        data_valid <= 1'b1;
    end
endmodule