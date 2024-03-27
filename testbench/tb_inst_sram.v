
`timescale 1ns/10ps

module tb_inst_sram();

    reg  clock, inst_sram_en ;
    reg  inst_sram_wen;
    reg  [63:0] inst_sram_addr,inst_sram_waddr;
    reg [31:0] inst_sram_wdata;

    wire [31:0] inst_sram_rdata;


    inst_sram U1( 
        .clk                    (clock),
       

        .inst_sram_en            (inst_sram_en),
        .inst_sram_wen        (inst_sram_wen),
        .inst_sram_addr       (inst_sram_addr),
        .inst_sram_wdata      (inst_sram_wdata),
        .inst_sram_rdata      (inst_sram_rdata),
        .inst_sram_waddr       (inst_sram_waddr)
        );

    initial begin
        clock = 1'b0;
        forever begin
            #5 clock = ~clock; //产生100MHz的时钟信号，周期10ns
        end
    end

    initial begin

   
        inst_sram_en=1'd0;
        inst_sram_wen=1'd1;
  //向指令ram中写入机器码程序,每个时钟周期写入一条指令


        inst_sram_waddr = 64'd1;
        //addi x2, x0, 20  --> x2=20
        inst_sram_wdata = 32'd000000010100_00000_000_00010_0010011;

        #10   //addi x3, x2, 5 --> x3=x2+5  =25    
        inst_sram_waddr = 64'd2;
        inst_sram_wdata = 32'd000000000101_00010_000_00011_0010011;

        #10    //addi x20, x0, 1 --> x20 =1     ,x20放基址
        inst_sram_waddr = 64'd3;
        inst_sram_wdata = 32'd000000000001_00000_000_10100_0010011;

        #10     //sd x3, 1(x20) --> dsram[1+1]=x3 =25  
        inst_sram_waddr = 64'd4;
        inst_sram_wdata = 32'd0000000_00011_10100_011_00001_0100011;





        #10 inst_sram_wen=1'd0;
             inst_sram_en=1'd1;

             inst_sram_addr = 64'd1;
         #10 inst_sram_addr = 64'd2;
         #10 inst_sram_addr = 64'd3;
        #10 inst_sram_addr = 64'd4;
    end


endmodule