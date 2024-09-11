module gcdmodel#(parameter W = 16)
(
    clk,
    reset,
    input_available,
    result_taken,
    operand_A,
    operand_B,

    idle,
    result_rdy,
    result_data,
);

input [W-1 : 0] operand_A, operand_B;
input clk;
input reset;
input input_available;
input result_taken;

output [W-1 : 0] result_data;
output idle;
output result_rdy;



localparam WAIT = 2'd0,
           CALC = 2'd1,
           DONE = 2'd2;

localparam A_SEL_IN = 2'd0,
           A_SEL_B  = 2'd1,
           A_SEL_SUB = 2'd2,

           B_SEL_IN =1'b0,
           B_SEL_A  =1'b1;

reg [1: 0] state, state_next;

reg [W-1 : 0] A,B,A_next, B_next;
reg [W-1 : 0] result_data_next, result_data;
reg result_rdy_next, result_rdy;
reg [1:0] A_sel;
reg B_sel;
reg A_en, B_en;

reg B_zero;
reg A_lt_B;
reg idle_next, idle;


always @(*)
begin
    state_next = state;
    A_en = 1'b0;
    B_en = 1'b0;
    A_sel = A_SEL_IN;
    B_sel = B_SEL_IN;
    result_rdy_next = 1'b0;
    result_data_next = 'd0;
    idle_next = 1'b1;
    B_zero='d0;
    A_lt_B='d0;

    case (state)

        WAIT:begin
            if(input_available)begin
                state_next = CALC;
                idle_next = 1'b0;
                result_rdy_next = 1'b0;
                result_data_next = 'd0;
                A_en = 1'b1;
                B_en = 1'b1;
                A_sel = A_SEL_IN;
                B_sel = B_SEL_IN;
            end
            else
            begin 
                state_next = WAIT;
                idle_next = 1'b1;
                result_rdy_next = 1'b0;
                result_data_next = 'd0;
                A_en = 1'b0;
                B_en = 1'b0;
                A_sel = A_SEL_IN;
                B_sel = B_SEL_IN;
            end


        end

        CALC:begin

            if (A<B) begin
                A_en = 1'b1;
                A_sel = A_SEL_B;
                B_en = 1'b1;  
                B_sel = B_SEL_A;

                state_next = CALC;
                idle_next = 1'b0;
                result_rdy_next = 1'b0;
                result_data_next = 'd0;
            end 
            else if (B!='d0)begin
                A_sel = A_SEL_SUB;
                A_en = 1'b1;
                B_en = 1'b0;

                state_next = CALC;
                idle_next = 1'b0;
                result_rdy_next = 1'b0;
                result_data_next = 'd0;
            end
            else begin
                state_next = DONE;
                idle_next = 1'b0;
                result_rdy_next = 1'b1;
                result_data_next = A_next;
            end 

        end

        DONE:begin
            A_en=1'b0;
            B_en=1'b0;
            if(result_taken)begin
                state_next = WAIT;
                idle_next = 1'b1;
                result_rdy_next = 1'b0;
                result_data_next = 'd5;
                idle_next = 1'b1;
            end
            else
            begin
                state_next = DONE;
                result_rdy_next = 1'b1;
                result_data_next = A_next;
                idle_next = 1'b0;
            end
        end
        
        default: begin
            
        end
    endcase
end

always @(*)
begin

    A_next = A;
    B_next = B;

    if(A_en) begin
        if(A_sel==A_SEL_IN)
            A_next =  operand_A;
        else if (A_sel == A_SEL_B) 
            A_next =  B;
        else if(A_sel==A_SEL_SUB)
            A_next = A-B;
    end
    else
        A_next = A;

    if(B_en)begin
        if(B_sel==B_SEL_IN)
            B_next =  operand_B;
        else if (B_sel == B_SEL_A) 
            B_next =  A;
    end
    else
        B_next = B;

end

always @(posedge clk or negedge reset)
begin
    if (!reset)begin
        state <= WAIT;
        result_rdy <= 1'b0;
        result_data <= 'd0;
        idle <= 1'b1;

        A <='d0;
        B<='d0;
    end
    else begin
        state <= state_next;
        result_rdy <= result_rdy_next;
        result_data <= result_data_next;
        idle <= idle_next;

        A<=A_next;
        B<=B_next;
      
    end
end
endmodule