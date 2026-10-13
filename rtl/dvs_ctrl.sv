// dvs_ctrl -- 4-bit DVS controller for the OneTOPS capacitorless LDO
//
// * code_out drives the rdac4 R-string DAC: VOUT ~= 1.00 V + 30 mV * code_out
// * Slew-limited: code_out moves one LSB every STEP_DIV clocks toward the effective
//   target, so VREF never jumps more than 30 mV at once (avoids loop slewing/overshoot)
// * Workload hint: while hint is high, the target is raised by HINT_BOOST LSBs
//   (saturating at 15) so VOUT is pre-raised before a heavy AI burst, and boost_en is
//   asserted for the analog transient-boost / adaptive-bias path
// * settled = code_out has reached the effective target
module dvs_ctrl #(
    parameter int STEP_DIV   = 8,   // clocks per LSB step (>= 1)
    parameter int HINT_BOOST = 3    // LSBs added while hint is high
) (
    input  logic       clk,
    input  logic       rst_n,
    input  logic [3:0] code_req,   // requested DVS code (e.g. from ui_in)
    input  logic       hint,       // workload hint: AI burst imminent
    output logic [3:0] code_out,   // to rdac4 d[3:0]
    output logic       boost_en,   // to analog boost / adaptive bias
    output logic       settled
);
    localparam int CW = (STEP_DIV > 1) ? $clog2(STEP_DIV) : 1;

    logic [4:0]    tgt_sum;
    logic [3:0]    target;
    logic [CW-1:0] div_cnt;

    assign tgt_sum  = {1'b0, code_req} + (hint ? 5'(HINT_BOOST) : 5'd0);
    assign target   = tgt_sum[4] ? 4'hF : tgt_sum[3:0];
    assign settled  = (code_out == target);
    assign boost_en = hint;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            code_out <= 4'd0;
            div_cnt  <= '0;
        end else if (settled) begin
            div_cnt <= '0;
        end else if (div_cnt == CW'(STEP_DIV - 1)) begin
            div_cnt  <= '0;
            code_out <= (code_out < target) ? code_out + 4'd1 : code_out - 4'd1;
        end else begin
            div_cnt <= div_cnt + 1'b1;
        end
    end
endmodule
