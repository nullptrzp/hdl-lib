`timescale 1ns/1ns

module testbench;
    parameter ADDR_WIDTH = 32;
    parameter DATA_WIDTH = 64;
    parameter ID_WIDTH = 4;
    parameter BURST_LEN = 8;
    parameter USER_WIDTH = 1;
    parameter STRB_WIDTH = (DATA_WIDTH/8);
    parameter SIZE = $clog2(DATA_WIDTH/8);
    parameter CLOCK_PERIOD = 20;

    bit ACLK;
    bit ARESETn;

    bit[ID_WIDTH-1:0]     s0_AWID;
    bit[ADDR_WIDTH-1:0]   s0_AWADDR;
    bit[7:0]              s0_AWLEN;
    bit[2:0]              s0_AWSIZE;
    bit[1:0]              s0_AWBURST;
    bit                   s0_AWLOCK;
    bit[3:0]              s0_AWCACHE;
    bit[2:0]              s0_AWPROT;
    bit[3:0]              s0_AWQOS;
    bit[3:0]              s0_AWREGION;
    bit[USER_WIDTH-1:0]   s0_AWUSER;
    bit                   s0_AWVALID;
    bit                  s0_AWREADY;
//写数据通道
    //bit      [ID_WIDTH-1:0]   s0_WID;
    bit[DATA_WIDTH-1:0]   s0_WDATA;
    bit[STRB_WIDTH-1:0]   s0_WSTRB;
    bit                   s0_WLAST;
    bit[USER_WIDTH-1:0]   s0_WUSER;
    bit                   s0_WVALID;
    bit                  s0_WREADY;
//写响应通道
    bit                  s0_BVALID;
    bit                   s0_BREADY;
    bit[ID_WIDTH-1:0]    s0_BID;
    bit[1:0]             s0_BRESP;
    bit[USER_WIDTH-1:0]  s0_BUSER;  
//读地址通道
    bit[ID_WIDTH-1:0]     s0_ARID;
    bit[ADDR_WIDTH-1:0]   s0_ARADDR;
    bit[7:0]              s0_ARLEN;
    bit[2:0]              s0_ARSIZE;
    bit[1:0]              s0_ARBURST;
    bit                   s0_ARLOCK;
    bit[3:0]              s0_ARCACHE;
    bit[2:0]              s0_ARPROT;
    bit[3:0]              s0_ARQOS;
    bit[3:0]              s0_ARREGION;
    bit[USER_WIDTH-1:0]   s0_ARUSER;
    bit                   s0_ARVALID;
    bit                  s0_ARREADY;
//读数据通道
    bit                  s0_RVALID;
    bit                   s0_RREADY;
    bit[ID_WIDTH-1:0]    s0_RID;
    bit[DATA_WIDTH-1:0]  s0_RDATA;
    bit[1:0]             s0_RRESP;
    bit                  s0_RLAST;
    bit                  s0_RUSER;
/********** 1号主控 **********/
//写地址通道
	bit[ID_WIDTH-1:0]     s1_AWID;
    bit[ADDR_WIDTH-1:0]   s1_AWADDR;
    bit[7:0]              s1_AWLEN;
    bit[2:0]              s1_AWSIZE;
    bit[1:0]              s1_AWBURST;
    bit                   s1_AWLOCK;
    bit[3:0]              s1_AWCACHE;
    bit[2:0]              s1_AWPROT;
    bit[3:0]              s1_AWQOS;
    bit[3:0]              s1_AWREGION;
    bit[USER_WIDTH-1:0]   s1_AWUSER;
    bit                   s1_AWVALID;
    bit                  s1_AWREADY;
//写数据通道
    //bit      [ID_WIDTH-1:0]   s1_WID;
    bit[DATA_WIDTH-1:0]   s1_WDATA;
    bit[STRB_WIDTH-1:0]   s1_WSTRB;
    bit                   s1_WLAST;
    bit[USER_WIDTH-1:0]   s1_WUSER;
    bit                   s1_WVALID;
    bit                  s1_WREADY;
//写响应通道
    bit                  s1_BVALID;
    bit                   s1_BREADY;
    bit[ID_WIDTH-1:0]    s1_BID;
    bit[1:0]             s1_BRESP;
    bit[USER_WIDTH-1:0]  s1_BUSER;  
//读地址通道
    bit[ID_WIDTH-1:0]     s1_ARID;
    bit[ADDR_WIDTH-1:0]   s1_ARADDR;
    bit[7:0]              s1_ARLEN;
    bit[2:0]              s1_ARSIZE;
    bit[1:0]              s1_ARBURST;
    bit                   s1_ARLOCK;
    bit[3:0]              s1_ARCACHE;
    bit[2:0]              s1_ARPROT;
    bit[3:0]              s1_ARQOS;
    bit[3:0]              s1_ARREGION;
    bit[USER_WIDTH-1:0]   s1_ARUSER;
    bit                   s1_ARVALID;
    bit                  s1_ARREADY;
//读数据通道
    bit                  s1_RVALID;
    bit                   s1_RREADY;
    bit[ID_WIDTH-1:0]    s1_RID;
    bit[DATA_WIDTH-1:0]  s1_RDATA;
    bit[1:0]             s1_RRESP;
    bit                  s1_RLAST;
    bit                  s1_RUSER;

/********** 2号主控 **********/
//写地址通道
	bit[ID_WIDTH-1:0]     s2_AWID;
    bit[ADDR_WIDTH-1:0]   s2_AWADDR;
    bit[7:0]              s2_AWLEN;
    bit[2:0]              s2_AWSIZE;
    bit[1:0]              s2_AWBURST;
    bit                   s2_AWLOCK;
    bit[3:0]              s2_AWCACHE;
    bit[2:0]              s2_AWPROT;
    bit[3:0]              s2_AWQOS;
    bit[3:0]              s2_AWREGION;
    bit[USER_WIDTH-1:0]   s2_AWUSER;
    bit                   s2_AWVALID;
    bit                  s2_AWREADY;
//写数据通道
    //bit      [ID_WIDTH-1:0]   s2_WID;
    bit[DATA_WIDTH-1:0]   s2_WDATA;
    bit[STRB_WIDTH-1:0]   s2_WSTRB;
    bit                   s2_WLAST;
    bit[USER_WIDTH-1:0]   s2_WUSER;
    bit                   s2_WVALID;
    bit                  s2_WREADY;
//写响应通道
    bit                  s2_BVALID;
    bit                   s2_BREADY;
    bit[ID_WIDTH-1:0]    s2_BID;
    bit[1:0]             s2_BRESP;
    bit[USER_WIDTH-1:0]  s2_BUSER;  
//读地址通道
    bit[ID_WIDTH-1:0]     s2_ARID;
    bit[ADDR_WIDTH-1:0]   s2_ARADDR;
    bit[7:0]              s2_ARLEN;
    bit[2:0]              s2_ARSIZE;
    bit[1:0]              s2_ARBURST;
    bit                   s2_ARLOCK;
    bit[3:0]              s2_ARCACHE;
    bit[2:0]              s2_ARPROT;
    bit[3:0]              s2_ARQOS;
    bit[3:0]              s2_ARREGION;
    bit[USER_WIDTH-1:0]   s2_ARUSER;
    bit                   s2_ARVALID;
    bit                  s2_ARREADY;
//读数据通道
    bit                  s2_RVALID;
    bit                   s2_RREADY;
    bit[ID_WIDTH-1:0]    s2_RID;
    bit[DATA_WIDTH-1:0]  s2_RDATA;
    bit[1:0]             s2_RRESP;
    bit                  s2_RLAST;
    bit                  s2_RUSER;
    
/********** 3号主控 **********/
//写地址通道
	bit[ID_WIDTH-1:0]     s3_AWID;
    bit[ADDR_WIDTH-1:0]   s3_AWADDR;
    bit[7:0]              s3_AWLEN;
    bit[2:0]              s3_AWSIZE;
    bit[1:0]              s3_AWBURST;
    bit                   s3_AWLOCK;
    bit[3:0]              s3_AWCACHE;
    bit[2:0]              s3_AWPROT;
    bit[3:0]              s3_AWQOS;
    bit[3:0]              s3_AWREGION;
    bit[USER_WIDTH-1:0]   s3_AWUSER;
    bit                   s3_AWVALID;
    bit                  s3_AWREADY;
//写数据通道
    //bit      [ID_WIDTH-1:0]   s3_WID;
    bit[DATA_WIDTH-1:0]   s3_WDATA;
    bit[STRB_WIDTH-1:0]   s3_WSTRB;
    bit                   s3_WLAST;
    bit[USER_WIDTH-1:0]   s3_WUSER;
    bit                   s3_WVALID;
    bit                  s3_WREADY;
//写响应通道
    bit                  s3_BVALID;
    bit                   s3_BREADY;
    bit[ID_WIDTH-1:0]    s3_BID;
    bit[1:0]             s3_BRESP;
    bit[USER_WIDTH-1:0]  s3_BUSER;  
//读地址通道
    bit[ID_WIDTH-1:0]     s3_ARID;
    bit[ADDR_WIDTH-1:0]   s3_ARADDR;
    bit[7:0]              s3_ARLEN;
    bit[2:0]              s3_ARSIZE;
    bit[1:0]              s3_ARBURST;
    bit                   s3_ARLOCK;
    bit[3:0]              s3_ARCACHE;
    bit[2:0]              s3_ARPROT;
    bit[3:0]              s3_ARQOS;
    bit[3:0]              s3_ARREGION;
    bit[USER_WIDTH-1:0]   s3_ARUSER;
    bit                   s3_ARVALID;
    bit                  s3_ARREADY;
//读数据通道
    bit                  s3_RVALID;
    bit                   s3_RREADY;
    bit[ID_WIDTH-1:0]    s3_RID;
    bit[DATA_WIDTH-1:0]  s3_RDATA;
    bit[1:0]             s3_RRESP;
    bit                  s3_RLAST;
    bit                  s3_RUSER;
    
/********** 0号从机 **********/
//写地址
    bit                  m0_AWVALID;
    bit	   	            m0_AWREADY;
    bit[ID_WIDTH-1:0]    m0_AWID;
    bit[ADDR_WIDTH-1:0]	m0_AWADDR;
    bit[7:0]             m0_AWLEN;
    bit[2:0]             m0_AWSIZE;
    bit[1:0]             m0_AWBURST;
    bit                  m0_AWLOCK;
    bit[3:0]             m0_AWCACHE;
    bit[2:0]             m0_AWPROT;
    bit[3:0]             m0_AWQOS;
    bit[3:0]             m0_AWREGION;
    bit[USER_WIDTH-1:0]  m0_AWUSER;  
//写数据通道
    bit                  m0_WVALID;
    bit	  		        m0_WREADY;
    //bit     [ID_WIDTH-1:0]   m0_WID;
    bit[DATA_WIDTH-1:0]  m0_WDATA;
    bit[STRB_WIDTH-1:0]  m0_WSTRB;
    bit                  m0_WLAST;
    bit[USER_WIDTH-1:0]  m0_WUSER;
//写响应通道
	bit[ID_WIDTH-1:0]	    m0_BID;
	bit[1:0]	            m0_BRESP;
	bit[USER_WIDTH-1:0]   m0_BUSER;
	bit	     		    m0_BVALID;
    bit                  m0_BREADY;
//读地址通道
    bit                  m0_ARVALID;
	bit	  		        m0_ARREADY;
    bit[ID_WIDTH-1:0]    m0_ARID;    
    bit[ADDR_WIDTH-1:0]  m0_ARADDR;
    bit[7:0]             m0_ARLEN;
    bit[2:0]             m0_ARSIZE;
    bit[1:0]             m0_ARBURST;
    bit                  m0_ARLOCK;
    bit[3:0]             m0_ARCACHE;
    bit[2:0]             m0_ARPROT;
    bit[3:0]             m0_ARQOS;
    bit[3:0]             m0_ARREGION;
    bit[USER_WIDTH-1:0]  m0_ARUSER;
//读数据通道
	bit[ID_WIDTH-1:0]     m0_RID;
	bit[DATA_WIDTH-1:0]   m0_RDATA;
	bit[1:0]	            m0_RRESP;
	bit	  		        m0_RLAST;
	bit[USER_WIDTH-1:0]	m0_RUSER;
	bit	 		        m0_RVALID; 
    bit                  m0_RREADY;
    
/********** 1号从机 **********/
//写地址
    bit                  m1_AWVALID;
    bit	   	            m1_AWREADY;
    bit[ID_WIDTH-1:0]    m1_AWID;
    bit[ADDR_WIDTH-1:0]	m1_AWADDR;
    bit[7:0]             m1_AWLEN;
    bit[2:0]             m1_AWSIZE;
    bit[1:0]             m1_AWBURST;
    bit                  m1_AWLOCK;
    bit[3:0]             m1_AWCACHE;
    bit[2:0]             m1_AWPROT;
    bit[3:0]             m1_AWQOS;
    bit[3:0]             m1_AWREGION;
    bit[USER_WIDTH-1:0]  m1_AWUSER;  
//写数据通道
    bit                  m1_WVALID;
    bit	  		        m1_WREADY;
    //bit     [ID_WIDTH-1:0]   m1_WID;
    bit[DATA_WIDTH-1:0]  m1_WDATA;
    bit[STRB_WIDTH-1:0]  m1_WSTRB;
    bit                  m1_WLAST;
    bit[USER_WIDTH-1:0]  m1_WUSER;
//写响应通道
	bit[ID_WIDTH-1:0]	    m1_BID;
	bit[1:0]	            m1_BRESP;
	bit[USER_WIDTH-1:0]   m1_BUSER;
	bit	     		    m1_BVALID;
    bit                  m1_BREADY;
//读地址通道
    bit                  m1_ARVALID;
	bit	  		        m1_ARREADY;
    bit[ID_WIDTH-1:0]    m1_ARID;    
    bit[ADDR_WIDTH-1:0]  m1_ARADDR;
    bit[7:0]             m1_ARLEN;
    bit[2:0]             m1_ARSIZE;
    bit[1:0]             m1_ARBURST;
    bit                  m1_ARLOCK;
    bit[3:0]             m1_ARCACHE;
    bit[2:0]             m1_ARPROT;
    bit[3:0]             m1_ARQOS;
    bit[3:0]             m1_ARREGION;
    bit[USER_WIDTH-1:0]  m1_ARUSER;
//读数据通道
	bit[ID_WIDTH-1:0]     m1_RID;
	bit[DATA_WIDTH-1:0]   m1_RDATA;
	bit[1:0]	            m1_RRESP;
	bit	  		        m1_RLAST;
	bit[USER_WIDTH-1:0]	m1_RUSER;
	bit	 		        m1_RVALID; 
    bit                  m1_RREADY;

//AXI initialize
initial begin
    assign s0_AWSIZE = 3'b011;
    assign s0_AWBURST = 2'b01;
    assign s0_AWLOCK = 0;
    assign s0_AWCACHE = 4'd0;
    assign s0_AWPROT = 3'd0;
    assign s0_AWQOS = 4'd0;
    assign s0_AWREGION = 4'd0;
    assign s0_AWUSER = 0;
    //assign s0_AWID = 0;
    assign s0_WSTRB = {STRB_WIDTH{1'b1}};
    assign s0_WUSER = 0;
    assign s0_ARSIZE = 3'b011;
    assign s0_ARBURST = 2'b01;
    assign s0_ARLOCK = 0;
    assign s0_ARCACHE = 4'd0;
    assign s0_ARPROT = 3'd0;
    assign s0_ARQOS = 4'd0;
    assign s0_ARREGION = 4'd0;
    assign s0_ARUSER = 0;
    //assign s0_ARID = 0;

    assign s1_AWSIZE = 3'b011;
    assign s1_AWBURST = 2'b01;
    assign s1_AWLOCK = 0;
    assign s1_AWCACHE = 4'd0;
    assign s1_AWPROT = 3'd0;
    assign s1_AWQOS = 4'd0;
    assign s1_AWREGION = 4'd0;
    assign s1_AWUSER = 0;
    //assign s1_AWID = 1;
    assign s1_WSTRB = {STRB_WIDTH{1'b1}};
    assign s1_WUSER = 0;
    assign s1_ARSIZE = 3'b011;
    assign s1_ARBURST = 2'b01;
    assign s1_ARLOCK = 0;
    assign s1_ARCACHE = 4'd0;
    assign s1_ARPROT = 3'd0;
    assign s1_ARQOS = 4'd0;
    assign s1_ARREGION = 4'd0;
    assign s1_ARUSER = 0;
    //assign s1_ARID = 0;

    assign s2_AWSIZE = 3'b011;
    assign s2_AWBURST = 2'b01;
    assign s2_AWLOCK = 0;
    assign s2_AWCACHE = 4'd0;
    assign s2_AWPROT = 3'd0;
    assign s2_AWQOS = 4'd0;
    assign s2_AWREGION = 4'd0;
    assign s2_AWUSER = 0;
    //assign s2_AWID = 0;
    assign s2_WSTRB = {STRB_WIDTH{1'b1}};
    assign s2_WUSER = 0;
    assign s2_ARSIZE = 3'b011;
    assign s2_ARBURST = 2'b01;
    assign s2_ARLOCK = 0;
    assign s2_ARCACHE = 4'd0;
    assign s2_ARPROT = 3'd0;
    assign s2_ARQOS = 4'd0;
    assign s2_ARREGION = 4'd0;
    assign s2_ARUSER = 0;
    //assign s2_ARID = 0;

    assign s3_AWSIZE = 3'b011;
    assign s3_AWBURST = 2'b01;
    assign s3_AWLOCK = 0;
    assign s3_AWCACHE = 4'd0;
    assign s3_AWPROT = 3'd0;
    assign s3_AWQOS = 4'd0;
    assign s3_AWREGION = 4'd0;
    assign s3_AWUSER = 0;
    //assign s3_AWID = 0;
    assign s3_WSTRB = {STRB_WIDTH{1'b1}};
    assign s3_WUSER = 0;
    assign s3_ARSIZE = 3'b011;
    assign s3_ARBURST = 2'b01;
    assign s3_ARLOCK = 0;
    assign s3_ARCACHE = 4'd0;
    assign s3_ARPROT = 3'd0;
    assign s3_ARQOS = 4'd0;
    assign s3_ARREGION = 4'd0;
    assign s3_ARUSER = 0;
    //assign s3_ARID = 0;
end

//=========================================================
//===============        main code      ===================
//=========================================================
`include "tasks.vh";

initial begin
    automatic bit[63:0] data0[] = {0, 1, 2, 3, 4, 5, 6, 7};
    automatic bit[63:0] data1[] = {8, 9, 10, 11, 12, 13, 14, 15};
    automatic bit[63:0] data2[] = {16, 17, 18, 19, 20, 21, 22, 23};
    automatic bit[63:0] data3[] = {24, 25, 26, 27, 28, 29, 30, 31};
    automatic bit[63:0] get_data0[] = new[8];
    automatic bit[63:0] get_data1[] = new[8];
    automatic bit[63:0] get_data2[] = new[8];
    automatic bit[63:0] get_data3[] = new[8];

    #(2*CLOCK_PERIOD)
        ARESETn = 1;
    #(5*CLOCK_PERIOD)
        fork
            s0_write(0, 0, 7, data0);      //master0写slave0
            s1_write(1, 64, 7, data1);     //master1写slave1
        join
    #(8*CLOCK_PERIOD)
        s0_read(0, 0, 7, get_data0);        //master0读slave0
    #(8*CLOCK_PERIOD)
        s1_read(1, 0+64/8*8, 7, get_data1); //master1读slave0
    #(8*CLOCK_PERIOD)
        s0_write(0, 32'h8000_0000,7, data2);//master0写slave1
    #(8*CLOCK_PERIOD)
        s0_read(0, 32'h8000_0000, 7, get_data2);//master0读slave1
    #(5*CLOCK_PERIOD) $finish;
end

always #(CLOCK_PERIOD/2) ACLK = ~ACLK;

//Instantiation

AXI_Interconnect #(
    .DATA_WIDTH(64),
    .ADDR_WIDTH(32),
    .ID_WIDTH(4),
    .USER_WIDTH(1),
    .STRB_WIDTH(DATA_WIDTH/8)
)    AXI_Interconnect_inst(
    .*
);

AXI_Slave0 #(
    .C_S_AXI_ID_WIDTH(4)
) Slave0(
    .S_AXI_ACLK(ACLK),
    .S_AXI_ARESETN(ARESETn),
	.S_AXI_AWID(m0_AWID),
	.S_AXI_AWADDR(m0_AWADDR),
	.S_AXI_AWLEN(m0_AWLEN),
	.S_AXI_AWSIZE(m0_AWSIZE),
	.S_AXI_AWBURST(m0_AWBURST),
	.S_AXI_AWLOCK(m0_AWLOCK),
	.S_AXI_AWCACHE(m0_AWCACHE),
	.S_AXI_AWPROT(m0_AWPROT),
	.S_AXI_AWQOS(m0_AWQOS),
	.S_AXI_AWREGION(m0_AWREGION),
	.S_AXI_AWUSER(m0_AWUSER),
	.S_AXI_AWVALID(m0_AWVALID),
	.S_AXI_AWREADY(m0_AWREADY),
	.S_AXI_WDATA(m0_WDATA),
	.S_AXI_WSTRB(m0_WSTRB),
	.S_AXI_WLAST(m0_WLAST),
	.S_AXI_WUSER(m0_WUSER),
	.S_AXI_WVALID(m0_WVALID),
	.S_AXI_WREADY(m0_WREADY),
	.S_AXI_BID(m0_BID),
	.S_AXI_BRESP(m0_BRESP),
	.S_AXI_BUSER(m0_BUSER),
	.S_AXI_BVALID(m0_BVALID),
	.S_AXI_BREADY(m0_BREADY),
	.S_AXI_ARID(m0_ARID),
	.S_AXI_ARADDR(m0_ARADDR),
	.S_AXI_ARLEN(m0_ARLEN),
	.S_AXI_ARSIZE(m0_ARSIZE),
	.S_AXI_ARBURST(m0_ARBURST),
	.S_AXI_ARLOCK(m0_ARLOCK),
	.S_AXI_ARCACHE(m0_ARCACHE),
	.S_AXI_ARPROT(m0_ARPROT),
	.S_AXI_ARQOS(m0_ARQOS),
	.S_AXI_ARREGION(m0_ARREGION),
	.S_AXI_ARUSER(m0_ARUSER),
	.S_AXI_ARVALID(m0_ARVALID),
	.S_AXI_ARREADY(m0_ARREADY),
	.S_AXI_RID(m0_RID),
	.S_AXI_RDATA(m0_RDATA),
	.S_AXI_RRESP(m0_RRESP),
	.S_AXI_RLAST(m0_RLAST),
	.S_AXI_RUSER(m0_RUSER),
	.S_AXI_RVALID(m0_RVALID),
	.S_AXI_RREADY(m0_RREADY)
);

AXI_Slave1 #(
    .C_S_AXI_ID_WIDTH(4)
) Slave1(
    .S_AXI_ACLK(ACLK),
    .S_AXI_ARESETN(ARESETn),
	.S_AXI_AWID(m1_AWID),
	.S_AXI_AWADDR(m1_AWADDR),
	.S_AXI_AWLEN(m1_AWLEN),
	.S_AXI_AWSIZE(m1_AWSIZE),
	.S_AXI_AWBURST(m1_AWBURST),
	.S_AXI_AWLOCK(m1_AWLOCK),
	.S_AXI_AWCACHE(m1_AWCACHE),
	.S_AXI_AWPROT(m1_AWPROT),
	.S_AXI_AWQOS(m1_AWQOS),
	.S_AXI_AWREGION(m1_AWREGION),
	.S_AXI_AWUSER(m1_AWUSER),
	.S_AXI_AWVALID(m1_AWVALID),
	.S_AXI_AWREADY(m1_AWREADY),
	.S_AXI_WDATA(m1_WDATA),
	.S_AXI_WSTRB(m1_WSTRB),
	.S_AXI_WLAST(m1_WLAST),
	.S_AXI_WUSER(m1_WUSER),
	.S_AXI_WVALID(m1_WVALID),
	.S_AXI_WREADY(m1_WREADY),
	.S_AXI_BID(m1_BID),
	.S_AXI_BRESP(m1_BRESP),
	.S_AXI_BUSER(m1_BUSER),
	.S_AXI_BVALID(m1_BVALID),
	.S_AXI_BREADY(m1_BREADY),
	.S_AXI_ARID(m1_ARID),
	.S_AXI_ARADDR(m1_ARADDR),
	.S_AXI_ARLEN(m1_ARLEN),
	.S_AXI_ARSIZE(m1_ARSIZE),
	.S_AXI_ARBURST(m1_ARBURST),
	.S_AXI_ARLOCK(m1_ARLOCK),
	.S_AXI_ARCACHE(m1_ARCACHE),
	.S_AXI_ARPROT(m1_ARPROT),
	.S_AXI_ARQOS(m1_ARQOS),
	.S_AXI_ARREGION(m1_ARREGION),
	.S_AXI_ARUSER(m1_ARUSER),
	.S_AXI_ARVALID(m1_ARVALID),
	.S_AXI_ARREADY(m1_ARREADY),
	.S_AXI_RID(m1_RID),
	.S_AXI_RDATA(m1_RDATA),
	.S_AXI_RRESP(m1_RRESP),
	.S_AXI_RLAST(m1_RLAST),
	.S_AXI_RUSER(m1_RUSER),
	.S_AXI_RVALID(m1_RVALID),
	.S_AXI_RREADY(m1_RREADY)
);

endmodule