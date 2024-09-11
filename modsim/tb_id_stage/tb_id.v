
`timescale 1ns/10ps

module tb_id();

reg clk,reset,es_allowin,fs_to_ds_valid;
reg [95:0] fs_to_ds_bus;
reg [69:0] ws_to_rf_bus;

wire ds_allowin, debug_load_op,ds_to_es_valid;
wire [278:0] ds_to_es_bus;
wire [64:0] br_bus;
wire [11:0]  debug_alu_op;
wire [63:0] debug_imm;
wire [4:0] debug_dest;
wire [63:0] debug_ds_pc;
wire [31:0] debug_inst;

    id_stage U1( 
     .clk    (clk)       ,
    .reset      (reset)    ,
    .es_allowin   (es_allowin) ,
    .ds_allowin (ds_allowin)    ,
   .fs_to_ds_valid (fs_to_ds_valid),
    .fs_to_ds_bus  (fs_to_ds_bus)  ,
   .ds_to_es_valid   (ds_to_es_valid),
    .ds_to_es_bus  (ds_to_es_bus)  ,
   .br_bus  (br_bus)        ,
    .ws_to_rf_bus  (ws_to_rf_bus) ,

    .debug_load_op  (debug_load_op),
    .debug_alu_op  (debug_alu_op),
    .debug_imm  (debug_imm),
    .debug_dest (debug_dest),
    .debug_ds_pc  (debug_ds_pc),
    .debug_inst (debug_inst)
        );


// reg  [ 4:0] raddr1;//共32个64位寄存器
// wire[63:0] rdata1;
//     // READ PORT 2
// reg  [ 4:0] raddr2;
// wire [63:0] rdata2;
//     // WRITE PORT
// reg         we;      //write enable, HIGH valid
// reg [ 4:0] waddr;
// reg [63:0] wdata;

    // regfile u_regfile(
    // .clk    (clk      ),
    // .raddr1 (rf_raddr1),
    // .rdata1 (rf_rdata1),
    // .raddr2 (rf_raddr2),
    // .rdata2 (rf_rdata2),
    // .we     (rf_we    ),
    // .waddr  (rf_waddr ),
    // .wdata  (rf_wdata )
    // );

    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk; //产生100MHz的时钟信号，周期10ns
        end
    end

    initial begin
        reset = 1'b1;
        es_allowin=1'b1;
        fs_to_ds_valid=1'b1;

        fs_to_ds_bus=96'h014001130000000000000001;
    
        ws_to_rf_bus=70'd0;
   #10
   reset =1'b0;
        #10 
        fs_to_ds_bus=96'h005101930000000000000002;
      #10
        fs_to_ds_bus=96'h00100a130000000000000003;
       
    end


endmodule