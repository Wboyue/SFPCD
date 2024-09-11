
`timescale 1ns/10ps

module tb_wb();

reg clk,reset,ms_to_ws_valid;
reg [133:0] ms_to_ws_bus;

wire [69:0] ws_to_rf_bus;

wire ws_allowin;

wire [63:0] debug_wb_pc, debug_wb_rf_wdata;
wire [4:0] debug_wb_rf_wnum;
wire [3:0] debug_wb_rf_wen;
    wb_stage U1( 
     .clk    (clk)       ,
    .reset      (reset)    ,
    .ws_allowin   (ws_allowin) ,
    .ms_to_ws_valid (ms_to_ws_valid)    ,
   .ms_to_ws_bus (ms_to_ws_bus),
    .ws_to_rf_bus  (ws_to_rf_bus)  ,

   .debug_wb_pc   (debug_wb_pc),
    .debug_wb_rf_wen  (debug_wb_rf_wen)  ,
   .debug_wb_rf_wnum  (debug_wb_rf_wnum)        ,
    .debug_wb_rf_wdata  (debug_wb_rf_wdata) 
        );

    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk; //产生100MHz的时钟信号，周期10ns
        end
    end

    initial begin
        reset = 1'b1;
     
        ms_to_ws_valid=1'b1;

        ms_to_ws_bus={1'd1,5'd2,64'd20,64'd1};
    

   #10
   reset =1'b0;
        //#10 
      // fs_to_ds_bus=96'h005101930000000000000002;
   //   #10
     //   fs_to_ds_bus=96'h00100a130000000000000003;
       
    end


endmodule