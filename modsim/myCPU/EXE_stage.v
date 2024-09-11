//寄存器中的值被解释成二进制补码，或无符号二进制数

`include "mycpu.h"

module exe_stage(
    input                          clk           ,
    input                          reset         ,
    //allowin
    input                          ms_allowin    ,
    output                         es_allowin    ,
    //from ds
    input                          ds_to_es_valid,
    input  [`DS_TO_ES_BUS_WD -1:0] ds_to_es_bus  ,
    //to ms
    output                         es_to_ms_valid,
    output [`ES_TO_MS_BUS_WD -1:0] es_to_ms_bus  ,
    // data sram interface
    output        data_sram_en   ,
    output  data_sram_wen  ,
    output [63:0] data_sram_addr ,
    output [63:0] data_sram_wdata,
    


output [63:0] debug_rs1 ,
output [63:0] debug_rs2 ,
output [63:0] debug_es_pc,
output [4:0]  debug_es_dest,
output [63:0] debug_es_alu_result,

output [11:0] debug_es_alu_op,
output [63:0] debug_es_alu_src1,
output [63:0] debug_es_alu_src2


);

reg         es_valid      ;
wire        es_ready_go   ;

reg  [`DS_TO_ES_BUS_WD -1:0] ds_to_es_bus_r;
wire [11:0] es_alu_op     ;
wire        es_load_op    ;


wire        es_src2_is_imm; 
wire        es_src2_is_rs2; 
wire        es_jal_op     ;
wire        es_gr_we      ;
wire        es_mem_we     ;
wire [ 4:0] es_dest       ;
wire [63:0] es_imm        ;
wire [63:0] es_rs1_value   ;
wire [63:0] es_rs2_value   ;
wire [63:0] es_pc         ;

assign {es_alu_op      ,  
        es_load_op     ,  
        es_src2_is_imm ,  
        es_src2_is_rs2   ,  
        es_jal_op      ,
        es_gr_we       ,  
        es_mem_we      , 
        es_dest        ,  
        es_imm         , 
        es_rs1_value    ,  
        es_rs2_value    , 
        es_pc             
       } = ds_to_es_bus_r;
//debug
assign debug_imm=es_imm;
assign debug_rs1 = es_rs1_value;
assign debug_rs2 = es_rs2_value;
assign debug_es_pc = es_pc;
assign debug_es_dest=es_dest;

wire [63:0] es_alu_src1   ;
wire [63:0] es_alu_src2   ;
wire [63:0] es_alu_result ;

wire        es_res_from_mem;

assign es_res_from_mem = es_load_op;//是否是载入操作,如果是，则在mem阶段向写回阶段的输出的结果取自data_sram_rdata，否则取alu的计算输出
assign es_to_ms_bus = {es_res_from_mem,  //1
                       es_gr_we       ,  //1 为1表示要激活寄存器堆的写使能，例如add写回rd，ld也要写回rd，而sw，beq不用写回rd
                       es_dest        ,  //5
                       es_alu_result  ,  //64
                       es_pc             //64
                      };


assign es_ready_go    = 1'b1;
assign es_allowin     = !es_valid || es_ready_go && ms_allowin;
assign es_to_ms_valid =  es_valid && es_ready_go;
always @(posedge clk) begin
    if (reset) begin
        es_valid <= 1'b0;
    end
    else if (es_allowin) begin
        es_valid <= ds_to_es_valid;
    end

    if (ds_to_es_valid && es_allowin) begin
        ds_to_es_bus_r <= ds_to_es_bus;
    end
end

assign es_alu_src1 = es_jal_op  ? es_pc[31:0] :
                                  es_rs1_value;
assign es_alu_src2 = es_src2_is_imm ? es_imm : 
                     es_jal_op      ? 64'd4 :  //是jal操作，则pc+4需要存入目标寄存器中
                                      es_rs2_value;



assign debug_es_alu_op=es_alu_op;
assign debug_es_alu_src1=es_alu_src1;
assign debug_es_alu_src2=es_alu_src2;
assign debug_es_alu_result=es_alu_result;

alu u_alu(
    .alu_op     (es_alu_op    ),
    .alu_src1   (es_alu_src1  ),
    .alu_src2   (es_alu_src2  ),
    .alu_result (es_alu_result)
    );

assign data_sram_en    = 1'b1;
assign data_sram_wen   = es_mem_we&&es_valid ? 1'hf : 1'h0;
assign data_sram_addr  = es_alu_result;
assign data_sram_wdata = es_rs2_value;

endmodule
