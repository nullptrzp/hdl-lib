module AXI_Interconnect#(
    parameter   DATA_WIDTH  = 1024,             //数据位宽
                ADDR_WIDTH  = 64,               //地址位宽              
                ID_WIDTH    = 32,               //ID位宽
                USER_WIDTH  = 1024,             //USER位宽
                STRB_WIDTH  = (DATA_WIDTH/8)    //STRB位宽
)(
	/********* 时钟&复位 *********/
	input                   ACLK,
	input      	            ARESETn,
/********** 0号主控 **********/
 //写地址通道
	input[ID_WIDTH-1:0]     s0_AWID,
    input[ADDR_WIDTH-1:0]   s0_AWADDR,
    input[7:0]              s0_AWLEN,
    input[2:0]              s0_AWSIZE,
    input[1:0]              s0_AWBURST,
    input                   s0_AWLOCK,
    input[3:0]              s0_AWCACHE,
    input[2:0]              s0_AWPROT,
    input[3:0]              s0_AWQOS,
    input[3:0]              s0_AWREGION,
    input[USER_WIDTH-1:0]   s0_AWUSER,
    input                   s0_AWVALID,
    output                  s0_AWREADY,
//写数据通道
    //input      [ID_WIDTH-1:0]   s0_WID,
    input[DATA_WIDTH-1:0]   s0_WDATA,
    input[STRB_WIDTH-1:0]   s0_WSTRB,
    input                   s0_WLAST,
    input[USER_WIDTH-1:0]   s0_WUSER,
    input                   s0_WVALID,
    output                  s0_WREADY,
//写响应通道
    output                  s0_BVALID,
    input                   s0_BREADY,
    output                  s0_BID,
    output[1:0]             s0_BRESP,
    output[USER_WIDTH-1:0]  s0_BUSER,  
//读地址通道
    input[ID_WIDTH-1:0]     s0_ARID,
    input[ADDR_WIDTH-1:0]   s0_ARADDR,
    input[7:0]              s0_ARLEN,
    input[2:0]              s0_ARSIZE,
    input[1:0]              s0_ARBURST,
    input                   s0_ARLOCK,
    input[3:0]              s0_ARCACHE,
    input[2:0]              s0_ARPROT,
    input[3:0]              s0_ARQOS,
    input[3:0]              s0_ARREGION,
    input[USER_WIDTH-1:0]   s0_ARUSER,
    input                   s0_ARVALID,
    output                  s0_ARREADY,
//读数据通道
    output                  s0_RVALID,
    input                   s0_RREADY,
    output[ID_WIDTH-1:0]    s0_RID,
    output[DATA_WIDTH-1:0]  s0_RDATA,
    output[1:0]             s0_RRESP,
    output                  s0_RLAST,
    output                  s0_RUSER,
/********** 1号主控 **********/
//写地址通道
	input[ID_WIDTH-1:0]     s1_AWID,
    input[ADDR_WIDTH-1:0]   s1_AWADDR,
    input[7:0]              s1_AWLEN,
    input[2:0]              s1_AWSIZE,
    input[1:0]              s1_AWBURST,
    input                   s1_AWLOCK,
    input[3:0]              s1_AWCACHE,
    input[2:0]              s1_AWPROT,
    input[3:0]              s1_AWQOS,
    input[3:0]              s1_AWREGION,
    input[USER_WIDTH-1:0]   s1_AWUSER,
    input                   s1_AWVALID,
    output                  s1_AWREADY,
//写数据通道
    //input      [ID_WIDTH-1:0]   s1_WID,
    input[DATA_WIDTH-1:0]   s1_WDATA,
    input[STRB_WIDTH-1:0]   s1_WSTRB,
    input                   s1_WLAST,
    input[USER_WIDTH-1:0]   s1_WUSER,
    input                   s1_WVALID,
    output                  s1_WREADY,
//写响应通道
    output                  s1_BVALID,
    input                   s1_BREADY,
    output                  s1_BID,
    output[1:0]             s1_BRESP,
    output[USER_WIDTH-1:0]  s1_BUSER,  
//读地址通道
    input[ID_WIDTH-1:0]     s1_ARID,
    input[ADDR_WIDTH-1:0]   s1_ARADDR,
    input[7:0]              s1_ARLEN,
    input[2:0]              s1_ARSIZE,
    input[1:0]              s1_ARBURST,
    input                   s1_ARLOCK,
    input[3:0]              s1_ARCACHE,
    input[2:0]              s1_ARPROT,
    input[3:0]              s1_ARQOS,
    input[3:0]              s1_ARREGION,
    input[USER_WIDTH-1:0]   s1_ARUSER,
    input                   s1_ARVALID,
    output                  s1_ARREADY,
//读数据通道
    output                  s1_RVALID,
    input                   s1_RREADY,
    output[ID_WIDTH-1:0]    s1_RID,
    output[DATA_WIDTH-1:0]  s1_RDATA,
    output[1:0]             s1_RRESP,
    output                  s1_RLAST,
    output                  s1_RUSER,

/********** 2号主控 **********/
//写地址通道
	input[ID_WIDTH-1:0]     s2_AWID,
    input[ADDR_WIDTH-1:0]   s2_AWADDR,
    input[7:0]              s2_AWLEN,
    input[2:0]              s2_AWSIZE,
    input[1:0]              s2_AWBURST,
    input                   s2_AWLOCK,
    input[3:0]              s2_AWCACHE,
    input[2:0]              s2_AWPROT,
    input[3:0]              s2_AWQOS,
    input[3:0]              s2_AWREGION,
    input[USER_WIDTH-1:0]   s2_AWUSER,
    input                   s2_AWVALID,
    output                  s2_AWREADY,
//写数据通道
    //input      [ID_WIDTH-1:0]   s2_WID,
    input[DATA_WIDTH-1:0]   s2_WDATA,
    input[STRB_WIDTH-1:0]   s2_WSTRB,
    input                   s2_WLAST,
    input[USER_WIDTH-1:0]   s2_WUSER,
    input                   s2_WVALID,
    output                  s2_WREADY,
//写响应通道
    output                  s2_BVALID,
    input                   s2_BREADY,
    output                  s2_BID,
    output[1:0]             s2_BRESP,
    output[USER_WIDTH-1:0]  s2_BUSER,  
//读地址通道
    input[ID_WIDTH-1:0]     s2_ARID,
    input[ADDR_WIDTH-1:0]   s2_ARADDR,
    input[7:0]              s2_ARLEN,
    input[2:0]              s2_ARSIZE,
    input[1:0]              s2_ARBURST,
    input                   s2_ARLOCK,
    input[3:0]              s2_ARCACHE,
    input[2:0]              s2_ARPROT,
    input[3:0]              s2_ARQOS,
    input[3:0]              s2_ARREGION,
    input[USER_WIDTH-1:0]   s2_ARUSER,
    input                   s2_ARVALID,
    output                  s2_ARREADY,
//读数据通道
    output                  s2_RVALID,
    input                   s2_RREADY,
    output[ID_WIDTH-1:0]    s2_RID,
    output[DATA_WIDTH-1:0]  s2_RDATA,
    output[1:0]             s2_RRESP,
    output                  s2_RLAST,
    output                  s2_RUSER,
    
/********** 3号主控 **********/
//写地址通道
	input[ID_WIDTH-1:0]     s3_AWID,
    input[ADDR_WIDTH-1:0]   s3_AWADDR,
    input[7:0]              s3_AWLEN,
    input[2:0]              s3_AWSIZE,
    input[1:0]              s3_AWBURST,
    input                   s3_AWLOCK,
    input[3:0]              s3_AWCACHE,
    input[2:0]              s3_AWPROT,
    input[3:0]              s3_AWQOS,
    input[3:0]              s3_AWREGION,
    input[USER_WIDTH-1:0]   s3_AWUSER,
    input                   s3_AWVALID,
    output                  s3_AWREADY,
//写数据通道
    //input      [ID_WIDTH-1:0]   s3_WID,
    input[DATA_WIDTH-1:0]   s3_WDATA,
    input[STRB_WIDTH-1:0]   s3_WSTRB,
    input                   s3_WLAST,
    input[USER_WIDTH-1:0]   s3_WUSER,
    input                   s3_WVALID,
    output                  s3_WREADY,
//写响应通道
    output                  s3_BVALID,
    input                   s3_BREADY,
    output                  s3_BID,
    output[1:0]             s3_BRESP,
    output[USER_WIDTH-1:0]  s3_BUSER,  
//读地址通道
    input[ID_WIDTH-1:0]     s3_ARID,
    input[ADDR_WIDTH-1:0]   s3_ARADDR,
    input[7:0]              s3_ARLEN,
    input[2:0]              s3_ARSIZE,
    input[1:0]              s3_ARBURST,
    input                   s3_ARLOCK,
    input[3:0]              s3_ARCACHE,
    input[2:0]              s3_ARPROT,
    input[3:0]              s3_ARQOS,
    input[3:0]              s3_ARREGION,
    input[USER_WIDTH-1:0]   s3_ARUSER,
    input                   s3_ARVALID,
    output                  s3_ARREADY,
//读数据通道
    output                  s3_RVALID,
    input                   s3_RREADY,
    output[ID_WIDTH-1:0]    s3_RID,
    output[DATA_WIDTH-1:0]  s3_RDATA,
    output[1:0]             s3_RRESP,
    output                  s3_RLAST,
    output                  s3_RUSER,
    
/********** 0号从机 **********/
//写地址
    output                  m0_AWVALID,
    input	   	            m0_AWREADY,
    output[ID_WIDTH-1:0]    m0_AWID,
    output[ADDR_WIDTH-1:0]	m0_AWADDR,
    output[7:0]             m0_AWLEN,
    output[2:0]             m0_AWSIZE,
    output[1:0]             m0_AWBURST,
    output                  m0_AWLOCK,
    output[3:0]             m0_AWCACHE,
    output[2:0]             m0_AWPROT,
    output[3:0]             m0_AWQOS,
    output[3:0]             m0_AWREGION,
    output[USER_WIDTH-1:0]  m0_AWUSER,  
//写数据通道
    output                  m0_WVALID,
    input	  		        m0_WREADY,
    //output     [ID_WIDTH-1:0]   m0_WID,
    output[DATA_WIDTH-1:0]  m0_WDATA,
    output[STRB_WIDTH-1:0]  m0_WSTRB,
    output                  m0_WLAST,
    output[USER_WIDTH-1:0]  m0_WUSER,
//写响应通道
	input[ID_WIDTH-1:0]	    m0_BID,
	input[1:0]	            m0_BRESP,
	input[USER_WIDTH-1:0]   m0_BUSER,
	input	     		    m0_BVALID,
    output                  m0_BREADY,
//读地址通道
    output                  m0_ARVALID,
	input	  		        m0_ARREADY,
    output[ID_WIDTH-1:0]    m0_ARID,    
    output[ADDR_WIDTH-1:0]  m0_ARADDR,
    output[7:0]             m0_ARLEN,
    output[2:0]             m0_ARSIZE,
    output[1:0]             m0_ARBURST,
    output                  m0_ARLOCK,
    output[3:0]             m0_ARCACHE,
    output[2:0]             m0_ARPROT,
    output[3:0]             m0_ARQOS,
    output[3:0]             m0_ARREGION,
    output[USER_WIDTH-1:0]  m0_ARUSER,
//读数据通道
	input[ID_WIDTH-1:0]     m0_RID,
	input[DATA_WIDTH-1:0]   m0_RDATA,
	input[1:0]	            m0_RRESP,
	input	  		        m0_RLAST,
	input[USER_WIDTH-1:0]	m0_RUSER,
	input	 		        m0_RVALID, 
    output                  m0_RREADY,
    
/********** 1号从机 **********/
//写地址
    output                  m1_AWVALID,
    input	   	            m1_AWREADY,
    output[ID_WIDTH-1:0]    m1_AWID,
    output[ADDR_WIDTH-1:0]	m1_AWADDR,
    output[7:0]             m1_AWLEN,
    output[2:0]             m1_AWSIZE,
    output[1:0]             m1_AWBURST,
    output                  m1_AWLOCK,
    output[3:0]             m1_AWCACHE,
    output[2:0]             m1_AWPROT,
    output[3:0]             m1_AWQOS,
    output[3:0]             m1_AWREGION,
    output[USER_WIDTH-1:0]  m1_AWUSER,  
//写数据通道
    output                  m1_WVALID,
    input	  		        m1_WREADY,
    //output     [ID_WIDTH-1:0]   m1_WID,
    output[DATA_WIDTH-1:0]  m1_WDATA,
    output[STRB_WIDTH-1:0]  m1_WSTRB,
    output                  m1_WLAST,
    output[USER_WIDTH-1:0]  m1_WUSER,
//写响应通道
	input[ID_WIDTH-1:0]	    m1_BID,
	input[1:0]	            m1_BRESP,
	input[USER_WIDTH-1:0]   m1_BUSER,
	input	     		    m1_BVALID,
    output                  m1_BREADY,
//读地址通道
    output                  m1_ARVALID,
	input	  		        m1_ARREADY,
    output[ID_WIDTH-1:0]    m1_ARID,    
    output[ADDR_WIDTH-1:0]  m1_ARADDR,
    output[7:0]             m1_ARLEN,
    output[2:0]             m1_ARSIZE,
    output[1:0]             m1_ARBURST,
    output                  m1_ARLOCK,
    output[3:0]             m1_ARCACHE,
    output[2:0]             m1_ARPROT,
    output[3:0]             m1_ARQOS,
    output[3:0]             m1_ARREGION,
    output[USER_WIDTH-1:0]  m1_ARUSER,
//读数据通道
	input[ID_WIDTH-1:0]     m1_RID,
	input[DATA_WIDTH-1:0]   m1_RDATA,
	input[1:0]	            m1_RRESP,
	input	  		        m1_RLAST,
	input[USER_WIDTH-1:0]	m1_RUSER,
	input	 		        m1_RVALID, 
    output                  m1_RREADY  
);
    //=========================================================
    //wire define
    wire       s0_wgrnt;
    wire       s1_wgrnt;
    wire       s2_wgrnt;
    wire       s3_wgrnt;
    wire       s0_rgrnt;
    wire       s1_rgrnt;
    wire       s2_rgrnt;
    wire       s3_rgrnt;

    wire[ID_WIDTH-1:0]      s2m_AWID;
    wire[ADDR_WIDTH-1:0]    s2m_AWADDR;
    wire[7:0]               s2m_AWLEN;
    wire[2:0]               s2m_AWSIZE;
    wire[1:0]               s2m_AWBURST;
    wire                    s2m_AWLOCK;
    wire[3:0]               s2m_AWCACHE;
    wire[2:0]               s2m_AWPROT;
    wire[3:0]               s2m_AWQOS;
    wire[3:0]               s2m_AWREGION;
    wire[USER_WIDTH-1:0]    s2m_AWUSER;
    wire                    s2m_AWVALID;
    wire                    s2m_AWREADY;
    //wire   s2m_WID;
    wire[DATA_WIDTH-1:0]    s2m_WDATA;
    wire[STRB_WIDTH-1:0]    s2m_WSTRB;
    wire                    s2m_WLAST;
    wire[USER_WIDTH-1:0]    s2m_WUSER;
    wire                    s2m_WVALID;
    wire                    s2m_WREADY;

    wire                    s2m_BREADY;
    wire                    s2m_BVALID;
    wire[ID_WIDTH-1:0]      s2m_BID;
    wire[1:0]               s2m_BRESP;
    wire[USER_WIDTH-1:0]    s2m_BUSER;

    wire[ID_WIDTH-1:0]      s2m_ARID;
    wire[ADDR_WIDTH-1:0]    s2m_ARADDR;
    wire[7:0]               s2m_ARLEN;
    wire[2:0]               s2m_ARSIZE;
    wire[1:0]               s2m_ARBURST;
    wire                    s2m_ARLOCK;
    wire[3:0]               s2m_ARCACHE;
    wire[2:0]               s2m_ARPROT;
    wire[3:0]               s2m_ARQOS;
    wire[3:0]               s2m_ARREGION;
    wire[USER_WIDTH-1:0]    s2m_ARUSER;
    wire                    s2m_ARVALID;
    wire                    s2m_ARREADY;

    wire                    s2m_RREADY;
    wire                    s2m_RVALID;
    wire[ID_WIDTH-1:0]      s2m_RID;
    wire[DATA_WIDTH-1:0]    s2m_RDATA;
    wire[1:0]               s2m_RRESP;
    wire                    s2m_RLAST;
    wire[USER_WIDTH-1:0]    s2m_RUSER;


AXI_Arbiter_W u_AXI_Arbiter_W(
    .ACLK(ACLK),
    .ARESETn(ARESETn),
/********** 0号主控 **********/
    .s0_AWVALID(s0_AWVALID),
    .s0_AWREADY(s0_AWREADY),
    .s0_WVALID(s0_WVALID),
    .s0_WREADY(s0_WREADY),
    .s0_BVALID(s0_BVALID),
    .s0_BREADY(s0_BREADY),
/********** 1号主控 **********/
    .s1_AWVALID(s1_AWVALID),
    .s1_AWREADY(s1_AWREADY),
    .s1_WVALID(s1_WVALID),
    .s1_WREADY(s1_WREADY),
    .s1_BVALID(s1_BVALID),
    .s1_BREADY(s1_BREADY),
/********** 2号主控 **********/
    .s2_AWVALID(s2_AWVALID),
    .s2_AWREADY(s2_AWREADY),
    .s2_WVALID(s2_WVALID),
    .s2_WREADY(s2_WREADY),
    .s2_BVALID(s2_BVALID),
    .s2_BREADY(s2_BREADY),
/********** 3号主控 **********/
    .s3_AWVALID(s3_AWVALID),
    .s3_AWREADY(s3_AWREADY),
    .s3_WVALID(s3_WVALID),
    .s3_WREADY(s3_WREADY),
    .s3_BVALID(s3_BVALID),
    .s3_BREADY(s3_BREADY),
    .s0_wgrnt(s0_wgrnt),
    .s1_wgrnt(s1_wgrnt),
    .s2_wgrnt(s2_wgrnt),
    .s3_wgrnt(s3_wgrnt)
);

AXI_Arbiter_R u_AXI_Arbiter_R(
    .ACLK(ACLK),
    .ARESETn(ARESETn),
/********** 0号主控 **********/
    .s0_ARVALID(s0_ARVALID),
    .s0_ARREADY(s0_ARREADY),
    .s0_RVALID(s0_RVALID),
    .s0_RREADY(s0_RREADY),
    .s0_RLAST(s0_RLAST),
/********** 1号主控 **********/
    .s1_ARVALID(s1_ARVALID),
    .s1_ARREADY(s1_ARREADY),
    .s1_RVALID(s1_RVALID),
    .s1_RREADY(s1_RREADY),
    .s1_RLAST(s1_RLAST),
/********** 2号主控 **********/
    .s2_ARVALID(s2_ARVALID),
    .s2_ARREADY(s2_ARREADY),
    .s2_RVALID(s2_RVALID),
    .s2_RREADY(s2_RREADY),
    .s2_RLAST(s2_RLAST),
/********** 3号主控 **********/
    .s3_ARVALID(s3_ARVALID),
    .s3_ARREADY(s3_ARREADY),
    .s3_RVALID(s3_RVALID),
    .s3_RREADY(s3_RREADY),
    .s3_RLAST(s3_RLAST),
    .s0_rgrnt(s0_rgrnt),
    .s1_rgrnt(s1_rgrnt),
    .s2_rgrnt(s2_rgrnt),
    .s3_rgrnt(s3_rgrnt)
);

AXI_Master_Mux_W #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .ID_WIDTH(ID_WIDTH),
    .USER_WIDTH(USER_WIDTH),
    .STRB_WIDTH(STRB_WIDTH)
)u_AXI_Master_Mux_W(
/********** 0号主控 **********/
    .s0_AWID(s0_AWID),
    .s0_AWADDR(s0_AWADDR),
    .s0_AWLEN(s0_AWLEN),
    .s0_AWSIZE(s0_AWSIZE),
    .s0_AWBURST(s0_AWBURST),
    .s0_AWLOCK(s0_AWLOCK),
    .s0_AWCACHE(s0_AWCACHE),
    .s0_AWPROT(s0_AWPROT),
    .s0_AWQOS(s0_AWQOS),
    .s0_AWREGION(s0_AWREGION),
    .s0_AWUSER(s0_AWUSER),
    .s0_AWVALID(s0_AWVALID),
    .s0_AWREADY(s0_AWREADY),
    //.s0_WID,
    .s0_WDATA(s0_WDATA),
    .s0_WSTRB(s0_WSTRB),
    .s0_WLAST(s0_WLAST),
    .s0_WUSER(s0_WUSER),
    .s0_WVALID(s0_WVALID),
    .s0_WREADY(s0_WREADY),
    .s0_BVALID(s0_BVALID),
    .s0_BREADY(s0_BREADY),
    .s0_BID(s0_BID),
    .s0_BRESP(s0_BRESP),
    .s0_BUSER(s0_BUSER),
/********** 1号主控 **********/
    .s1_AWID(s1_AWID),
    .s1_AWADDR(s1_AWADDR),
    .s1_AWLEN(s1_AWLEN),
    .s1_AWSIZE(s1_AWSIZE),
    .s1_AWBURST(s1_AWBURST),
    .s1_AWLOCK(s1_AWLOCK),
    .s1_AWCACHE(s1_AWCACHE),
    .s1_AWPROT(s1_AWPROT),
    .s1_AWQOS(s1_AWQOS),
    .s1_AWREGION(s1_AWREGION),
    .s1_AWUSER(s1_AWUSER),
    .s1_AWVALID(s1_AWVALID),
    .s1_AWREADY(s1_AWREADY),
    //.  s1_WID,
    .s1_WDATA(s1_WDATA),
    .s1_WSTRB(s1_WSTRB),
    .s1_WLAST(s1_WLAST),
    .s1_WUSER(s1_WUSER),
    .s1_WVALID(s1_WVALID),
    .s1_WREADY(s1_WREADY),
    .s1_BVALID(s1_BVALID),
    .s1_BREADY(s1_BREADY),
    .s1_BID(s1_BID),
    .s1_BRESP(s1_BRESP),
    .s1_BUSER(s1_BUSER),
/********** 2号主控 **********/
    .s2_AWID(s2_AWID),
    .s2_AWADDR(s2_AWADDR),
    .s2_AWLEN(s2_AWLEN),
    .s2_AWSIZE(s2_AWSIZE),
    .s2_AWBURST(s2_AWBURST),
    .s2_AWLOCK(s2_AWLOCK),
    .s2_AWCACHE(s2_AWCACHE),
    .s2_AWPROT(s2_AWPROT),
    .s2_AWQOS(s2_AWQOS),
    .s2_AWREGION(s2_AWREGION),
    .s2_AWUSER(s2_AWUSER),
    .s2_AWVALID(s2_AWVALID),
    .s2_AWREADY(s2_AWREADY),
    //.  s2_WID,
    .s2_WDATA(s2_WDATA),
    .s2_WSTRB(s2_WSTRB),
    .s2_WLAST(s2_WLAST),
    .s2_WUSER(s2_WUSER),
    .s2_WVALID(s2_WVALID),
    .s2_WREADY(s2_WREADY),
    .s2_BVALID(s2_BVALID),
    .s2_BREADY(s2_BREADY),
    .s2_BID(s2_BID),
    .s2_BRESP(s2_BRESP),
    .s2_BUSER(s2_BUSER),
/********** 3号主控 **********/
    .s3_AWID(s3_AWID),
    .s3_AWADDR(s3_AWADDR),
    .s3_AWLEN(s3_AWLEN),
    .s3_AWSIZE(s3_AWSIZE),
    .s3_AWBURST(s3_AWBURST),
    .s3_AWLOCK(s3_AWLOCK),
    .s3_AWCACHE(s3_AWCACHE),
    .s3_AWPROT(s3_AWPROT),
    .s3_AWQOS(s3_AWQOS),
    .s3_AWREGION(s3_AWREGION),
    .s3_AWUSER(s3_AWUSER),
    .s3_AWVALID(s3_AWVALID),
    .s3_AWREADY(s3_AWREADY),
    //.  s3_WID,
    .s3_WDATA(s3_WDATA),
    .s3_WSTRB(s3_WSTRB),
    .s3_WLAST(s3_WLAST),
    .s3_WUSER(s3_WUSER),
    .s3_WVALID(s3_WVALID),
    .s3_WREADY(s3_WREADY),
    .s3_BVALID(s3_BVALID),
    .s3_BREADY(s3_BREADY),
    .s3_BID(s3_BID),
    .s3_BRESP(s3_BRESP),
    .s3_BUSER(s3_BUSER),
/********** 内部信号 **********/
    .s2m_AWID(s2m_AWID),
    .s2m_AWADDR(s2m_AWADDR),
    .s2m_AWLEN(s2m_AWLEN),
    .s2m_AWSIZE(s2m_AWSIZE),
    .s2m_AWBURST(s2m_AWBURST),
    .s2m_AWLOCK(s2m_AWLOCK),
    .s2m_AWCACHE(s2m_AWCACHE),
    .s2m_AWPROT(s2m_AWPROT),
    .s2m_AWQOS(s2m_AWQOS),
    .s2m_AWREGION(s2m_AWREGION),
    .s2m_AWUSER(s2m_AWUSER),
    .s2m_AWVALID(s2m_AWVALID),
    .s2m_AWREADY(s2m_AWREADY),
    //.s2m_WID,
    .s2m_WDATA(s2m_WDATA),
    .s2m_WSTRB(s2m_WSTRB),
    .s2m_WLAST(s2m_WLAST),
    .s2m_WUSER(s2m_WUSER),
    .s2m_WVALID(s2m_WVALID),
    .s2m_WREADY(s2m_WREADY),
    .s2m_BREADY(s2m_BREADY),
    .s2m_BVALID(s2m_BVALID),
    .s2m_BID(s2m_BID),
    .s2m_BRESP(s2m_BRESP),
    .s2m_BUSER(s2m_BUSER),
    .s0_wgrnt(s0_wgrnt),
    .s1_wgrnt(s1_wgrnt),
    .s2_wgrnt(s2_wgrnt),
    .s3_wgrnt(s3_wgrnt)
);

AXI_Master_Mux_R #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .ID_WIDTH(ID_WIDTH),
    .USER_WIDTH(USER_WIDTH)
)u_AXI_Master_Mux_R(
/********** 0号主控 **********/
    .s0_ARID(s0_ARID),
    .s0_ARADDR(s0_ARADDR),
    .s0_ARLEN(s0_ARLEN),
    .s0_ARSIZE(s0_ARSIZE),
    .s0_ARBURST(s0_ARBURST),
    .s0_ARLOCK(s0_ARLOCK),
    .s0_ARCACHE(s0_ARCACHE),
    .s0_ARPROT(s0_ARPROT),
    .s0_ARQOS(s0_ARQOS),
    .s0_ARREGION(s0_ARREGION),
    .s0_ARUSER(s0_ARUSER),
    .s0_ARVALID(s0_ARVALID),
    .s0_ARREADY(s0_ARREADY),
    .s0_RVALID(s0_RVALID),
    .s0_RREADY(s0_RREADY),
    .s0_RID(s0_RID),
    .s0_RDATA(s0_RDATA),
    .s0_RRESP(s0_RRESP),
    .s0_RLAST(s0_RLAST),
    .s0_RUSER(s0_RUSER),
/********** 1号主控 **********/
    .s1_ARID(s1_ARID),
    .s1_ARADDR(s1_ARADDR),
    .s1_ARLEN(s1_ARLEN),
    .s1_ARSIZE(s1_ARSIZE),
    .s1_ARBURST(s1_ARBURST),
    .s1_ARLOCK(s1_ARLOCK),
    .s1_ARCACHE(s1_ARCACHE),
    .s1_ARPROT(s1_ARPROT),
    .s1_ARQOS(s1_ARQOS),
    .s1_ARREGION(s1_ARREGION),
    .s1_ARUSER(s1_ARUSER),
    .s1_ARVALID(s1_ARVALID),
    .s1_ARREADY(s1_ARREADY),
    .s1_RVALID(s1_RVALID),
    .s1_RREADY(s1_RREADY),
    .s1_RID(s1_RID),
    .s1_RDATA(s1_RDATA),
    .s1_RRESP(s1_RRESP),
    .s1_RLAST(s1_RLAST),
    .s1_RUSER(s1_RUSER),
/********** 2号主控 **********/
    .s2_ARID(s2_ARID),
    .s2_ARADDR(s2_ARADDR),
    .s2_ARLEN(s2_ARLEN),
    .s2_ARSIZE(s2_ARSIZE),
    .s2_ARBURST(s2_ARBURST),
    .s2_ARLOCK(s2_ARLOCK),
    .s2_ARCACHE(s2_ARCACHE),
    .s2_ARPROT(s2_ARPROT),
    .s2_ARQOS(s2_ARQOS),
    .s2_ARREGION(s2_ARREGION),
    .s2_ARUSER(s2_ARUSER),
    .s2_ARVALID(s2_ARVALID),
    .s2_ARREADY(s2_ARREADY),
    .s2_RVALID(s2_RVALID),
    .s2_RREADY(s2_RREADY),
    .s2_RID(s2_RID),
    .s2_RDATA(s2_RDATA),
    .s2_RRESP(s2_RRESP),
    .s2_RLAST(s2_RLAST),
    .s2_RUSER(s2_RUSER),
/********** 3号主控 **********/
    .s3_ARID(s3_ARID),
    .s3_ARADDR(s3_ARADDR),
    .s3_ARLEN(s3_ARLEN),
    .s3_ARSIZE(s3_ARSIZE),
    .s3_ARBURST(s3_ARBURST),
    .s3_ARLOCK(s3_ARLOCK),
    .s3_ARCACHE(s3_ARCACHE),
    .s3_ARPROT(s3_ARPROT),
    .s3_ARQOS(s3_ARQOS),
    .s3_ARREGION(s3_ARREGION),
    .s3_ARUSER(s3_ARUSER),
    .s3_ARVALID(s3_ARVALID),
    .s3_ARREADY(s3_ARREADY),
    .s3_RVALID(s3_RVALID),
    .s3_RREADY(s3_RREADY),
    .s3_RID(s3_RID),
    .s3_RDATA(s3_RDATA),
    .s3_RRESP(s3_RRESP),
    .s3_RLAST(s3_RLAST),
    .s3_RUSER(s3_RUSER),
 //===============内部信号==================
    .s2m_ARID(s2m_ARID),
    .s2m_ARADDR(s2m_ARADDR),
    .s2m_ARLEN(s2m_ARLEN),
    .s2m_ARSIZE(s2m_ARSIZE),
    .s2m_ARBURST(s2m_ARBURST),
    .s2m_ARLOCK(s2m_ARLOCK),
    .s2m_ARCACHE(s2m_ARCACHE),
    .s2m_ARPROT(s2m_ARPROT),
    .s2m_ARQOS(s2m_ARQOS),
    .s2m_ARREGION(s2m_ARREGION),
    .s2m_ARUSER(s2m_ARUSER),
    .s2m_ARVALID(s2m_ARVALID),
    .s2m_ARREADY(s2m_ARREADY),
    .s2m_RREADY(s2m_RREADY),
    .s2m_RVALID(s2m_RVALID),
    .s2m_RID(s2m_RID),
    .s2m_RDATA(s2m_RDATA),
    .s2m_RRESP(s2m_RRESP),
    .s2m_RLAST(s2m_RLAST),
    .s2m_ruser(s2m_RUSER),

    .s0_rgrnt(s0_rgrnt),
    .s1_rgrnt(s1_rgrnt),
    .s2_rgrnt(s2_rgrnt),
    .s3_rgrnt(s3_rgrnt)
);

AXI_Slave_Mux_W #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .ID_WIDTH(ID_WIDTH),
    .USER_WIDTH(USER_WIDTH)
)u_AXI_Slave_Mux_W(
/********** 0号从机 **********/
    .m0_AWVALID(m0_AWVALID),
    .m0_AWREADY(m0_AWREADY),
    .m0_AWID(m0_AWID),
    .m0_AWADDR(m0_AWADDR),
    .m0_AWLEN(m0_AWLEN),
    .m0_AWSIZE(m0_AWSIZE),
    .m0_AWBURST(m0_AWBURST),
    .m0_AWLOCK(m0_AWLOCK),
    .m0_AWCACHE(m0_AWCACHE),
    .m0_AWPROT(m0_AWPROT),
    .m0_AWQOS(m0_AWQOS),
    .m0_AWREGION(m0_AWREGION),
    .m0_AWUSER(m0_AWUSER),
    .m0_WVALID(m0_WVALID),
    .m0_WREADY(m0_WREADY),
    //.m0_WID,
    .m0_WDATA(m0_WDATA),
    .m0_WSTRB(m0_WSTRB),
    .m0_WLAST(m0_WLAST),
    .m0_WUSER(m0_WUSER),
    .m0_BID(m0_BID),
    .m0_BRESP(m0_BRESP),
    .m0_BUSER(m0_BUSER),
    .m0_BVALID(m0_BVALID),
    .m0_BREADY(m0_BREADY),
/********** 1号从机 **********/
    .m1_AWVALID(m1_AWVALID),
    .m1_AWREADY(m1_AWREADY),
    .m1_AWID(m1_AWID),
    .m1_AWADDR(m1_AWADDR),
    .m1_AWLEN(m1_AWLEN),
    .m1_AWSIZE(m1_AWSIZE),
    .m1_AWBURST(m1_AWBURST),
    .m1_AWLOCK(m1_AWLOCK),
    .m1_AWCACHE(m1_AWCACHE),
    .m1_AWPROT(m1_AWPROT),
    .m1_AWQOS(m1_AWQOS),
    .m1_AWREGION(m1_AWREGION),
    .m1_AWUSER(m1_AWUSER), 
    .m1_WVALID(m1_WVALID),
    .m1_WREADY(m1_WREADY),
    //.m1_WID,
    .m1_WDATA(m1_WDATA),
    .m1_WSTRB(m1_WSTRB),
    .m1_WLAST(m1_WLAST),
    .m1_WUSER(m1_WUSER),
    .m1_BID(m1_BID),
    .m1_BRESP(m1_BRESP),
    .m1_BUSER(m1_BUSER),
    .m1_BVALID(m1_BVALID),
    .m1_BREADY(m1_BREADY),
 //===============内部信号==================
    .s2m_AWID(s2m_AWID),
    .s2m_AWADDR(s2m_AWADDR),
    .s2m_AWLEN(s2m_AWLEN),
    .s2m_AWSIZE(s2m_AWSIZE),
    .s2m_AWBURST(s2m_AWBURST),
    .s2m_AWLOCK(s2m_AWLOCK),
    .s2m_AWCACHE(s2m_AWCACHE),
    .s2m_AWPROT(s2m_AWPROT),
    .s2m_AWQOS(s2m_AWQOS),
    .s2m_AWREGION(s2m_AWREGION),
    .s2m_AWUSER(s2m_AWUSER),
    .s2m_AWVALID(s2m_AWVALID),
    .s2m_AWREADY(s2m_AWREADY),
    //.s2m_WID,
    .s2m_WDATA(s2m_WDATA),
    .s2m_WSTRB(s2m_WSTRB),
    .s2m_WLAST(s2m_WLAST),
    .s2m_WUSER(s2m_WUSER),
    .s2m_WVALID(s2m_WVALID),
    .s2m_WREADY(s2m_WREADY),
    .s2m_BREADY(s2m_BREADY),
    .s2m_BVALID(s2m_BVALID),
    .s2m_BID(s2m_BID),
    .s2m_BRESP(s2m_BRESP),
    .s2m_BUSER(s2m_BUSER)
);

AXI_Slave_Mux_R #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .ID_WIDTH(ID_WIDTH),
    .USER_WIDTH(USER_WIDTH)
)u_AXI_Slave_Mux_R(
/********** 0号从机 **********/
    .m0_ARVALID(m0_ARVALID),
    .m0_ARREADY(m0_ARREADY),
    .m0_ARID(m0_ARID),    
    .m0_ARADDR(m0_ARADDR),
    .m0_ARLEN(m0_ARLEN),
    .m0_ARSIZE(m0_ARSIZE),
    .m0_ARBURST(m0_ARBURST),
    .m0_ARLOCK(m0_ARLOCK),
    .m0_ARCACHE(m0_ARCACHE),
    .m0_ARPROT(m0_ARPROT),
    .m0_ARQOS(m0_ARQOS),
    .m0_ARREGION(m0_ARREGION),
    .m0_ARUSER(m0_ARUSER),
    .m0_RID(m0_RID),
    .m0_RDATA(m0_RDATA),
    .m0_RRESP(m0_RRESP),
    .m0_RLAST(m0_RLAST),
    .m0_RUSER(m0_RUSER),
    .m0_RVALID(m0_RVALID), 
    .m0_RREADY(m0_RREADY),
/********** 1号从机 **********/
    .m1_ARVALID(m1_ARVALID),
    .m1_ARREADY(m1_ARREADY),
    .m1_ARID(m1_ARID),    
    .m1_ARADDR(m1_ARADDR),
    .m1_ARLEN(m1_ARLEN),
    .m1_ARSIZE(m1_ARSIZE),
    .m1_ARBURST(m1_ARBURST),
    .m1_ARLOCK(m1_ARLOCK),
    .m1_ARCACHE(m1_ARCACHE),
    .m1_ARPROT(m1_ARPROT),
    .m1_ARQOS(m1_ARQOS),
    .m1_ARREGION(m1_ARREGION),
    .m1_ARUSER(m1_ARUSER),
    .m1_RID(m1_RID),
    .m1_RDATA(m1_RDATA),
    .m1_RRESP(m1_RRESP),
    .m1_RLAST(m1_RLAST),
    .m1_RUSER(m1_RUSER),
    .m1_RVALID(m1_RVALID), 
    .m1_RREADY(m1_RREADY),
/********** 中间信号 **********/
    .s2m_ARVALID(s2m_ARVALID),
    .s2m_ARREADY(s2m_ARREADY),
    .s2m_ARID(s2m_ARID),    
    .s2m_ARADDR(s2m_ARADDR),
    .s2m_ARLEN(s2m_ARLEN),
    .s2m_ARSIZE(s2m_ARSIZE),
    .s2m_ARBURST(s2m_ARBURST),
    .s2m_ARLOCK(s2m_ARLOCK),
    .s2m_ARCACHE(s2m_ARCACHE),
    .s2m_ARPROT(s2m_ARPROT),
    .s2m_ARQOS(s2m_ARQOS),
    .s2m_ARREGION(s2m_ARREGION),
    .s2m_ARUSER(s2m_ARUSER),
    .s2m_RID(s2m_RID),
    .s2m_RDATA(s2m_RDATA),
    .s2m_RRESP(s2m_RRESP),
    .s2m_RLAST(s2m_RLAST),
    .s2m_RUSER(s2m_RUSER),
    .s2m_RVALID(s2m_RVALID), 
    .s2m_RREADY(s2m_RREADY)
);

endmodule