module AXI_Arbiter_W (
	/**********时钟&复位**********/
	input           ACLK,
	input      	    ARESETn,
	/********** 0号主控 **********/
    input                       s0_AWVALID,
    input                       s0_AWREADY,
    input                       s0_WVALID,
    input                       s0_WREADY,
    input                       s0_BVALID,
    input                       s0_BREADY,
	/********** 1号主控 **********/
    input                       s1_AWVALID,
    input                       s1_AWREADY,
    input                       s1_WVALID,
    input                       s1_WREADY,
    input                       s1_BVALID,
    input                       s1_BREADY,
	/********** 2号主控 **********/
    input                       s2_AWVALID,
    input                       s2_AWREADY,
    input                       s2_WVALID,
    input                       s2_WREADY,
    input                       s2_BVALID,
    input                       s2_BREADY,
	/********** 3号主控 **********/
    input                       s3_AWVALID,
    input                       s3_AWREADY,
    input                       s3_WVALID,
    input                       s3_WREADY,
    input                       s3_BVALID,
    input                       s3_BREADY,
    
    output reg                  s0_wgrnt,
	output reg	                s1_wgrnt,
    output reg                  s2_wgrnt,
    output reg                  s3_wgrnt
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
            if(s0_AWVALID&&s0_AWREADY) begin
                next_state = AXI_MASTER_0;
            end
            else if(s0_WVALID||s0_WREADY) begin
                next_state = AXI_MASTER_0;
            end
            else if(s0_BVALID&&s0_BREADY) begin
                next_state = AXI_MASTER_1;
            end
            else if(s1_AWVALID) begin
                next_state = AXI_MASTER_1;
            end
            else if(s2_AWVALID) begin
                next_state = AXI_MASTER_2;
            end
            else if(s3_AWVALID) begin
                next_state = AXI_MASTER_3;
            end
            else begin
                next_state = AXI_MASTER_0;
            end
        end
        AXI_MASTER_1: begin
            if(s1_AWVALID&&s1_AWREADY)  begin
                next_state = AXI_MASTER_1;
            end
            else if(s1_WVALID||s1_WREADY) begin
                next_state = AXI_MASTER_1;
            end
            else if(s1_BVALID&&s1_BREADY) begin
                next_state = AXI_MASTER_2;
            end
            else if(s2_AWVALID) begin
                next_state = AXI_MASTER_2;
            end
            else if(s3_AWVALID) begin
                next_state = AXI_MASTER_3;
            end
            else if(s0_AWVALID) begin
                next_state = AXI_MASTER_0;
            end
            else begin
                next_state = AXI_MASTER_1;
            end
        end
        AXI_MASTER_2: begin
            if(s2_AWVALID&&s2_AWREADY) begin
                next_state = AXI_MASTER_2;
            end
            else if(s2_WVALID||s2_WREADY) begin
                next_state = AXI_MASTER_2;
            end
            else if(s2_BVALID&&s2_BREADY) begin
                next_state = AXI_MASTER_3;
            end
            else if(s3_AWVALID) begin
                next_state = AXI_MASTER_3;
            end
            else if(s0_AWVALID) begin
                next_state = AXI_MASTER_0;
            end
            else if(s1_AWVALID) begin
                next_state = AXI_MASTER_1;
            end
            else begin
                next_state = AXI_MASTER_2;
            end
        end
        AXI_MASTER_3: begin
            if(s3_AWVALID&&s3_AWREADY) begin
                next_state = AXI_MASTER_3;
            end
            else if(s3_WVALID||s3_WREADY) begin
                next_state = AXI_MASTER_3;
            end
            else if(s3_BVALID&&s3_BREADY) begin
                next_state = AXI_MASTER_0;
            end
            else if(s0_AWVALID) begin
                next_state = AXI_MASTER_0;
            end
            else if(s1_AWVALID) begin
                next_state = AXI_MASTER_1;
            end
            else if(s2_AWVALID) begin
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

//利用状态寄存器输出控制结果
always @(*) begin
    case (state)
        AXI_MASTER_0: {s0_wgrnt,s1_wgrnt,s2_wgrnt,s3_wgrnt} = 4'b1000;
        AXI_MASTER_1: {s0_wgrnt,s1_wgrnt,s2_wgrnt,s3_wgrnt} = 4'b0100;
        AXI_MASTER_2: {s0_wgrnt,s1_wgrnt,s2_wgrnt,s3_wgrnt} = 4'b0010;
        AXI_MASTER_3: {s0_wgrnt,s1_wgrnt,s2_wgrnt,s3_wgrnt} = 4'b0001;
        default:      {s0_wgrnt,s1_wgrnt,s2_wgrnt,s3_wgrnt} = 4'b0000;
    endcase
end

endmodule