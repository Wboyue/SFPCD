module inst_sram(
    input                  clk          ,

    input          inst_sram_en   ,
    input    inst_sram_wen  ,
    input   [63:0] inst_sram_addr ,
    input   [31:0] inst_sram_wdata,
     input [63:0] inst_sram_waddr,
    output  [31:0] inst_sram_rdata
);
reg [31:0] ram [127:0];

reg [31:0] inst_rdata;

// always @(posedge clk) begin
//     if (inst_sram_wen ) {ram[inst_sram_addr],ram[inst_sram_addr1],ram[inst_sram_addr2],ram[inst_sram_addr3]}<= inst_sram_wdata;
// end


// assign inst_sram_rdata = (inst_sram_en ==1'b0) ? 32'b0 : {ram[inst_sram_addr],ram[inst_sram_addr1],ram[inst_sram_addr2],ram[inst_sram_addr3]};

always @(posedge clk) begin
    if (inst_sram_wen ) ram[inst_sram_waddr]<= inst_sram_wdata;

    if (inst_sram_en ) begin
        inst_rdata<= ram[inst_sram_addr];
    end
        else begin 
            inst_rdata <=32'd0;
        end
end


//assign inst_sram_rdata = (inst_sram_en ==1'b0) ? 32'b0 : ram[inst_sram_addr];
assign inst_sram_rdata = inst_rdata;
//assign ram[0]=;
//assign ram[1]=;
//assign ram[64'd4194304]= 8'b10100101;



endmodule