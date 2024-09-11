
`timescale 1ns/100ps

module tb_alu();
reg [11:0] alu_op;
reg [63:0] alu_src1,alu_src2;
wire [63:0] alu_result;
    alu U1( 
        .alu_op (alu_op),
        .alu_src1 (alu_src1),
        .alu_src2 (alu_src2),
        .alu_result (alu_result)
        );

    initial begin
      alu_op=12'd1;
      alu_src1=64'd288;
      alu_src2=64'd77;
#5
      alu_op=12'd1;
      alu_src1=64'd288;
      alu_src2=-64'd77;
#5
      alu_op=12'd2;
      alu_src1=64'd288;
      alu_src2=64'd77;
#5
      alu_op=12'd2;
      alu_src1=64'd288;
      alu_src2=-64'd77;
#5
      alu_op=12'd4;
      alu_src1=64'd288;
      alu_src2=-64'd300;

 #5
      alu_op=12'd8;
      alu_src1=64'd288;
      alu_src2=-64'd1;    

#5
      alu_op=12'd16;
      alu_src1=64'd1;
      alu_src2=64'd77;

#5
      alu_op=12'd32;
      alu_src1=64'd288;
      alu_src2=64'd77;
      #5
      alu_op=12'd64;
      alu_src1=64'd288;
      alu_src2=64'd77;
      #5
      alu_op=12'd128;
      alu_src1=64'd288;
      alu_src2=64'd2;
      #5
      alu_op=12'd256;
      alu_src1=64'd2;
      alu_src2=64'd288;

            #5
      alu_op=12'd512;
      alu_src1=64'd6;
      alu_src2=-64'd288;
            #5
      alu_op=12'd1024;
      alu_src1=64'd6;
      alu_src2=-64'd288;

            #5
      alu_op=12'd2048;
      alu_src1=64'd6;
      alu_src2=64'd288;


    end


endmodule