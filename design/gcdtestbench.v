`timescale 1ns/10ps

module gcdtestbench();

    reg  clock, rst, input_ava, r_t;
    reg  [15:0] in_A, in_B;

    wire [15:0] r_data;
    wire idle,r_rdy;

    gcdmodel U1( 
        .clk                    (clock),
        .reset                  (rst),
        .input_available        (input_ava),
        .result_taken           (r_t),
        .operand_A              (in_A),
        .operand_B              (in_B),

        .idle                   (idle),
        .result_rdy             (r_rdy),
        .result_data            (r_data)
        );

    initial begin
        clock = 1'b0;
        forever begin
            #5 clock = ~clock; //产生100MHz的时钟信号，周期10ns
        end
    end

    initial begin
        rst = 1'b0;
        in_A = 16'd0;
        in_B = 16'd0;
        input_ava = 1'b0;
        r_t = 1'b0;

        #10 rst =1'b1;

        #5 in_A=16'd15;
        #5 in_B=16'd27;

        #2 input_ava=1'd1;
        #10 input_ava=1'd0;
        #2 in_A=30;
        #10 input_ava=1'd1;
        #10 r_t =1'b1;
        #10 r_t=1'b0;

    end


endmodule