
`timescale 1ns/10ps

module tb_exe();

reg clk,reset,ms_allowin,ds_to_es_valid;
reg [279:0] ds_to_es_bus;


wire es_allowin,es_to_ms_valid,data_sram_en,data_sram_wen;
wire [134:0] es_to_ms_bus;
wire [63:0] debug_es_alu_src1,debug_es_alu_src2,data_sram_addr, data_sram_wdata,debug_rs1,debug_rs2,debug_es_pc,debug_es_alu_result;
wire [4:0] debug_es_dest;

wire [11:0] debug_es_alu_op;
    exe_stage U1( 
     .clk    (clk)       ,
    .reset      (reset)    ,
    .ms_allowin   (ms_allowin) ,
    .es_allowin (es_allowin)    ,
   .ds_to_es_valid (ds_to_es_valid),
    .ds_to_es_bus  (ds_to_es_bus)  ,

   .es_to_ms_valid   (es_to_ms_valid),
    .es_to_ms_bus  (es_to_ms_bus)  ,

   .data_sram_en  (data_sram_en)        ,
    .data_sram_wen  (data_sram_wen) ,
    .data_sram_addr  (data_sram_addr),
    .data_sram_wdata (data_sram_wdata),

    .debug_rs1  (debug_rs1),
    .debug_rs2  (debug_rs2),
    .debug_es_pc  (debug_es_pc),
    .debug_es_dest (debug_es_dest),
    .debug_es_alu_result  (debug_es_alu_result),

    .debug_es_alu_op (debug_es_alu_op),
    .debug_es_alu_src1 (debug_es_alu_src1),
    .debug_es_alu_src2 (debug_es_alu_src2)
        );

    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk; //产生100MHz的时钟信号，周期10ns
        end
    end

    initial begin
        reset = 1'b1;
        ms_allowin=1'b1;
        ds_to_es_valid=1'b1;

        ds_to_es_bus={1'd0,12'd1,1'd0,1'd1,1'd0,1'd0,1'd1,1'd0,5'd2,64'd20,64'd0,64'd5,64'd1};
    
      
   #10
   reset =1'b0;
        #10 
       ds_to_es_bus={1'd1,12'd1,1'd0,1'd1,1'd0,1'd0,1'd1,1'd0,5'd2,64'd20,64'd4,64'd5,64'd1};
      #10
        ds_to_es_bus={1'd1,12'd1,1'd0,1'd1,1'd0,1'd0,1'd1,1'd0,5'd2,64'd20,64'd8,64'd3,64'd1};
       
    end


endmodule