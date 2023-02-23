module AXI_Slave_Mux_R#(
    parameter   DATA_WIDTH  = 1024,
                ADDR_WIDTH  = 64,
                ID_WIDTH    = 8,
                USER_WIDTH  = 8
)(
	/********* 时钟&复位 *********/
	input                       ACLK,
	input      	                ARESETn,
    /********** 0号从机 **********/
    //读地址通道
    output reg                  s0_ARVALID,
	input	  		            s0_ARREADY,
    //读数据通道
	input	   [ID_WIDTH-1:0]   s0_RID,
	input	   [DATA_WIDTH-1:0] s0_RDATA,
	input	   [1:0]	        s0_RRESP,
	input	  		            s0_RLAST,
	input	   [USER_WIDTH-1:0]	s0_RUSER,
	input	 		            s0_RVALID, 
    output reg                  s0_RREADY, 
    /********** 1号从机 **********/
    //读地址通道
    output reg                  s1_ARVALID,
	input	  		            s1_ARREADY,
    //读数据通道
	input	   [ID_WIDTH-1:0]   s1_RID,
	input	   [DATA_WIDTH-1:0] s1_RDATA,
	input	   [1:0]	        s1_RRESP,
	input	  		            s1_RLAST,
	input	   [USER_WIDTH-1:0]	s1_RUSER,
	input	 		            s1_RVALID,
    output reg                  s1_RREADY,
    /******** 主控通用信号 ********/
    //读地址通道
	output reg	  		        m_ARREADY,
    //读数据通道
	output reg [ID_WIDTH-1:0]   m_RID,
	output reg [DATA_WIDTH-1:0] m_RDATA,
	output reg [1:0]	        m_RRESP,
	output reg		            m_RLAST,
	output reg [USER_WIDTH-1:0]	m_RUSER,
	output reg	                m_RVALID, 
    /******** 从机通用信号 ********/
    //写地址通道
    input     [ADDR_WIDTH-1:0]	s_ARADDR,
    input                       s_ARVALID,
    //写数据通道
    input                       s_RREADY  
);

    reg[63:0]    araddr;     //读地址寄存器

    always @(posedge ACLK, negedge ARESETn)begin
        if(!ARESETn)
            araddr <= 0;
        else if(s_ARVALID)                  //读地址握手信号启动时寄存写地址
            araddr <= s_ARADDR;
        else
            araddr <= araddr;
    end

    //---------------------------------------------------------
    always @(*) begin
        case(araddr[31])
            1'b0: begin
                m_ARREADY   = s0_ARREADY;
                m_RID       = s0_RID;
                m_RDATA     = s0_RDATA;
                m_RRESP     = s0_RRESP;
                m_RLAST     = s0_RLAST;
                m_RUSER     = s0_RUSER;
                m_RVALID    = s0_RVALID;
            end
            1'b1: begin
                m_ARREADY   = s1_ARREADY;
                m_RID       = s1_RID;
                m_RDATA     = s1_RDATA;
                m_RRESP     = s1_RRESP;
                m_RLAST     = s1_RLAST;
                m_RUSER     = s1_RUSER;
                m_RVALID    = s1_RVALID;
            end
            default: begin
                m_ARREADY   = 0;
                m_RID       = 0;
                m_RDATA     = 0;
                m_RRESP     = 0;
                m_RLAST     = 0;
                m_RUSER     = 0;
                m_RVALID    = 0;
            end
        endcase
    end

    //---------------------------------------------------------
    always @(*) begin
        case(araddr[31])
            1'b0: begin
                s0_ARVALID  = s_ARVALID;
                s1_ARVALID  = 0;
            end
            1'b1: begin
                s0_ARVALID  = 0;
                s1_ARVALID  = s_ARVALID;
            end
            default: begin
                s0_ARVALID  = 0;
                s1_ARVALID  = 0;
            end
        endcase
    end

    //---------------------------------------------------------
    always @(*) begin
        case(araddr[31])
            1'b0: begin
                s0_RREADY  = s_RREADY;
                s1_RREADY  = 0;
            end
            1'b1: begin
                s0_RREADY  = 0;
                s1_RREADY  = s_RREADY;
            end
            default: begin
                s0_RREADY  = 0;
                s1_RREADY  = 0;
            end
        endcase
    end

endmodule