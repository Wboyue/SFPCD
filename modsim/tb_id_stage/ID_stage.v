/************************************************************************
  > Description :
  ID 阶段完成：
  1、根据来自IF阶段的。fs_to_ds_bus解码指令
  2、实现流水线阻塞，
  注意：
  1、分支指令要特殊处理，包括跳转：输出br_bus；链接：要实现写寄存器堆
*************************************************************************/
`include "mycpu.h"

module id_stage(
    input                          clk           ,
    input                          reset         ,
    //allowin
    input                          es_allowin    ,
    output                         ds_allowin    ,
    //from fs
    input                          fs_to_ds_valid,
    input  [`FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus  ,
    //to es
    output                         ds_to_es_valid,
    output [`DS_TO_ES_BUS_WD -1:0] ds_to_es_bus  ,//宽度会随着支持的指令数量变化
    //to fs
    output [`BR_BUS_WD       -1:0] br_bus        ,
    //to rf(寄存器堆): for write back
    input [`WS_TO_RF_BUS_WD -1:0] ws_to_rf_bus ,

//debug
    output debug_load_op,
    output  [11:0]  debug_alu_op,
    output [63:0] debug_imm,
    output [4:0] debug_dest,
    output [63:0] debug_ds_pc,
    output [31:0] debug_inst
);

reg         ds_valid   ;
wire        ds_ready_go;

//思考为什么同时需要fs_pc与ds_pc，因为技术分支目标地址时需要用到PC，fs_pc直接来自输入，路径短速度快。此外从这一级传出去的
//PC地址不能直接来自输入。
wire [63                 :0] fs_pc;
//wire [95                 :64] fs_inst;
reg  [`FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus_r;
assign fs_pc = fs_to_ds_bus[63:0];

wire [31:0] ds_inst;
wire [63:0] ds_pc  ;
assign {ds_inst,
        ds_pc  } = fs_to_ds_bus_r;



wire        br_taken;
wire [63:0] br_target;

wire [11:0] alu_op;
wire        load_op;

wire        src2_is_imm;
wire        src2_is_rs2;//link操作,CPU设计实战85页
wire        res_from_mem;
wire        gr_we;
wire        mem_we;
wire        jal_op;
wire [ 4:0] dest;                                      
wire [63:0] imm;
wire [63:0] rs1_value;
wire [63:0] rs2_value;


wire [ 6:0] opcode;
wire [ 4:0] rd;
wire [ 4:0] rs1;
wire [ 4:0] rs2;
wire [ 2:0] func3;
wire [ 6:0] func7;
wire [63:0] imm_I_type;
wire [63:0] imm_S_type;
wire [63:0] imm_B_type;
wire [63:0] imm_U_type;
wire [63:0] imm_J_type;


wire        inst_add;
wire        inst_sub;
wire        inst_slt;
wire        inst_sltu;
wire        inst_and;
wire        inst_or;
wire        inst_xor;
wire        inst_nor;
wire        inst_sll;
wire        inst_srl;
wire        inst_sra;
wire        inst_addi;
wire        inst_lui;
wire        inst_lw;
wire        inst_sw;
wire        inst_beq;
wire        inst_bne;
wire        inst_jal;
wire        inst_jalr;

wire        inst_slti;


wire        dst_is_r1;  
wire        dst_is_rd;   

wire [ 4:0] rf_raddr1;
wire [63:0] rf_rdata1;
wire [ 4:0] rf_raddr2;
wire [63:0] rf_rdata2;

wire        rs_eq_rt;



//流水线阻塞相关
assign ds_ready_go    = 1'b1;
assign ds_allowin     = !ds_valid || ds_ready_go && es_allowin;
assign ds_to_es_valid = ds_valid && ds_ready_go;
always @(posedge clk) begin
    if (reset) begin
        ds_valid <= 1'b0;
    end
    else if (ds_allowin) begin
        ds_valid <= fs_to_ds_valid;
    end

    if (fs_to_ds_valid && ds_allowin) begin
        fs_to_ds_bus_r <= fs_to_ds_bus;
    end
end

///////////////////////CPU设计实战第91页，改为riscv时要改动////////////////////////////////////////
assign opcode       = ds_inst[ 6: 0];
assign func3        = ds_inst[14:12];
assign func7        = ds_inst[31:25];
assign rd           = ds_inst[11: 7];
assign rs1          = ds_inst[19:15];
assign rs2          = ds_inst[24:20];
assign imm_I_type   = {{53{ds_inst[31]}},ds_inst[30:20]};//注意12位的imm字段是补码值。
assign imm_S_type   = {{53{ds_inst[31]}},ds_inst[30:25],ds_inst[11: 7]};
assign imm_B_type   = {{52{ds_inst[31]}},ds_inst[7],ds_inst[30:25],ds_inst[11: 8],1'd0};//
assign imm_U_type   = {{33{ds_inst[31]}},ds_inst[30:12],12'd0};
assign imm_J_type   = {{44{ds_inst[31]}},ds_inst[19:12],ds_inst[20],ds_inst[30:21],1'd0};

//RV32I Base Instruction Set

assign inst_add    = ( (opcode == 7'b0110011) && (func3 == 3'b000) && (func7 == 7'h0000000) )? 1 : 0;
assign inst_sub    = ( (opcode == 7'b0110011) && (func3 == 3'b000) && (func7 == 7'b0100000) )? 1 : 0;

assign inst_slt    = ( (opcode == 7'b0110011) && (func3 == 3'b010) && (func7 == 7'b0000000) )? 1 : 0;

assign inst_sltu   = ( (opcode == 7'b0110011) && (func3 == 3'b011) && (func7 == 7'b0000000) )? 1 : 0;
assign inst_and    = ( (opcode == 7'b0110011) && (func3 == 3'b111) && (func7 == 7'b0000000) )? 1 : 0;
assign inst_or     = ( (opcode == 7'b0110011) && (func3 == 3'b110) && (func7 == 7'b0000000) )? 1 : 0;
assign inst_xor    = ( (opcode == 7'b0110011) && (func3 == 3'b100) && (func7 == 7'b0000000) )? 1 : 0;
assign inst_nor    = 0;//暂时不知道是什么指令先赋个0
assign inst_sll    = ( (opcode == 7'b0110011) && (func3 == 3'b001) && (func7 == 7'b0000000) )? 1 : 0;
assign inst_srl    = ( (opcode == 7'b0110011) && (func3 == 3'b101) && (func7 == 7'b0000000) )? 1 : 0;
assign inst_sra    = ( (opcode == 7'b0110011) && (func3 == 3'b101) && (func7 == 7'b0100000) )? 1 : 0;

assign inst_addi   = ( (opcode == 7'b0010011) && (func3 == 3'b000) )? 1 : 0;
assign inst_lui    = ( (opcode == 7'b0110111) )? 1 : 0;
assign inst_ld     = ( (opcode == 7'b0000011) && (func3 == 3'b011) )? 1 : 0;
assign inst_sd     = ( (opcode == 7'b0100011) && (func3 == 3'b011) )? 1 : 0;
assign inst_lw     = ( (opcode == 7'b0000011) && (func3 == 3'b010) )? 1 : 0;
assign inst_sw     = ( (opcode == 7'b0100011) && (func3 == 3'b010) )? 1 : 0;
assign inst_beq    = ( (opcode == 7'b1100011) && (func3 == 3'b000) )? 1 : 0;
assign inst_bne    = ( (opcode == 7'b1100011) && (func3 == 3'b001) )? 1 : 0;
assign inst_jal    = ( (opcode == 7'b1101111) )? 1 : 0;
assign inst_jalr   = ( (opcode == 7'b1100111) && (func3 == 3'b000))? 1 : 0;


assign inst_slti   = ( (opcode == 7'b0010011) && (func3 == 3'b010) )? 1 : 0;

///////////////////////////////////////////////////////////////////////////////////
///////////////////////下面这些只有一个为1，其他都应该是0，ALU执行alu_op对应的运算///
assign alu_op[ 0] = inst_add | inst_addi | inst_lw | inst_sw | inst_jal | inst_ld |inst_sd;//加法
assign alu_op[ 1] = inst_sub | inst_slti;//减法
assign alu_op[ 2] = inst_slt;
assign alu_op[ 3] = inst_sltu;
assign alu_op[ 4] = inst_and;
assign alu_op[ 5] = inst_nor;
assign alu_op[ 6] = inst_or;
assign alu_op[ 7] = inst_xor;
assign alu_op[ 8] = inst_sll;
assign alu_op[ 9] = inst_srl;
assign alu_op[10] = inst_sra;
assign alu_op[11] = inst_lui;

assign load_op    = inst_lw | inst_ld;//可能还有其他情况
//imm是二进制补码或者无符号二进制数
assign imm =  (inst_addi || inst_slti || inst_ld || inst_lw || inst_jalr)          ? imm_I_type :
              (inst_sd || inst_sw)                                    ? imm_S_type :
              (inst_beq || inst_bne)                                  ? imm_B_type :
              (inst_lui)                                              ? imm_U_type :
              (inst_jal)                                              ? imm_J_type : 64'd0;


assign src2_is_imm  = inst_addi | inst_slti | inst_lui | inst_lw | inst_sw | inst_ld | inst_sd;
assign src2_is_rs2  = inst_add | inst_sub | inst_slt | inst_sltu | 
                      inst_and | inst_or | inst_xor | inst_nor | 
                      inst_sll | inst_srl | inst_sra | inst_beq | inst_bne;
assign res_from_mem = inst_lw;//有什么用?好像没用
//assign dst_is_r1   = inst_jal |inst_jalr;
//assign dst_is_rd    = inst_add | inst_addi | inst_lui | inst_lw | inst_ld | inst_jal | inst_jalr;
assign gr_we        = ~inst_sw & ~inst_beq & ~inst_bne ;//gr_we 为1表示要激活寄存器堆的写使能
assign mem_we       = inst_sw | inst_sd;
assign jal_op       = inst_jal | inst_jalr;


//assign dest         = dst_is_r1 ? 5'd1 : //先假设jal的返回地址默认写到r1
//                      (dst_is_rd)?  rd : 5'd0 ;//mips:如果是jal指令，则返回地址默认写入第31号寄存器,CPU设计实战85页;riscv是1号寄存器
assign dest = rd;

assign rf_raddr1 = rs1;
assign rf_raddr2 = rs2;

wire        rf_we   ;
wire [ 4:0] rf_waddr;
wire [63:0] rf_wdata;

assign {rf_we   ,  //69:69
        rf_waddr,  //68:64
        rf_wdata   //63:0
       } = ws_to_rf_bus;
regfile u_regfile(
    .clk    (clk      ),
    .raddr1 (rf_raddr1),
    .rdata1 (rf_rdata1),
    .raddr2 (rf_raddr2),
    .rdata2 (rf_rdata2),
    .we     (rf_we    ),
    .waddr  (rf_waddr ),
    .wdata  (rf_wdata )
    );

assign rs1_value = rf_rdata1;
assign rs2_value = rf_rdata2;

assign rs_eq_rt = (rs1_value == rs2_value);
//计算是否需要分支
assign br_bus       = {br_taken,br_target};
assign br_taken = (   (inst_beq  &&  rs_eq_rt) //相等则分支BEQ
                   || (inst_bne  && !rs_eq_rt) //不相等则分支BNE
                   || inst_jal
                   || inst_jalr
                  ) && ds_valid;
//计算分支地址
assign br_target =  (fs_pc + imm) ;
                  


//ds_to_es_bus是控制信号,输入到EX阶段
assign ds_to_es_bus = {alu_op      ,  //12    目前只有12种运算，后续还需要扩展,控制算术逻辑单元进行哪种运算
                       load_op     ,  //1       是否是载入操作,如果是，则在mem阶段输出的结果取自data_sram_rdata，否则取alu的计算输出
                       src2_is_imm ,  //1     ALU的输入是立即数
                       src2_is_rs2 ,  //1   ALU的输入是来自rs2号寄存器
                       jal_op      ,
                       gr_we       ,  //1  为1表示要激活寄存器堆的写使能，例如add写回rd，ld也要写回rd，而sw，beq不用写回rd
                       mem_we      ,  //1  为1表示要写data_sram
                       dest        ,  //5
                       imm         ,  //64bit
                       rs1_value   ,  //64bit
                       rs2_value   ,  //64bit
                       ds_pc          //64bit
                      };

assign debug_alu_op = alu_op;
assign debug_load_op = load_op;
assign debug_imm =imm;
assign debug_dest =dest;
assign debug_ds_pc=ds_pc;
assign debug_inst=ds_inst;
endmodule
