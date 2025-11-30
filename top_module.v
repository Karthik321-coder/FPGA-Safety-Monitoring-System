`include "safety_params.vh"

module top_module (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [15:0] spi_accel,
    input  wire [15:0] spi_brake,
    output wire [2:0]  led_status
);
    wire [15:0] c_accel, c_brake;
    wire [15:0] f_accel, f_brake;
    wire fault, valid, anomaly;
    wire [5:0] votes;

    sensor_interface u_sens (
        .clk(clk), .rst_n(rst_n), 
        .raw_accel(spi_accel), .raw_brake(spi_brake), 
        .clean_accel(c_accel), .clean_brake(c_brake), 
        .fault_detected(fault)
    );

    feature_extractor u_feat (
        .clk(clk), 
        .in_accel(c_accel), .in_brake(c_brake), 
        .feat_accel_mag(f_accel), .feat_brake_rate(f_brake), 
        .data_valid(valid)
    );

    ml_inference u_ml (
        .clk(clk), .data_valid(valid), 
        .feat_accel(f_accel), .feat_brake(f_brake), 
        .vote_count(votes), .anomaly_detected(anomaly)
    );

    safety_fsm u_fsm (
        .clk(clk), .rst_n(rst_n), 
        .ml_anomaly(anomaly), .sensor_fault(fault), 
        .state(led_status)
    );
endmodule
