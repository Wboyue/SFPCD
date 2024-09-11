`include "mycpu.h"

module mem_stage(
    input                          clk           ,
    input                          reset         ,
    //allowin
    input                          ws_allowin    ,
    output                         ms_allowin    ,
    //from es
    input                          es_to_ms_valid,
    input  [`ES_TO_MS_BUS_WD -1:0] es_to_ms_bus  ,
    //to ws
    output                         ms_to_ws_valid,
    output [`MS_TO_WS_BUS_WD -1:0] ms_to_ws_bus  ,
    //from data-sram
    input  [63                 :0] data_sram_rdata,



   output [4:0] debug_ms_dest,
   output [63:0] debug_ms_final_result,
   output [63:0] debug_ms_pc

);

reg         ms_valid;
wire        ms_ready_go;

reg [`ES_TO_MS_BUS_WD -1:0] es_to_ms_bus_r;
wire        ms_res_from_mem;
wire        ms_gr_we;
wire [ 4:0] ms_dest;
wire [63:0] ms_alu_result;
wire [63:0] ms_pc;
assign {ms_res_from_mem,  //1
        ms_gr_we       ,  //1
        ms_dest        ,  //5
        ms_alu_result  ,  //64
        ms_pc             //64送到最后一级，debug波形的时候比较方便
       } = es_to_ms_bus_r;

wire [63:0] mem_result;
wire [63:0] ms_final_result;

assign ms_to_ws_bus = {ms_gr_we       ,  //1 为1表示要激活寄存器堆的写使能，例如add写回rd，ld也要写回rd，而sw，beq不用写回rd,在写回阶段要用到
                       ms_dest        ,  //5
                       ms_final_result,  //64
                       ms_pc             //64
                      };
assign debug_ms_dest=ms_dest;
assign debug_ms_final_result=ms_final_result;
assign debug_ms_pc=ms_pc;

assign ms_ready_go    = 1'b1;
assign ms_allowin     = !ms_valid || ms_ready_go && ws_allowin;
assign ms_to_ws_valid = ms_valid && ms_ready_go;
always @(posedge clk) begin
    if (reset) begin
        ms_valid <= 1'b0;
    end
    else if (ms_allowin) begin
        ms_valid <= es_to_ms_valid;
    end

    if (es_to_ms_valid && ms_allowin) begin
        es_to_ms_bus_r  <= es_to_ms_bus;
    end
end

assign mem_result = data_sram_rdata;

assign ms_final_result = ms_res_from_mem ? mem_result
                                         : ms_alu_result;

endmodule
