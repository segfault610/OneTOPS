// Self-checking testbench for dvs_ctrl: slew limit, convergence, hint pre-boost, saturation
`timescale 1ns/1ps
module tb_dvs_ctrl;
    localparam int STEP_DIV = 8, HINT_BOOST = 3;
    logic clk = 0, rst_n = 0, hint = 0;
    logic [3:0] code_req = 0, code_out;
    logic boost_en, settled;
    int errors = 0, steps = 0;
    logic [3:0] prev;

    dvs_ctrl #(.STEP_DIV(STEP_DIV), .HINT_BOOST(HINT_BOOST)) dut (.*);
    always #5 clk = ~clk;   // 100 MHz

    // invariant: code changes by at most 1 LSB per clock, and never faster than STEP_DIV
    int since_step = 0;
    always @(posedge clk) if (rst_n) begin
        #1;
        if (code_out != prev) begin
            if ((code_out > prev ? code_out - prev : prev - code_out) != 1) begin
                $error("multi-LSB jump %0d -> %0d", prev, code_out); errors++;
            end
            if (since_step < STEP_DIV - 1 && steps > 0) begin
                $error("step too fast: %0d clocks", since_step + 1); errors++;
            end
            since_step = 0; steps++;
        end else since_step++;
        prev = code_out;
    end

    task automatic go(input logic [3:0] req, input logic h, input logic [3:0] expect_code);
        code_req = req; hint = h;
        repeat (16 * STEP_DIV + 4) @(posedge clk);
        #1;
        if (code_out !== expect_code || !settled) begin
            $error("req=%0d hint=%0b: code_out=%0d settled=%0b, expected %0d", req, h, code_out, settled, expect_code);
            errors++;
        end else $display("ok  req=%0d hint=%0b -> code_out=%0d boost_en=%0b", req, h, code_out, boost_en);
    endtask

    initial begin
        prev = 0;
        repeat (3) @(posedge clk); rst_n = 1;
        go(7, 0, 7);     // power-up ramp to 1.21 V
        go(7, 1, 10);    // workload hint: pre-boost +3 LSB (1.30 V)
        go(4, 0, 4);     // DVS down to 1.12 V, ramps down 1 LSB at a time
        go(14, 1, 15);   // hint saturates at code 15
        go(0, 0, 0);     // full-scale ramp down
        if (boost_en !== 0) begin $error("boost_en stuck"); errors++; end
        if (errors == 0) $display("PASS: dvs_ctrl (%0d single-LSB steps checked)", steps);
        else             $display("FAIL: %0d errors", errors);
        $finish;
    end
endmodule
