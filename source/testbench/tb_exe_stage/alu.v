module alu(
  input  [11:0] alu_op,
  input  [63:0] alu_src1,
  input  [63:0] alu_src2,
  output [63:0] alu_result
);

wire op_add;   //加法操作
wire op_sub;   //减法操作
wire op_slt;   //有符号比较，小于置位
wire op_sltu;  //无符号比较，小于置位
wire op_and;   //按位与
wire op_nor;   //按位或非
wire op_or;    //按位或
wire op_xor;   //按位异或
wire op_sll;   //逻辑左移
wire op_srl;   //逻辑右移
wire op_sra;   //算术右移
wire op_lui;   //立即数置于高半部分

// control code decomposition
assign op_add  = alu_op[ 0];
assign op_sub  = alu_op[ 1];
assign op_slt  = alu_op[ 2];
assign op_sltu = alu_op[ 3];
assign op_and  = alu_op[ 4];
assign op_nor  = alu_op[ 5];
assign op_or   = alu_op[ 6];
assign op_xor  = alu_op[ 7];
assign op_sll  = alu_op[ 8];
assign op_srl  = alu_op[ 9];
assign op_sra  = alu_op[10];
assign op_lui  = alu_op[11];

wire [63:0] add_sub_result; 
wire [63:0] slt_result; 
wire [63:0] sltu_result;
wire [63:0] and_result;
wire [63:0] nor_result;
wire [63:0] or_result;
wire [63:0] xor_result;
wire [63:0] lui_result;
wire [63:0] sll_result; 
wire [63:0] sr64_result; 
wire [63:0] sr_result; 


wire [63:0] adder_a;
wire [63:0] adder_b;
wire        adder_cin;
wire [63:0] adder_result;
wire        adder_cout;

assign adder_a   = alu_src1;
assign adder_b   = (op_sub | op_slt | op_sltu) ? ~alu_src2 : alu_src2;
assign adder_cin = (op_sub | op_slt | op_sltu) ? 1'b1      : 1'b0;
assign {adder_cout, adder_result} = adder_a + adder_b + adder_cin;

// ADD, SUB result
assign add_sub_result = adder_result;

// SLT result
assign slt_result[63:1] = 63'b0;
assign slt_result[0]    = (alu_src1[63] & ~alu_src2[63])//两个同时为1时（src1[31]=1,表示为负数），（~src2[31]=1, => src2为正数），括号内的值为1，此时表示src1<src2
                        | ((alu_src1[63] ~^ alu_src2[63]) & adder_result[63]);//&之前，同或操作，为1，表示两数符号相同；&之后，为1表示最终结果为负数

// SLTU result
assign sltu_result[63:1] = 63'b0;
assign sltu_result[0]    = ~adder_cout;//为什么要取反，是不是错了？，没有错，举个例子就知道了

// bitwise operation
assign and_result = alu_src1 & alu_src2;
assign or_result  = alu_src1 | alu_src2 ;
assign nor_result = ~or_result;
assign xor_result = alu_src1 ^ alu_src2;
assign lui_result = {alu_src2[31:0], 32'b0};

// SLL result 
assign sll_result = alu_src2 << alu_src1[5:0]; 

// SRL, SRA result
assign sr64_result = {{64{op_sra & alu_src2[63]}}, alu_src2[63:0]} >> alu_src1[5:0];

assign sr_result   = sr64_result[63:0];

// final result mux
assign alu_result = ({64{op_add|op_sub}} & add_sub_result)
                  | ({64{op_slt       }} & slt_result)
                  | ({64{op_sltu      }} & sltu_result)
                  | ({64{op_and       }} & and_result)
                  | ({64{op_nor       }} & nor_result)
                  | ({64{op_or        }} & or_result)
                  | ({64{op_xor       }} & xor_result)
                  | ({64{op_lui       }} & lui_result)
                  | ({64{op_sll       }} & sll_result)
                  | ({64{op_srl|op_sra}} & sr_result);

endmodule
