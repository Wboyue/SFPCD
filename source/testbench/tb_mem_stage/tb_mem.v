
`timescale 1ns/10ps

module tb_mem();

reg clk,reset,ws_allowin,es_to_ms_valid;
reg [134:0] es_to_ms_bus;
reg [63:0] data_sram_rdata;
wire ms_allowin,ms_to_ws_valid;
wire [133:0] ms_to_ws_bus;
wire [63:0] debug_ms_pc,debug_ms_final_result;
wire [4:0] debug_ms_dest;
    mem_stage U1( 
     .clk    (clk)       ,
    .reset      (reset)    ,
    .ws_allowin   (ws_allowin) ,
    .ms_allowin (ms_allowin)    ,

   .es_to_ms_valid (es_to_ms_valid),
    .es_to_ms_bus  (es_to_ms_bus)  ,

   .ms_to_ws_valid   (ms_to_ws_valid),
    .ms_to_ws_bus  (ms_to_ws_bus)  ,

   .data_sram_rdata  (data_sram_rdata)        ,

    .debug_ms_dest  (debug_ms_dest) ,
    .debug_ms_final_result  (debug_ms_final_result),
    .debug_ms_pc (debug_ms_pc)
        );

    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk; //产生100MHz的时钟信号，周期10ns
        end
    end

    initial begin
        reset = 1'b1;
        ws_allowin=1'b1;
        es_to_ms_valid=1'b1;

        es_to_ms_bus={1'd0, 1'd1,5'd2,64'd20,64'd1};
        data_sram_rdata=64'd3;

   #10
   reset =1'b0;
     //   #10 
     //   es_to_ms_bus=96'h005101930000000000000002;
    //  #10
      //  es_to_ms_bus=96'h00100a130000000000000003;
       
    end


endmodule