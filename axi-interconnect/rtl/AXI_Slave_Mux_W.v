module AXI_Slave_Mux_W#(
    parameter   DATA_WIDTH  = 1024,
                ADDR_WIDTH  = 64,
                ID_WIDTH    = 8,
                USER_WIDTH  = 8
)(
	/********* 时钟&复位 *********/
	input                       ACLK,
	input      	                ARESETn,
    /********** 0号从机 **********/
    //写地址通道
    output reg                  s0_AWVALID,
    input	   	                s0_AWREADY,
    //写数据通道
    output reg                  s0_WVALID,
    input	  		            s0_WREADY,
    //写响应通道
	input	   [ID_WIDTH-1:0]	s0_BID,
	input	   [1:0]	        s0_BRESP,
	input	   [USER_WIDTH-1:0] s0_BUSER,
	input	     		        s0_BVALID,
    output reg                  s0_BREADY,
    /********** 1号从机 **********/
    //写地址通道
    output reg                  s1_AWVALID,
    input	   	                s1_AWREADY,
    //写数据通道
    output reg                  s1_WVALID,
    input	  		            s1_WREADY,
    //写响应通道
	input	   [ID_WIDTH-1:0]	s1_BID,
	input	   [1:0]	        s1_BRESP,
	input	   [USER_WIDTH-1:0] s1_BUSER,
	input	     		        s1_BVALID,
    output reg                  s1_BREADY,

    /******** 主控通用信号 ********/
    //写地址通道
    output reg 	                m_AWREADY,
    //写数据通道
    output reg		            m_WREADY,
    //写响应通道
	output reg [ID_WIDTH-1:0]	m_BID,
	output reg [1:0]	        m_BRESP,
	output reg [USER_WIDTH-1:0] m_BUSER,
	output reg   		        m_BVALID,
    /******** 从机通用信号 ********/
    //写地址通道
    input     [ADDR_WIDTH-1:0]	s_AWADDR,
    input                       s_AWVALID,
    //写数据通道
    input                       s_WVALID,
    //写响应通道
    input                       s_BREADY    
);

    reg[63:0]    awaddr;     //写地址寄存器

    always @(posedge ACLK, negedge ARESETn)begin
        if(!ARESETn)
            awaddr <= 0;
        else if(s_AWVALID)                  //写地址握手信号启动时寄存写地址
            awaddr <= s_AWADDR;
        else
            awaddr <= awaddr;
    end

    //---------------------------------------------------------
    always @(*) begin
        case(awaddr[31])
            1'b0: begin
                m_AWREADY   = s0_AWREADY;
                m_WREADY    = s0_WREADY;
                m_BID       = s0_BID;
                m_BRESP     = s0_BRESP;
                m_BUSER     = s0_BUSER;
                m_BVALID    = s0_BVALID;
            end
            1'b1: begin
                m_AWREADY   = s1_AWREADY;
                m_WREADY    = s1_WREADY;
                m_BID       = s1_BID;
                m_BRESP     = s1_BRESP;
                m_BUSER     = s1_BUSER;
                m_BVALID    = s1_BVALID;
            end
            default: begin
                m_AWREADY   = 0;
                m_WREADY    = 0;
                m_BID       = 0;
                m_BRESP     = 0;
                m_BUSER     = 0;
                m_BVALID    = 0;
            end
        endcase
    end

    //---------------------------------------------------------
    always @(*) begin
        case(awaddr[31])
            1'b0:begin
                s0_AWVALID  = s_AWVALID;
                s1_AWVALID  = 0;
            end
            1'b1:begin
                s0_AWVALID  = 0;
                s1_AWVALID  = s_AWVALID;
            end
            default: begin
                s0_AWVALID  = 0;
                s1_AWVALID  = 0;
            end
        endcase
    end

    //---------------------------------------------------------
    always @(*) begin
        case(awaddr[31])
            1'b0:begin
                s0_BREADY  = s_BREADY;
                s1_BREADY  = 0;
            end
            1'b1:begin
                s0_BREADY  = 0;
                s1_BREADY  = s_BREADY;
            end
            default: begin
                s0_BREADY  = 0;
                s1_BREADY  = 0;
            end
        endcase
    end

    //---------------------------------------------------------
    always @(*) begin
        case(awaddr[31])
            1'b0:begin
                s0_WVALID  = s_WVALID;
                s1_WVALID  = 0;
            end
            1'b1:begin
                s0_WVALID  = 0;
                s1_WVALID  = s_WVALID;
            end
            default: begin
                s0_WVALID  = 0;
                s1_WVALID  = 0;
            end
        endcase
    end


endmodule