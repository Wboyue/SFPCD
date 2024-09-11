
`timescale 1ns/10ps

module tb_regfile();

reg clk,we;
reg [4:0] raddr1, raddr2, waddr;
reg [63:0] wdata;
wire [63:0] rdata1,rdata2;
    regfile U1( 
     .clk    (clk)       ,
    .raddr1      (raddr1)    ,
    .raddr2   (raddr2) ,
    .rdata1 (rdata1)    ,

   .rdata2 (rdata2),
    .we  (we)  ,

   .waddr   (waddr),
    .wdata  (wdata)  
        );

    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk; //产生100MHz的时钟信号，周期10ns
        end
    end

    initial begin
        
     raddr1=5'd0;
     raddr2=5'd2;
     waddr=5'd2;
     we=1'd1;
     wdata=64'd4;

     #10waddr=5'd4;
     wdata=64'd9;   

     #10waddr=5'd3;
     wdata=64'd11;

     #10
     raddr1=5'd3;
     raddr2=5'd4;
       
    end


endmodule