`timescale 1ns/1ns

module AXI_Slave_Mux_W#(
    parameter   DATA_WIDTH  = 1024,
                ADDR_WIDTH  = 64,
                ID_WIDTH    = 8,
                USER_WIDTH  = 8,
                STRB_WIDTH = DATA_WIDTH/8
)(
    /********** 0号从机 **********/
    //写地址通道
    output reg                  m0_AWVALID,
    input	   	                m0_AWREADY,
    output reg[ID_WIDTH-1:0]    m0_AWID,
    output reg[ADDR_WIDTH-1:0]	m0_AWADDR,
    output reg[7:0]             m0_AWLEN,
    output reg[2:0]             m0_AWSIZE,
    output reg[1:0]             m0_AWBURST,
    output reg                  m0_AWLOCK,
    output reg[3:0]             m0_AWCACHE,
    output reg[2:0]             m0_AWPROT,
    output reg[3:0]             m0_AWQOS,
    output reg[3:0]             m0_AWREGION,
    output reg[USER_WIDTH-1:0]  m0_AWUSER,  
    //写数据通道
    output reg                  m0_WVALID,
    input	  		            m0_WREADY,
    //output     [ID_WIDTH-1:0]   m0_WID,
    output reg[DATA_WIDTH-1:0]  m0_WDATA,
    output reg[STRB_WIDTH-1:0]  m0_WSTRB,
    output reg                  m0_WLAST,
    output reg[USER_WIDTH-1:0]  m0_WUSER,
    //写响应通道
	input[ID_WIDTH-1:0]	        m0_BID,
	input[1:0]	                m0_BRESP,
	input[USER_WIDTH-1:0]       m0_BUSER,
	input	     		        m0_BVALID,
    output reg                  m0_BREADY,
    /********** 1号从机 **********/
    //写地址通道
    output reg                  m1_AWVALID,
    input	   	                m1_AWREADY,
    output reg[ID_WIDTH-1:0]    m1_AWID,
    output reg[ADDR_WIDTH-1:0]	m1_AWADDR,
    output reg[7:0]             m1_AWLEN,
    output reg[2:0]             m1_AWSIZE,
    output reg[1:0]             m1_AWBURST,
    output reg                  m1_AWLOCK,
    output reg[3:0]             m1_AWCACHE,
    output reg[2:0]             m1_AWPROT,
    output reg[3:0]             m1_AWQOS,
    output reg[3:0]             m1_AWREGION,
    output reg[USER_WIDTH-1:0]  m1_AWUSER, 
    //写数据通道
    output reg                  m1_WVALID,
    input	  		            m1_WREADY,
    //output     [ID_WIDTH-1:0]   m1_WID,
    output reg[DATA_WIDTH-1:0]  m1_WDATA,
    output reg[STRB_WIDTH-1:0]  m1_WSTRB,
    output reg                  m1_WLAST,
    output reg[USER_WIDTH-1:0]  m1_WUSER,
    //写响应通道
	input[ID_WIDTH-1:0]	        m1_BID,
	input[1:0]	                m1_BRESP,
	input[USER_WIDTH-1:0]       m1_BUSER,
	input	     		        m1_BVALID,
    output reg                  m1_BREADY,

    input[ID_WIDTH-1:0]         s2m_AWID,
    input[ADDR_WIDTH-1:0]	    s2m_AWADDR,
    input[7:0]                  s2m_AWLEN,
    input[2:0]                  s2m_AWSIZE,
    input[1:0]                  s2m_AWBURST,
    input                       s2m_AWLOCK,
    input[3:0]                  s2m_AWCACHE,
    input[2:0]                  s2m_AWPROT,
    input[3:0]                  s2m_AWQOS,
    input[3:0]                  s2m_AWREGION,
    input[USER_WIDTH-1:0]       s2m_AWUSER,
    input                       s2m_AWVALID,
    output reg                  s2m_AWREADY,
    //写数据通道
    //input reg [ID_WIDTH-1:0]   s2m_WID,
    input[DATA_WIDTH-1:0]       s2m_WDATA,
    input[STRB_WIDTH-1:0]       s2m_WSTRB,
    input                       s2m_WLAST,
    input[USER_WIDTH-1:0]       s2m_WUSER,
    input                       s2m_WVALID,
    output reg                  s2m_WREADY,
    //写响应通道
    input                       s2m_BREADY,
    output reg                  s2m_BVALID,
    output reg[ID_WIDTH-1:0]	s2m_BID,
	output reg[1:0]	            s2m_BRESP,
	output reg[USER_WIDTH-1:0]  s2m_BUSER
);

always @(*) begin
    case(s2m_AWADDR[31])
        1'b0: begin
            m0_AWVALID  = s2m_AWVALID;
            m0_AWID     = s2m_AWID;
            m0_AWADDR   = s2m_AWADDR;
            m0_AWLEN    = s2m_AWLEN;
            m0_AWSIZE   = s2m_AWSIZE;
            m0_AWBURST  = s2m_AWBURST;
            m0_AWLOCK   = s2m_AWLOCK;
            m0_AWCACHE  = s2m_AWCACHE;
            m0_AWPROT   = s2m_AWPROT;
            m0_AWQOS    = s2m_AWQOS;
            m0_AWREGION = s2m_AWREGION;
            m0_AWUSER   = s2m_AWUSER;
            m0_WVALID   = s2m_WVALID;
            m0_WDATA    = s2m_WDATA;
            m0_WSTRB    = s2m_WSTRB;
            m0_WLAST    = s2m_WLAST;
            m0_WUSER    = s2m_WUSER;
            m0_BREADY   = s2m_BREADY;
        end
        1'b1: begin
            m1_AWVALID  = s2m_AWVALID;
            m1_AWID     = s2m_AWID;
            m1_AWADDR   = s2m_AWADDR;
            m1_AWLEN    = s2m_AWLEN;
            m1_AWSIZE   = s2m_AWSIZE;
            m1_AWBURST  = s2m_AWBURST;
            m1_AWLOCK   = s2m_AWLOCK;
            m1_AWCACHE  = s2m_AWCACHE;
            m1_AWPROT   = s2m_AWPROT;
            m1_AWQOS    = s2m_AWQOS;
            m1_AWREGION = s2m_AWREGION;
            m1_AWUSER   = s2m_AWUSER;
            m1_WVALID   = s2m_WVALID;
            m1_WDATA    = s2m_WDATA;
            m1_WSTRB    = s2m_WSTRB;
            m1_WLAST    = s2m_WLAST;
            m1_WUSER    = s2m_WUSER;
            m1_BREADY   = s2m_BREADY;
        end
    endcase
end

always @(*) begin
    case(s2m_AWADDR[31])
        1'b0: begin
            s2m_AWREADY = m0_AWREADY;
            s2m_WREADY  = m0_WREADY;
            s2m_BVALID  = m0_BVALID;
            s2m_BID     = m0_BID;
            s2m_BRESP   = m0_BRESP;
            s2m_BUSER   = m0_BUSER;
        end
        1'b1: begin
            s2m_AWREADY = m1_AWREADY;
            s2m_WREADY  = m1_WREADY;
            s2m_BVALID  = m1_BVALID;
            s2m_BID     = m1_BID;
            s2m_BRESP   = m1_BRESP;
            s2m_BUSER   = m1_BUSER;
        end
    endcase
end

endmodule