module AXI_Arbiter_R (
	/**********时钟&复位**********/
	input                       ACLK,
	input      	                ARESETn,
	/********** 0号主控 **********/
    input                       s0_ARVALID,
    input                       s0_ARREADY,
    input                       s0_RVALID,
    input                       s0_RREADY,
    input                       s0_RLAST,
	/********** 1号主控 **********/
    input                       s1_ARVALID,
    input                       s1_ARREADY,
    input                       s1_RVALID,
    input                       s1_RREADY,
    input                       s1_RLAST,
	/********** 2号主控 **********/
    input                       s2_ARVALID,
    input                       s2_ARREADY,
    input                       s2_RVALID,
    input                       s2_RREADY,
    input                       s2_RLAST,
	/********** 3号主控 **********/
    input                       s3_ARVALID,
    input                       s3_ARREADY,
    input                       s3_RVALID,
    input                       s3_RREADY,
    input                       s3_RLAST,
	
    output reg                  s0_rgrnt,
	output reg	                s1_rgrnt,
    output reg                  s2_rgrnt,
    output reg                  s3_rgrnt
);

    localparam AXI_MASTER_0 = 2'b00;
    localparam AXI_MASTER_1 = 2'b01;
    localparam AXI_MASTER_2 = 2'b10;
    localparam AXI_MASTER_3 = 2'b11;

    reg state;
    reg next_state; 

//状态译码
always @(*) begin
    case (state)
        AXI_MASTER_0: begin
            if(s0_ARVALID&&s0_ARREADY) begin
                next_state = AXI_MASTER_0;
            end
            else if(s0_RVALID||s0_RREADY) begin
                next_state = AXI_MASTER_0;
            end
            else if(s0_RLAST&&s0_RVALID) begin
                next_state = AXI_MASTER_1;
            end
            else if(s1_ARVALID) begin
                next_state = AXI_MASTER_1;
            end
            else if(s2_ARVALID) begin
                next_state = AXI_MASTER_2;
            end
            else if(s3_ARVALID) begin
                next_state = AXI_MASTER_3;
            end
            else begin
                next_state = AXI_MASTER_0;
            end
        end
        AXI_MASTER_1: begin
            if(s1_ARVALID&&s1_ARREADY) begin
                next_state = AXI_MASTER_1;
            end
            else if(s1_RVALID||s1_RREADY) begin
                next_state = AXI_MASTER_1;
            end
            else if(s1_RLAST&&s1_RVALID) begin
                next_state = AXI_MASTER_2;
            end
            else if(s2_ARVALID) begin
                next_state = AXI_MASTER_2;
            end
            else if(s3_ARVALID) begin
                next_state = AXI_MASTER_3;
            end
            else if(s0_ARVALID) begin
                next_state = AXI_MASTER_0;
            end
            else begin
                next_state = AXI_MASTER_1;
            end
        end
        AXI_MASTER_2: begin
            if(s2_ARVALID&&s2_ARREADY) begin
                next_state = AXI_MASTER_2;
            end
            else if(s2_RVALID||s2_RREADY) begin
                next_state = AXI_MASTER_2;
            end
            else if(s2_RLAST&&s2_RVALID) begin
                next_state = AXI_MASTER_3;
            end
            else if(s3_ARVALID) begin
                next_state = AXI_MASTER_3;
            end
            else if(s0_ARVALID) begin
                next_state = AXI_MASTER_0;
            end
            else if(s1_ARVALID) begin
                next_state = AXI_MASTER_1;
            end
            else begin
                next_state = AXI_MASTER_2;
            end
        end
        AXI_MASTER_3: begin
            if(s3_ARVALID&&s3_ARREADY) begin
                next_state = AXI_MASTER_3;
            end
            else if(s3_RVALID||s3_RREADY) begin
                next_state = AXI_MASTER_3;
            end
            else if(s3_RLAST&&s3_RVALID) begin
                next_state = AXI_MASTER_0;
            end
            else if(s0_ARVALID) begin
                next_state = AXI_MASTER_0;
            end
            else if(s1_ARVALID) begin
                next_state = AXI_MASTER_1;
            end
            else if(s2_ARVALID) begin
                next_state = AXI_MASTER_2;
            end
            else begin
                next_state = AXI_MASTER_3;
            end
        end
        default: begin
            next_state = AXI_MASTER_0;
        end
    endcase
end

//更新状态寄存器
always @(posedge ACLK, negedge ARESETn)begin
    if(!ARESETn)
        state <= AXI_MASTER_0;
    else
        state <= next_state;
end

//输出控制结果
always @(*) begin
    case (state)
        AXI_MASTER_0: {s0_rgrnt,s1_rgrnt,s2_rgrnt,s3_rgrnt} = 4'b1000;
        AXI_MASTER_1: {s0_rgrnt,s1_rgrnt,s2_rgrnt,s3_rgrnt} = 4'b0100;
        AXI_MASTER_2: {s0_rgrnt,s1_rgrnt,s2_rgrnt,s3_rgrnt} = 4'b0010;
        AXI_MASTER_3: {s0_rgrnt,s1_rgrnt,s2_rgrnt,s3_rgrnt} = 4'b0001;
        default:      {s0_rgrnt,s1_rgrnt,s2_rgrnt,s3_rgrnt} = 4'b0000;
    endcase
end

endmodule