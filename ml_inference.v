`include "safety_params.vh"

module safety_fsm (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       ml_anomaly,
    input  wire       sensor_fault,
    output reg  [2:0] state
);
    reg [3:0] hyst;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            state <= `STATE_IDLE; hyst <= 0;
        end else begin
            // PRIORITY 1: FAILSAFE
            if(sensor_fault) state <= `STATE_FAILSAFE;
            else case(state)
                `STATE_IDLE: if(ml_anomaly) state <= `STATE_WARNING;
                `STATE_WARNING: begin
                    if(ml_anomaly) state <= `STATE_CRITICAL;
                    else begin
                        hyst <= hyst + 1;
                        if(hyst > 10) begin state <= `STATE_IDLE; hyst <= 0; end
                    end
                end
                `STATE_CRITICAL: if(ml_anomaly) state <= `STATE_EMERGENCY; else state <= `STATE_WARNING;
                `STATE_EMERGENCY: state <= `STATE_EMERGENCY; // Latch
                `STATE_FAILSAFE: state <= `STATE_FAILSAFE;   // Latch
            endcase
        end
    end
endmodule
