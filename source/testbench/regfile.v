module regfile(
    input         clk,
    // READ PORT 1
    input  [ 4:0] raddr1,//共32个64位寄存器
    output [63:0] rdata1,
    // READ PORT 2
    input  [ 4:0] raddr2,
    output [63:0] rdata2,
    // WRITE PORT
    input         we,       //write enable, HIGH valid
    input  [ 4:0] waddr,
    input  [63:0] wdata
);
reg [63:0] rf[31:0];

//WRITE
always @(posedge clk) begin
    if (we) rf[waddr]<= wdata;
end

//READ OUT 1
assign rdata1 = (raddr1==5'b0) ? 64'b0 : rf[raddr1];

//READ OUT 2
assign rdata2 = (raddr2==5'b0) ? 64'b0 : rf[raddr2];

endmodule