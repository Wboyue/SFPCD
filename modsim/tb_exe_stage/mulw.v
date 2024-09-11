module mulw(
  input  [63:0] mul_src1,
  input  [63:0] mul_src2,
  output [63:0] mul_result
);



wire [63:0] mul_r;

wire [63:0] mul_a;
wire [63:0] mul_b;



assign mul_a   = mul_src1[31:0];
assign mul_b   = mul_src2[31:0];

assign mul_r = mul_a * mul_b;

assign mul_result = {{32{mul_r[31]}},mul_r[31:0]};

endmodule
