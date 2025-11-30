`include "safety_params.vh"

module ml_inference (
    input  wire                  clk,
    input  wire                  data_valid,
    input  wire [`DATA_WIDTH-1:0] feat_accel,
    input  wire [`DATA_WIDTH-1:0] feat_brake,
    output reg  [5:0]            vote_count, // Up to 50 votes
    output reg                   anomaly_detected
);
    // RANDOM FOREST VOTING LOGIC (50 Trees Simulated)
    always @(posedge clk) begin
        if(data_valid) begin
            // Simplified Logic: If inputs exceed thresholds, assume high vote count
            if (feat_accel > `THRESH_ACCEL || feat_brake > `THRESH_BRAKE) begin
                vote_count <= 45; // High confidence anomaly
                anomaly_detected <= 1;
            end else begin
                vote_count <= 2;  // Low confidence
                anomaly_detected <= 0;
            end
        end
    end
endmodule