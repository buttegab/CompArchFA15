// Credit to Joey Maalouf for aollaborating and the indexing idea to save space and keep me from typing out 64 iterations of binary combinations.
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR not #50


module behavioralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;
wire[3:0] inputs = {in3, in2, in1, in0};
wire[1:0] address = {address1, address0};
assign out = inputs[address];
endmodule

module structuralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;
wire nA0, nA1;
wire q0xorq1, q2xorq3;
wire A0andA1, nA0andA1, nA0andnA1, A0andnA1;
wire q0xorq1andq0xnorq1, q2xorq3andq2xnorq3;
wire nA0andnA1andin0, nA0andA1andin1, A0andnA1andin2, A0andA1andin3;
`NOT notgate0(nA0, address0);
`NOT notgate1(nA1, address1);
`AND andgate0(nA0andnA1, nA0, nA1);
`AND andgate1(A0andA1, address0, address1);
`AND andgate2(nA0andA1, nA0, address1);
`AND andgate3(A0andnA1, address0, nA1);
`AND andgate4(nA0andnA1andin0, nA0andnA1, in0);
`AND andgate5(A0andnA1andin1, A0andnA1, in1);
`AND andgate6(A0andA1andin3, A0andA1, in3);
`AND andgate7(nA0andA1andin2, nA0andA1, in2);
`XOR xorgate0(q0xorq1, nA0andA1andin2, nA0andnA1andin0);
`XOR xorgate1(q2xorq3, A0andnA1andin1, A0andA1andin3);
`XOR xorgate2(out, q0xorq1, q2xorq3);
endmodule


module testMultiplexer;
  reg address0, address1;
  reg in0, in1, in2, in3;
  wire out;
  integer i;
  behavioralMultiplexer multiplexer (out, address1, address0, in0, in1, in2, in3);
//structuralMultiplexer multiplexer (out, address1, address0, in0, in1, in2, in3);
  initial begin
$display("a1 a0 | in0 in1 in2 in3 | out | Expected Output");

    for (i = 0; i < 64; i = i + 1) begin
      address1 = i[5];
      address0 = i[4];
      in0 = i[3];
      in1 = i[2];
      in2 = i[1];
      in3 = i[0];
      #1000
      $display(" %b  %b |  %b  %b  %b  %b  |    %b", address1, address0, in0, in1, in2, in3, out, 2 * address1 + 1 * address0);
    end
  end
endmodule
