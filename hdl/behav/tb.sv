`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 11/25/2021 09:11:24 PM
// Design Name:
// Module Name: tb
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

`define RST_ACTIVE_LEVEL 1

module tb();

    logic [8*256:1] msg;

    logic clk, rst;

    // Instantiate design under test
    top dut (
        .sys_clock_0(clk),
        .reset_0(rst)
    );

    initial begin
        clk = 0;
        #5
        forever #5 clk = ~clk;
    end

    initial begin
        // Dump waves
        $timeformat (-9, 3, " ns", 1);
        $dumpfile("dump.vcd");
        $dumpvars();

        // Initialize
        init_signals();
        reset_system(`RST_ACTIVE_LEVEL); // Assert our reset

        repeat (100) @(posedge clk);
        $finish;
    end

    task INFO;
        input [256*8:1] msg;
    begin
        $display("%m at time %t: %0s", $time, msg);
    end
    endtask

    task reset_system;
        input active_level;
        begin
            rst = active_level;
            repeat (2) @(posedge clk);
            rst = ~active_level;
            $sformat(msg, "Released device reset");
            INFO(msg);
            repeat (1) @(posedge clk);
        end
    endtask

    task init_signals;
        begin
        end
    endtask

endmodule

