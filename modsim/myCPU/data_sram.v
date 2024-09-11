module data_sram(
    input                  clk          ,

    input          data_sram_en   ,
    input    data_sram_wen  ,//宽度是怎么确定的？
    input   [63:0] data_sram_addr ,//在实现的方案中读的是nextpc
    input   [63:0] data_sram_wdata,

    output  [63:0] data_sram_rdata
);
reg [63:0] ram [127:0];



// always @(posedge clk) begin
//     if (data_sram_wen ) {ram[data_sram_addr],ram[data_sram_addr1],ram[data_sram_addr2],ram[data_sram_addr3]}<= data_sram_wdata;
// end


// assign data_sram_rdata = (data_sram_en ==1'b0) ? 32'b0 : {ram[data_sram_addr],ram[data_sram_addr1],ram[data_sram_addr2],ram[data_sram_addr3]};

always @(posedge clk) begin
    if (data_sram_wen ) ram[data_sram_addr]<= data_sram_wdata;
end


assign data_sram_rdata = (data_sram_en ==1'b0) ? 64'b0 : ram[data_sram_addr];

//assign ram[0]=;
//assign ram[1]=;
//assign ram[64'd4194304]= 8'b10100101;



endmodule