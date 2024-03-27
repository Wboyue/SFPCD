
`timescale 1ns/10ps

module tb_data_sram();

    reg  clock, data_sram_en ;
    reg  data_sram_wen;
    reg  [63:0] data_sram_addr;
    reg [63:0] data_sram_wdata;

    wire [63:0] data_sram_rdata;


    data_sram U1( 
        .clk                    (clock),
       

        .data_sram_en            (data_sram_en),
        .data_sram_wen        (data_sram_wen),
        .data_sram_addr       (data_sram_addr),
        .data_sram_wdata      (data_sram_wdata),
        .data_sram_rdata      (data_sram_rdata)
        );

    initial begin
        clock = 1'b0;
        forever begin
            #5 clock = ~clock; //产生100MHz的时钟信号，周期10ns
        end
    end

    initial begin

        data_sram_wen=1'd1;
        data_sram_en=1'd0;
        data_sram_addr = 64'd2;
        data_sram_wdata = 64'd22;

        #10 data_sram_addr = 64'd8;
             data_sram_wdata = 64'd23;

         #10 data_sram_wen=1'd0;
             data_sram_en=1'd1;
             data_sram_addr = 64'd2;
         #10 data_sram_addr = 64'd8;


    end


endmodule