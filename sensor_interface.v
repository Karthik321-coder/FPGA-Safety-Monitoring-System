`include "safety_params.vh"

module sensor_interface (
    input  wire                  clk,
    input  wire                  rst_n,
    input  wire [`DATA_WIDTH-1:0] raw_accel,
    input  wire [`DATA_WIDTH-1:0] raw_brake,
    output reg  [`DATA_WIDTH-1:0] clean_accel,
    output reg  [`DATA_WIDTH-1:0] clean_brake,
    output reg                   fault_detected
);
    // 4-Tap Moving Average & Stuck-at Detection
    reg [`DATA_WIDTH-1:0] buff [3:0];
    reg [`DATA_WIDTH-1:0] last_val;
    reg [7:0] stuck_cnt;
    integer i;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            clean_accel <= 0; clean_brake <= 0;
            fault_detected <= 0; stuck_cnt <= 0; last_val <= 0;
            for(i=0; i<4; i=i+1) buff[i] <= 0;
        end else begin
            // Filter
            buff[3] <= buff[2]; buff[2] <= buff[1]; buff[1] <= buff[0]; buff[0] <= raw_accel;
            clean_accel <= (buff[0] + buff[1] + buff[2] + buff[3]) >> 2;
            clean_brake <= raw_brake; // Pass-through for brake

            // Fault Check (Layer 1 Defense)
            if(raw_accel == last_val) begin
                if(stuck_cnt < `FAULT_TIMEOUT) stuck_cnt <= stuck_cnt + 1;
                else fault_detected <= 1;
            end else begin
                stuck_cnt <= 0; fault_detected <= 0;
            end
            last_val <= raw_accel;
        end
    end
endmodule
