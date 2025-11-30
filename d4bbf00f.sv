`timescale 1ns/1ps
`include "safety_params.vh"

module system_tb;
    reg clk, rst_n;
    reg [15:0] tb_accel, tb_brake;
    wire [2:0] tb_led;

    top_module dut (.clk(clk), .rst_n(rst_n), .spi_accel(tb_accel), .spi_brake(tb_brake), .led_status(tb_led));

    always #5 clk = ~clk;

    initial begin
        $dumpfile("waveform.vcd"); $dumpvars(0, system_tb);
        clk=0; rst_n=0; tb_accel=0; tb_brake=0;
        #100 rst_n=1;

        // TEST 1: NORMAL DRIVING
        $display("T1: Normal Driving...");
        tb_accel = 16'h0050; #200;
        if(tb_led == `STATE_IDLE) $display("PASS"); else $display("FAIL");

        // TEST 2: AGGRESSIVE (Threshold Breach)
        $display("T2: Aggressive...");
        tb_accel = 16'h0200; #200; // > 0x01D9
        if(tb_led != `STATE_IDLE) $display("PASS"); else $display("FAIL");

        // RECOVERY
        tb_accel = 16'h0050; #200;

        // TEST 3: SENSOR FAULT (Stuck at Dead)
        $display("T3: Stuck Sensor...");
        repeat(300) begin tb_accel = 16'hDEAD; #10; end
        if(tb_led == `STATE_FAILSAFE) $display("PASS"); else $display("FAIL");

        $finish;
    end
endmodule