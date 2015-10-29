// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register32zero
(
output reg[31:0]	q,
input[31:0]		d,
input		wrenable,
input		clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            d[31:0] = 0;
        end
    end

endmodule