
`timescale 1ns/10ps

module tb_mycpu_top();

    reg  clock, rst ,inst_sram_en_toif,inst_sram_wen;
    reg   [31:0] inst_sram_wdata;
    wire [3:0] debug_wb_rf_wen;
    wire [4:0] debug_wb_rf_wnum;
    wire [63:0] debug_wb_pc, debug_wb_rf_wdata;
    reg [63:0] inst_sram_waddr;
wire [31:0]debug_if_inst;
    // //if debug
    // wire  [31:0]  debug_if_inst;
    // wire  [63:0]  debug_nextpc;

    // //id debug
    //     wire debug_load_op;
    // wire  [11:0]  debug_alu_op;

    
// //
// wire [63:0] debug_rs1 ;
// wire [63:0] debug_rs2;
// wire [63:0] debug_es_pc;
// wire [4:0]  debug_es_dest;
// wire [63:0] debug_es_alu_result;


// //mem_debug

//    wire [4:0] debug_ms_dest;
//    wire [63:0] debug_ms_final_result;
//    wire [63:0] debug_ms_pc;
//    wire [63:0] debug_imm;

    mycpu_top U1( 
        .clk                    (clock),
        .reset                (rst),


        .debug_wb_pc            (debug_wb_pc),
        .debug_wb_rf_wen        (debug_wb_rf_wen),
        .debug_wb_rf_wnum       (debug_wb_rf_wnum),
        .debug_wb_rf_wdata      (debug_wb_rf_wdata),

        .inst_sram_wen          (inst_sram_wen),
        .inst_sram_en_toif      (inst_sram_en_toif),
        .inst_sram_wdata        (inst_sram_wdata),
        .inst_sram_waddr        (inst_sram_waddr),

  .debug_if_inst (debug_if_inst)
//     //if debug
//     .debug_if_inst  (debug_if_inst),
//     .debug_nextpc  (debug_nextpc),

//     //id debug
//     .debug_load_op (debug_load_op),
//    .debug_alu_op (debug_alu_op), 

    
// //
// .debug_rs1  (debug_rs1),
// .debug_rs2 (debug_rs2),
// .debug_es_pc  (debug_es_pc),
// .debug_es_dest (debug_es_dest),
// .debug_es_alu_result (debug_es_alu_result),



// //mem_debug

//   .debug_ms_dest (debug_ms_dest),
//    .debug_ms_final_result  (debug_ms_final_result),
//   .debug_ms_pc  (debug_ms_pc),
// .debug_imm (debug_imm)

        
        );

    initial begin
        clock = 1'b0;
        forever begin
            #2.5 clock = ~clock; //产生100MHz的时钟信号，周期10ns
        end
    end

    initial begin
        rst = 1'b1;
       
        //向指令ram中写入机器码程序,每个时钟周期写入一条指令
        inst_sram_wen=1'd1;
        inst_sram_en_toif=1'd0;
       
        inst_sram_waddr = 64'd1;
        //addi x2, x0, 20  --> x2=20
        inst_sram_wdata = 32'b000000010100_00000_000_00010_0010011;
                #5    //addi x20, x0, 1 --> x20 =1     ,x20放基址
        inst_sram_waddr = 64'd2;
        inst_sram_wdata = 32'b000000000001_00000_000_10100_0010011;


        #5    //addi x20, x0, 1 --> x20 =1     ,x20放基址
        inst_sram_waddr = 64'd3;
        inst_sram_wdata = 32'b000000000001_00000_000_10100_0010011;

        #5    //addi x20, x0, 1 --> x20 =1     ,x20放基址
        inst_sram_waddr = 64'd4;
        inst_sram_wdata = 32'b000000000001_00000_000_10100_0010011;

        #5   //addi x3, x2, 5 --> x3=x2+5  =25    
        inst_sram_waddr = 64'd5;
        inst_sram_wdata = 32'b000000000101_00010_000_00011_0010011;

        // #10     //sd x3, 1(x20) --> dsram[1+1]=x3 =25  
        // inst_sram_waddr = 64'd4;
        // inst_sram_wdata = 32'b0000000_00011_10100_011_00001_0100011;

        // #10     //ld x4, 1(x20) --> x4=dsram[1+1]   =25
        // inst_sram_waddr = 64'd5;
        // inst_sram_wdata = 32'd;

        // #10     //add x6, x4 , x3 --> x6=x4+x3 =25+20=45
        // inst_sram_waddr = 64'd6;
        // inst_sram_wdata = 32'h;

        // #10     //sub x7, x4 , x3 --> x7=x4-x3 =25-20=5
        // inst_sram_waddr = 64'd7;
        // inst_sram_wdata = 32'h;

        // #10     //sd x6, 2(x20) --> dsram[1+2]=x6 =45  
        // inst_sram_waddr = 64'd8;
        // inst_sram_wdata = 32'h;

        // #10     //sd x7, 3(x20) --> dsram[1+3]=x7 =5  
        // inst_sram_waddr = 64'd9;
        // inst_sram_wdata = 32'h;


        #10 //完成向inst——sram写指令
        rst =1'b0;
        inst_sram_wen=1'd0;
        inst_sram_en_toif=1'd1;



    end


endmodule