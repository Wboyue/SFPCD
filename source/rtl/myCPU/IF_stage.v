`include "mycpu.h"

module if_stage(
    input                          clk            ,
    input                          reset          ,

    input                          ds_allowin     ,

    input  [`BR_BUS_WD       -1:0] br_bus ,//分支总线（包括1位标志位，标志是否分支1位，以及跳转的PC64位）   

    output                         fs_to_ds_valid ,
    output [`FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus   ,

    output        inst_sram_en   ,

    output [63:0] inst_sram_addr ,
 //   output [31:0] inst_sram_wdata,
    input  [31:0] inst_sram_rdata,
    input  inst_sram_en_toif,

//debug
    output  [31:0]  debug_if_inst
   // output  [63:0]  debug_nextpc
);

//流水线阻塞相关的信号
reg         fs_valid;
wire        fs_ready_go;
wire        fs_allowin;
wire        to_fs_valid;
//

wire [63:0] seq_pc;
wire [63:0] nextpc;

wire         br_taken;
wire [ 63:0] br_target;
assign {br_taken,br_target} = br_bus;

wire [31:0] fs_inst;
reg  [63:0] fs_pc;


//
assign to_fs_valid  = ~reset;
assign seq_pc       = fs_pc + 64'd1;
assign nextpc       = br_taken ? br_target : seq_pc; 


// 
assign fs_ready_go    = 1'b1;
assign fs_allowin     = !fs_valid || fs_ready_go && ds_allowin;
assign fs_to_ds_valid =  fs_valid && fs_ready_go;
always @(posedge clk) begin
    if (reset) begin
        fs_valid <= 1'b0;
    end
    else if (fs_allowin) begin
        fs_valid <= to_fs_valid;
    end

    if (reset) begin
        fs_pc <= 64'd0;  //计算机组成与设计-软硬件接口74页 nextpc be 0x0000 0000 0040 0000 during reset 。
        //注意RISCV ISA没有分支严延迟槽
    end
    else if (to_fs_valid && fs_allowin) begin
        fs_pc <= nextpc;
    end
end


assign fs_inst          = inst_sram_rdata;

assign inst_sram_en     = to_fs_valid && fs_allowin && inst_sram_en_toif;
assign inst_sram_addr   = nextpc;
//assign inst_sram_wen    = 4'd0;
//assign inst_sram_wdata  = 32'b0;

assign fs_to_ds_bus     = {fs_inst , fs_pc};//IF阶段传送到ID阶段,传送出去的有32位的指令，64位的下一次取址的地址（pc）
assign debug_if_inst = fs_inst;
//assign debug_nextpc = nextpc;
endmodule
