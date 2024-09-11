`include "mycpu.h"
module mycpu_top(
    input         clk,
    input         reset,


    input  inst_sram_en_toif,
    input [31:0] inst_sram_wdata,
    input [63:0] inst_sram_waddr,
    input inst_sram_wen,

    // trace debug interface
    output [63:0] debug_wb_pc,
    output [ 3:0] debug_wb_rf_wen,
    output [ 4:0] debug_wb_rf_wnum,
    output [63:0] debug_wb_rf_wdata,
    output [31:0] debug_if_inst

    // //if debug
    // output  [31:0]  debug_if_inst,
    // output  [63:0]  debug_nextpc,

    // //id debug
    //     output debug_load_op,
    // output  [11:0]  debug_alu_op,

    
//
// output [63:0] debug_rs1 ,
// output [63:0] debug_rs2 ,
// output [63:0] debug_es_pc,
// output [4:0]  debug_es_dest,
// output [63:0] debug_es_alu_result,



//mem_debug

//    output [4:0] debug_ms_dest,
//    output [63:0] debug_ms_final_result,
//    output [63:0] debug_ms_pc

);

//always @(posedge clk) reset <= ~resetn;

wire         ds_allowin;
wire         es_allowin;
wire         ms_allowin;
wire         ws_allowin;
wire         fs_to_ds_valid;
wire         ds_to_es_valid;
wire         es_to_ms_valid;
wire         ms_to_ws_valid;
wire [`FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus;
wire [`DS_TO_ES_BUS_WD -1:0] ds_to_es_bus;
wire [`ES_TO_MS_BUS_WD -1:0] es_to_ms_bus;
wire [`MS_TO_WS_BUS_WD -1:0] ms_to_ws_bus;
wire [`WS_TO_RF_BUS_WD -1:0] ws_to_rf_bus;
wire [`BR_BUS_WD       -1:0] br_bus;


    // inst sram 
wire       inst_sram_en;
//wire inst_sram_wen;
wire [63:0] inst_sram_addr;
//wire [31:0] inst_sram_wdata,
wire  [31:0] inst_sram_rdata;
//wire   inst_sram_en_toif,
    // data sram 
wire        data_sram_en;
wire  data_sram_wen;
wire [63:0] data_sram_addr;
wire [63:0] data_sram_wdata;
wire  [63:0] data_sram_rdata;

// IF stage
if_stage if_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    //allowin
    .ds_allowin     (ds_allowin     ),
    //brbus
    .br_bus         (br_bus         ),
    //outputs
    .fs_to_ds_valid (fs_to_ds_valid ),
    .fs_to_ds_bus   (fs_to_ds_bus   ),
    // inst sram interface
    .inst_sram_en   (inst_sram_en   ),
   // .inst_sram_wen  (inst_sram_wen  ),
    .inst_sram_addr (inst_sram_addr ),
   // .inst_sram_wdata(inst_sram_wdata),
    .inst_sram_rdata(inst_sram_rdata),
    .inst_sram_en_toif ( inst_sram_en_toif),
    
    
     .debug_if_inst (debug_if_inst)

    // //debug
    // .debug_if_inst         (debug_if_inst)  ,
    // .debug_nextpc          (debug_nextpc)   
);
// ID stage
id_stage id_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    //allowin
    .es_allowin     (es_allowin     ),
    .ds_allowin     (ds_allowin     ),
    //from fs
    .fs_to_ds_valid (fs_to_ds_valid ),
    .fs_to_ds_bus   (fs_to_ds_bus   ),
    //to es
    .ds_to_es_valid (ds_to_es_valid ),
    .ds_to_es_bus   (ds_to_es_bus   ),
    //to fs
    .br_bus         (br_bus         ),
    //to rf: for write back
    .ws_to_rf_bus   (ws_to_rf_bus   )


    //     //id debug
    // .debug_load_op        (debug_load_op)        ,
    // .debug_alu_op          (debug_alu_op)        

);
// EXE stage
exe_stage exe_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    //allowin
    .ms_allowin     (ms_allowin     ),
    .es_allowin     (es_allowin     ),
    //from ds
    .ds_to_es_valid (ds_to_es_valid ),
    .ds_to_es_bus   (ds_to_es_bus   ),
    //to ms
    .es_to_ms_valid (es_to_ms_valid ),
    .es_to_ms_bus   (es_to_ms_bus   ),
    // data sram interface
    .data_sram_en   (data_sram_en   ),
    .data_sram_wen  (data_sram_wen  ),
    .data_sram_addr (data_sram_addr ),
    .data_sram_wdata(data_sram_wdata)

//     //
// .debug_rs1                (debug_rs1),
// .debug_rs2               (debug_rs2),
// .debug_es_pc                   (debug_es_pc),
// .debug_es_dest         (debug_es_dest), 
// .debug_es_alu_result      (debug_es_alu_result)

    
);
// MEM stage
mem_stage mem_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    //allowin
    .ws_allowin     (ws_allowin     ),
    .ms_allowin     (ms_allowin     ),
    //from es
    .es_to_ms_valid (es_to_ms_valid ),
    .es_to_ms_bus   (es_to_ms_bus   ),
    //to ws
    .ms_to_ws_valid (ms_to_ws_valid ),
    .ms_to_ws_bus   (ms_to_ws_bus   ),
    //from data-sram
    .data_sram_rdata(data_sram_rdata)

    
//mem_debug

// .debug_ms_dest         (debug_ms_dest),
// .debug_ms_final_result         (debug_ms_final_result),
// .debug_ms_pc            (debug_ms_pc)


    
);
// WB stage
wb_stage wb_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    //allowin
    .ws_allowin     (ws_allowin     ),
    //from ms
    .ms_to_ws_valid (ms_to_ws_valid ),
    .ms_to_ws_bus   (ms_to_ws_bus   ),
    //to rf: for write back
    .ws_to_rf_bus   (ws_to_rf_bus   ),
    //trace debug interface
    .debug_wb_pc      (debug_wb_pc      ),
    .debug_wb_rf_wen  (debug_wb_rf_wen  ),
    .debug_wb_rf_wnum (debug_wb_rf_wnum ),
    .debug_wb_rf_wdata(debug_wb_rf_wdata)
);

inst_sram inst_ram
(
    .clk                (clk                  ),   
    .inst_sram_en       (inst_sram_en         ),
    .inst_sram_wen      (inst_sram_wen        ),   
    .inst_sram_addr     (inst_sram_addr       ),   
    .inst_sram_wdata    (inst_sram_wdata      ),   
    .inst_sram_rdata    (inst_sram_rdata      ) ,
     .inst_sram_waddr   (inst_sram_waddr)
);



//data ram
data_sram data_ram
(
    .clk                 (clk                 ),   
    .data_sram_en        (data_sram_en        ),
    .data_sram_wen       (data_sram_wen       ),   
    .data_sram_addr      (data_sram_addr      ),  
    .data_sram_wdata     (data_sram_wdata     ), 
    .data_sram_rdata     (data_sram_rdata     )    
);

endmodule
