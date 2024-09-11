
`timescale 1ns/10ps

module tb_if();
reg clk,reset,ds_allowin;
reg [64:0] br_bus;
reg  [31:0] inst_sram_rdata;
reg inst_sram_en_toif;

wire fs_to_ds_valid ;
wire [95:0] fs_to_ds_bus;
wire inst_sram_en   ;
//wire inst_sram_wen ;
wire [63:0] inst_sram_addr ;
wire  [31:0]  debug_if_inst;
wire [63:0]  debug_nextpc;


    if_stage U1( 
     .clk       (clk)     ,
    .reset (reset)          ,

    .ds_allowin    (ds_allowin) ,
    
    .br_bus (br_bus) ,
    .inst_sram_rdata (inst_sram_rdata),
    .inst_sram_en_toif (inst_sram_en_toif),

    .fs_to_ds_valid (fs_to_ds_valid) ,
    .fs_to_ds_bus (fs_to_ds_bus)   ,

    .inst_sram_en (inst_sram_en)   ,
   // .inst_sram_wen (inst_sram_wen)  ,
    .inst_sram_addr (inst_sram_addr) ,

    .debug_if_inst (debug_if_inst),
    .debug_nextpc (debug_nextpc)

        );

    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk; //产生100MHz的时钟信号，周期10ns
        end
    end

    initial begin
        reset = 1'b1;
        ds_allowin=1'b1;
        br_bus =65'd0;
        inst_sram_rdata=32'b000000010100_00000_000_00010_0010011;
        #10 
        reset =1'b0;
        inst_sram_en_toif=1'd1;
        #10
        inst_sram_rdata = 32'b000000000101_00010_000_00011_0010011;
        #10
        inst_sram_rdata = 32'b000000000001_00000_000_10100_0010011;
    end


endmodule