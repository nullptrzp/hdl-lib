module AXI_Arbiter_R (
	/**********时钟&复位**********/
	input                       ACLK,
	input      	                ARESETn,
	/********** 0号主控 **********/
    input                       m0_ARVALID,
    input                       m0_RREADY,
	/********** 1号主控 **********/
    input                       m1_ARVALID,
    input                       m1_RREADY,
	/********** 2号主控 **********/
    input                       m2_ARVALID,
    input                       m2_RREADY,
	/********** 3号主控 **********/
    input                       m3_ARVALID,
    input                       m3_RREADY,
    /******* 主控通用信号 ********/

    input                       m_RVALID,
    input                       m_RLAST,
	
    output reg                  m0_rgrnt,
	output reg	                m1_rgrnt,
    output reg                  m2_rgrnt,
    output reg                  m3_rgrnt
);

    localparam AXI_MASTER_0 = 2'b00;
    localparam AXI_MASTER_1 = 2'b01;
    localparam AXI_MASTER_2 = 2'b10;
    localparam AXI_MASTER_3 = 2'b11;

    reg state;
    reg next_state; 

    //---------------------------------------------------------
    //状态译码
    always @(*) begin
        case (state)
            AXI_MASTER_0: begin                 //0号主机占用总线状态，响应请求优先级为：0>1>2>3
                if(m0_ARVALID)                  //如果0号主机请求总线
                    next_state = AXI_MASTER_0;  //保持0号主机占用总线状态
                else if(m_RVALID||m0_RREADY)    //如果还在写入数据
                    next_state = AXI_MASTER_0;  //保持0号主机占用总线状态
                else if(m_RLAST&&m_RVALID)      //读取完成
                    next_state = AXI_MASTER_1;  //更换优先级
                else if(m1_ARVALID)             //如果1号主机请求总线
                    next_state = AXI_MASTER_1;  //下一状态为1号主机占用总线
                else if(m2_ARVALID)             //如果2号主机请求总线
                    next_state = AXI_MASTER_2;  //下一状态为2号主机占用总线
                else if(m3_ARVALID)             //如果3号主机请求总线
                    next_state = AXI_MASTER_3;  //下一状态为3号主机占用总线
                else                            //都未请求总线
                    next_state = AXI_MASTER_0;  //保持0号主机占用总线状态
            end
            AXI_MASTER_1: begin                 //1号主机占用总线状态，响应请求优先级为：1>2>3>0
                if(m1_ARVALID)
                    next_state = AXI_MASTER_1;
                else if(m_RVALID||m1_RREADY)
                    next_state = AXI_MASTER_1;
                else if(m_RLAST&&m_RVALID)
                    next_state = AXI_MASTER_2;
                else if(m2_ARVALID)
                    next_state = AXI_MASTER_2;
                else if(m3_ARVALID)
                    next_state = AXI_MASTER_3;
                else if(m0_ARVALID)
                    next_state = AXI_MASTER_0;
                else
                    next_state = AXI_MASTER_1;
            end
            AXI_MASTER_2: begin                 //2号主机占用总线状态，响应请求优先级为：2>3>0>1
                if(m2_ARVALID)
                    next_state = AXI_MASTER_2;
                else if(m_RVALID||m2_RREADY)
                    next_state = AXI_MASTER_2;
                else if(m_RLAST&&m_RVALID)
                    next_state = AXI_MASTER_3;
                else if(m3_ARVALID)
                    next_state = AXI_MASTER_3;
                else if(m0_ARVALID)
                    next_state = AXI_MASTER_0;
                else if(m1_ARVALID)
                    next_state = AXI_MASTER_1;
                else
                    next_state = AXI_MASTER_2;
            end
            AXI_MASTER_3: begin                 //3号主机占用总线状态，响应请求优先级为：3>0>1>2
                if(m3_ARVALID)
                    next_state = AXI_MASTER_3;  
                else if(m_RVALID||m3_RREADY)
                    next_state = AXI_MASTER_3;
                else if(m_RLAST&&m_RVALID)
                    next_state = AXI_MASTER_0;
                else if(m0_ARVALID)
                    next_state = AXI_MASTER_0;
                else if(m1_ARVALID)
                    next_state = AXI_MASTER_1;
                else if(m2_ARVALID)
                    next_state = AXI_MASTER_2;
                else
                    next_state = AXI_MASTER_3;
            end
            default:
                next_state = AXI_MASTER_0;      //默认状态为0号主机占用总线
        endcase
    end


    //---------------------------------------------------------
    //更新状态寄存器
    always @(posedge ACLK, negedge ARESETn)begin
        if(!ARESETn)
            state <= AXI_MASTER_0;         //默认状态为0号主机占用总线
        else
            state <= next_state;
    end

    //---------------------------------------------------------
    //利用状态寄存器输出控制结果
    always @(*) begin
        case (state)
            AXI_MASTER_0: {m0_rgrnt,m1_rgrnt,m2_rgrnt,m3_rgrnt} = 4'b1000;
            AXI_MASTER_1: {m0_rgrnt,m1_rgrnt,m2_rgrnt,m3_rgrnt} = 4'b0100;
            AXI_MASTER_2: {m0_rgrnt,m1_rgrnt,m2_rgrnt,m3_rgrnt} = 4'b0010;
            AXI_MASTER_3: {m0_rgrnt,m1_rgrnt,m2_rgrnt,m3_rgrnt} = 4'b0001;
            default:      {m0_rgrnt,m1_rgrnt,m2_rgrnt,m3_rgrnt} = 4'b0000;
        endcase
    end




endmodule