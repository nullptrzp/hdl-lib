module AXI_Slave_Mux_R#(
    parameter   DATA_WIDTH  = 1024,
                ADDR_WIDTH  = 64,
                ID_WIDTH    = 8,
                USER_WIDTH  = 8,
                STRB_WIDTH = DATA_WIDTH/8
)(
/********** 0号从机 **********/
//读地址通道
    output reg                  m0_ARVALID,
	input	  		            m0_ARREADY,
    output reg[ID_WIDTH-1:0]    m0_ARID,    
    output reg[ADDR_WIDTH-1:0]  m0_ARADDR,
    output reg[7:0]             m0_ARLEN,
    output reg[2:0]             m0_ARSIZE,
    output reg[1:0]             m0_ARBURST,
    output reg                  m0_ARLOCK,
    output reg[3:0]             m0_ARCACHE,
    output reg[2:0]             m0_ARPROT,
    output reg[3:0]             m0_ARQOS,
    output reg[3:0]             m0_ARREGION,
    output reg[USER_WIDTH-1:0]  m0_ARUSER,
//读数据通道
	input[ID_WIDTH-1:0]         m0_RID,
	input[DATA_WIDTH-1:0]       m0_RDATA,
	input[1:0]	                m0_RRESP,
	input	  		            m0_RLAST,
	input[USER_WIDTH-1:0]	    m0_RUSER,
	input	 		            m0_RVALID, 
    output reg                  m0_RREADY,
/********** 1号从机 **********/
//读地址通道
    output reg                  m1_ARVALID,
	input	  		            m1_ARREADY,
    output reg[ID_WIDTH-1:0]    m1_ARID,    
    output reg[ADDR_WIDTH-1:0]  m1_ARADDR,
    output reg[7:0]             m1_ARLEN,
    output reg[2:0]             m1_ARSIZE,
    output reg[1:0]             m1_ARBURST,
    output reg                  m1_ARLOCK,
    output reg[3:0]             m1_ARCACHE,
    output reg[2:0]             m1_ARPROT,
    output reg[3:0]             m1_ARQOS,
    output reg[3:0]             m1_ARREGION,
    output reg[USER_WIDTH-1:0]  m1_ARUSER,
//读数据通道
	input[ID_WIDTH-1:0]         m1_RID,
	input[DATA_WIDTH-1:0]       m1_RDATA,
	input[1:0]	                m1_RRESP,
	input	  		            m1_RLAST,
	input[USER_WIDTH-1:0]	    m1_RUSER,
	input	 		            m1_RVALID, 
    output reg                  m1_RREADY,

//===============内部信号====================
    input                       s2m_ARVALID,
	output reg	  		        s2m_ARREADY,
    input[ID_WIDTH-1:0]         s2m_ARID,    
    input[ADDR_WIDTH-1:0]       s2m_ARADDR,
    input[7:0]                  s2m_ARLEN,
    input[2:0]                  s2m_ARSIZE,
    input[1:0]                  s2m_ARBURST,
    input                       s2m_ARLOCK,
    input[3:0]                  s2m_ARCACHE,
    input[2:0]                  s2m_ARPROT,
    input[3:0]                  s2m_ARQOS,
    input[3:0]                  s2m_ARREGION,
    input[USER_WIDTH-1:0]       s2m_ARUSER,

	output reg[ID_WIDTH-1:0]    s2m_RID,
	output reg[DATA_WIDTH-1:0]  s2m_RDATA,
	output reg[1:0]	            s2m_RRESP,
	output reg	  		        s2m_RLAST,
	output reg[USER_WIDTH-1:0]	s2m_RUSER,
	output reg 		            s2m_RVALID, 
    input                       s2m_RREADY
);

always @(*) begin
    case(s2m_ARADDR[31])
        1'b0: begin
            m0_ARVALID  = s2m_ARVALID;
            m0_ARID     = s2m_ARID;
            m0_ARADDR   = s2m_ARADDR;
            m0_ARLEN    = s2m_ARLEN;
            m0_ARSIZE   = s2m_ARSIZE;
            m0_ARBURST  = s2m_ARBURST;
            m0_ARLOCK   = s2m_ARLOCK;
            m0_ARCACHE  = s2m_ARCACHE;
            m0_ARPROT   = s2m_ARPROT;
            m0_ARQOS    = s2m_ARQOS;
            m0_ARREGION = s2m_ARREGION;
            m0_ARUSER   = s2m_ARUSER;
            m0_RREADY   = s2m_RREADY;
        end
        1'b1: begin
            m1_ARVALID  = s2m_ARVALID;
            m1_ARID     = s2m_ARID;
            m1_ARADDR   = s2m_ARADDR;
            m1_ARLEN    = s2m_ARLEN;
            m1_ARSIZE   = s2m_ARSIZE;
            m1_ARBURST  = s2m_ARBURST;
            m1_ARLOCK   = s2m_ARLOCK;
            m1_ARCACHE  = s2m_ARCACHE;
            m1_ARPROT   = s2m_ARPROT;
            m1_ARQOS    = s2m_ARQOS;
            m1_ARREGION = s2m_ARREGION;
            m1_ARUSER   = s2m_ARUSER;
            m1_RREADY   = s2m_RREADY;
        end
    endcase
end

always @(*) begin
    case(s2m_ARADDR)
        1'b0: begin
            s2m_ARREADY = m0_ARREADY;
            s2m_RID     = m0_RID;
            s2m_RDATA   = m0_RDATA;
            s2m_RRESP   = m0_RRESP;
            s2m_RLAST   = m0_RLAST;
            s2m_RUSER   = m0_RUSER;
            s2m_RVALID  = m0_RVALID;
        end
        1'b1: begin
            s2m_ARREADY = m1_ARREADY;
            s2m_RID     = m1_RID;
            s2m_RDATA   = m1_RDATA;
            s2m_RRESP   = m1_RRESP;
            s2m_RLAST   = m1_RLAST;
            s2m_RUSER   = m1_RUSER;
            s2m_RVALID  = m1_RVALID;
        end
    endcase
end

endmodule