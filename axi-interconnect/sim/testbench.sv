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

    //m0 AW
    bit[ID_WIDTH-1:0] m0_AWID;
    bit[ADDR_WIDTH-1:0]	m0_AWADDR;
    bit[BURST_LEN-1:0]    m0_AWLEN;
    bit[SIZE-1:0] m0_AWSIZE;
    bit[1:0] m0_AWBURST;
    bit m0_AWLOCK;
    bit[3:0] m0_AWCACHE;
    bit[2:0] m0_AWPROT;
    bit[3:0] m0_AWQOS;
    bit[3:0] m0_AWREGION;
    bit[USER_WIDTH-1:0] m0_AWUSER;
    bit           m0_AWVALID;
    bit           m0_AWREADY;
    //m0 W
    // bit[ID_WIDTH-1:0] m0_WID;
    bit[DATA_WIDTH-1:0] m0_WDATA;
    bit[STRB_WIDTH-1:0] m0_WSTRB;
    bit           m0_WLAST;
    bit[USER_WIDTH-1:0] m0_WUSER;
    bit           m0_WVALID;
    bit           m0_WREADY;
    //m0 B
    bit           m0_BVALID;
    bit           m0_BREADY;
    //m0 AR
    bit[ID_WIDTH-1:0] m0_ARID;
    bit[ADDR_WIDTH-1:0]   m0_ARADDR;
    bit[BURST_LEN-1:0]    m0_ARLEN;
    bit[SIZE-1:0] m0_ARSIZE;
    bit[1:0] m0_ARBURST;
    bit m0_ARLOCK;
    bit[3:0] m0_ARCACHE;
    bit[2:0] m0_ARPROT;
    bit[3:0] m0_ARQOS;
    bit[3:0] m0_ARREGION;
    bit[USER_WIDTH-1:0] m0_ARUSER;
    bit           m0_ARVALID;
    bit           m0_ARREADY;
    //m0 R
    bit           m0_RVALID;
    bit           m0_RREADY;

    //m1 AW
    bit[ID_WIDTH-1:0] m1_AWID;
    bit[ADDR_WIDTH-1:0]	m1_AWADDR;
    bit[BURST_LEN-1:0]    m1_AWLEN;
    bit[SIZE-1:0] m1_AWSIZE;
    bit[1:0] m1_AWBURST;
    bit m1_AWLOCK;
    bit[3:0] m1_AWCACHE;
    bit[2:0] m1_AWPROT;
    bit[3:0] m1_AWQOS;
    bit[3:0] m1_AWREGION;
    bit[USER_WIDTH-1:0] m1_AWUSER;
    bit           m1_AWVALID;
    bit           m1_AWREADY;
    //m1 W
    // bit[ID_WIDTH-1:0] m1_WID;
    bit[DATA_WIDTH-1:0] m1_WDATA;
    bit[STRB_WIDTH-1:0] m1_WSTRB;
    bit           m1_WLAST;
    bit[USER_WIDTH-1:0] m1_WUSER;
    bit           m1_WVALID;
    bit           m1_WREADY;
    //m1 B
    bit           m1_BVALID;
    bit           m1_BREADY;
    //m1 AR
    bit[ID_WIDTH-1:0] m1_ARID;
    bit[ADDR_WIDTH-1:0]   m1_ARADDR;
    bit[BURST_LEN-1:0]    m1_ARLEN;
    bit[SIZE-1:0] m1_ARSIZE;
    bit[1:0] m1_ARBURST;
    bit m1_ARLOCK;
    bit[3:0] m1_ARCACHE;
    bit[2:0] m1_ARPROT;
    bit[3:0] m1_ARQOS;
    bit[3:0] m1_ARREGION;
    bit[USER_WIDTH-1:0] m1_ARUSER;
    bit           m1_ARVALID;
    bit           m1_ARREADY;
    //m1 R
    bit           m1_RVALID;
    bit           m1_RREADY;
    
    //m2 AW
    bit[ID_WIDTH-1:0] m2_AWID;
    bit[ADDR_WIDTH-1:0]	m2_AWADDR;
    bit[BURST_LEN-1:0]    m2_AWLEN;
    bit[SIZE-1:0] m2_AWSIZE;
    bit[1:0] m2_AWBURST;
    bit m2_AWLOCK;
    bit[3:0] m2_AWCACHE;
    bit[2:0] m2_AWPROT;
    bit[3:0] m2_AWQOS;
    bit[3:0] m2_AWREGION;
    bit[USER_WIDTH-1:0] m2_AWUSER;
    bit           m2_AWVALID;
    bit           m2_AWREADY;
    //m2 W
    // bit[ID_WIDTH-1:0] m2_WID;
    bit[DATA_WIDTH-1:0] m2_WDATA;
    bit[STRB_WIDTH-1:0] m2_WSTRB;
    bit           m2_WLAST;
    bit[USER_WIDTH-1:0] m2_WUSER;
    bit           m2_WVALID;
    bit           m2_WREADY;
    //m2 B
    bit           m2_BVALID;
    bit           m2_BREADY;
    //m2 AR
    bit[ID_WIDTH-1:0] m2_ARID;
    bit[ADDR_WIDTH-1:0]   m2_ARADDR;
    bit[BURST_LEN-1:0]    m2_ARLEN;
    bit[SIZE-1:0] m2_ARSIZE;
    bit[1:0] m2_ARBURST;
    bit m2_ARLOCK;
    bit[3:0] m2_ARCACHE;
    bit[2:0] m2_ARPROT;
    bit[3:0] m2_ARQOS;
    bit[3:0] m2_ARREGION;
    bit[USER_WIDTH-1:0] m2_ARUSER;
    bit           m2_ARVALID;
    bit           m2_ARREADY;
    //m2 R
    bit           m2_RVALID;
    bit           m2_RREADY;
    
    //m3 AW
    bit[ID_WIDTH-1:0] m3_AWID;
    bit[ADDR_WIDTH-1:0]	m3_AWADDR;
    bit[BURST_LEN-1:0]    m3_AWLEN;
    bit[SIZE-1:0] m3_AWSIZE;
    bit[1:0] m3_AWBURST;
    bit m3_AWLOCK;
    bit[3:0] m3_AWCACHE;
    bit[2:0] m3_AWPROT;
    bit[3:0] m3_AWQOS;
    bit[3:0] m3_AWREGION;
    bit[USER_WIDTH-1:0] m3_AWUSER;
    bit           m3_AWVALID;
    bit           m3_AWREADY;
    //m3 W
    // bit[ID_WIDTH-1:0] m3_WID;
    bit[DATA_WIDTH-1:0] m3_WDATA;
    bit[STRB_WIDTH-1:0] m3_WSTRB;
    bit           m3_WLAST;
    bit[USER_WIDTH-1:0] m3_WUSER;
    bit           m3_WVALID;
    bit           m3_WREADY;
    //m3 B
    bit           m3_BVALID;
    bit           m3_BREADY;
    //m3 AR
    bit[ID_WIDTH-1:0] m3_ARID;
    bit[ADDR_WIDTH-1:0]   m3_ARADDR;
    bit[BURST_LEN-1:0]    m3_ARLEN;
    bit[SIZE-1:0] m3_ARSIZE;
    bit[1:0] m3_ARBURST;
    bit m3_ARLOCK;
    bit[3:0] m3_ARCACHE;
    bit[2:0] m3_ARPROT;
    bit[3:0] m3_ARQOS;
    bit[3:0] m3_ARREGION;
    bit[USER_WIDTH-1:0] m3_ARUSER;
    bit           m3_ARVALID;
    bit           m3_ARREADY;
    //m1 R
    bit           m3_RVALID;
    bit           m3_RREADY;
     
    //m
    bit[ID_WIDTH-1:0] m_BID;
    bit[1:0] m_BRESP;
    bit[USER_WIDTH-1:0] m_BUSER;
    bit[ID_WIDTH-1:0] m_RID;
	bit  [DATA_WIDTH-1:0] m_RDATA;
    bit[1:0] m_RRESP;
	bit 		    m_RLAST;
    bit[USER_WIDTH-1:0] m_RUSER;

    bit           s0_AWVALID;
    bit  	        s0_AWREADY;
    bit           s0_WVALID;
    bit 		    s0_WREADY;
    bit[ID_WIDTH-1:0] s0_BID;
    bit[1:0] s0_BRESP;
    bit[USER_WIDTH-1:0] s0_BUSER;
	bit    		s0_BVALID;
    bit           s0_BREADY;
    bit           s0_ARVALID;
	bit 		    s0_ARREADY;
    bit[ID_WIDTH-1:0] s0_RID;
	bit  [DATA_WIDTH-1:0] s0_RDATA;
    bit[1:0] s0_RRESP;
	bit 		    s0_RLAST;
    bit[USER_WIDTH-1:0] s0_RUSER;
	bit		    s0_RVALID;  
    bit           s0_RREADY;

    bit           s1_AWVALID;
    bit  	        s1_AWREADY;
    bit           s1_WVALID;
    bit 		    s1_WREADY;
    bit[ID_WIDTH-1:0] s1_BID;
    bit[1:0] s1_BRESP;
    bit[USER_WIDTH-1:0] s1_BUSER;
	bit    		s1_BVALID;
    bit           s1_BREADY;
    bit           s1_ARVALID;
	bit 		    s1_ARREADY;
    bit[ID_WIDTH-1:0] s1_RID;
	bit  [DATA_WIDTH-1:0] s1_RDATA;
    bit[1:0] s1_RRESP;
	bit 		    s1_RLAST;
    bit[USER_WIDTH-1:0] s1_RUSER;
	bit		    s1_RVALID;  
    bit           s1_RREADY;

    bit[ID_WIDTH-1:0] s_AWID;
    bit[ADDR_WIDTH-1:0] s_AWADDR;
    bit[BURST_LEN-1:0] s_AWLEN;
    bit[SIZE-1:0] s_AWSIZE;
    bit[1:0] s_AWBURST;
    bit s_AWLOCK;
    bit[3:0] s_AWCACHE;
    bit[2:0] s_AWPROT;
    bit[3:0] s_AWQOS;
    bit[3:0] s_AWREGION;
    bit[USER_WIDTH-1:0] s_AWUSER;

    bit[ID_WIDTH-1:0] s_WID;
    bit[DATA_WIDTH-1:0] s_WDATA;
    bit[STRB_WIDTH-1:0] s_WSTRB;
    bit s_WLAST;
    bit[USER_WIDTH-1:0] s_WUSER;

    bit[ID_WIDTH-1:0] s_ARID;
    bit[ADDR_WIDTH-1:0] s_ARADDR;
    bit[BURST_LEN-1:0] s_ARLEN;
    bit[SIZE-1:0] s_ARSIZE;
    bit[1:0] s_ARBURST;
    bit s_ARLOCK;
    bit[3:0] s_ARCACHE;
    bit[2:0] s_ARPROT;
    bit[3:0] s_ARQOS;
    bit[3:0] s_ARREGION;
    bit[USER_WIDTH-1:0] s_ARUSER;

//AXI initialize
initial begin
    assign m0_AWSIZE = 3'b011;
    assign m0_AWBURST = 2'b01;
    assign m0_AWLOCK = 0;
    assign m0_AWCACHE = 4'd0;
    assign m0_AWPROT = 3'd0;
    assign m0_AWQOS = 4'd0;
    assign m0_AWREGION = 4'd0;
    assign m0_AWUSER = 0;
    assign m0_AWID = 0;
    assign m0_WSTRB = {STRB_WIDTH{1'b1}};
    assign m0_WUSER = 0;
    assign m0_ARSIZE = 3'b011;
    assign m0_ARBURST = 2'b01;
    assign m0_ARLOCK = 0;
    assign m0_ARCACHE = 4'd0;
    assign m0_ARPROT = 3'd0;
    assign m0_ARQOS = 4'd0;
    assign m0_ARREGION = 4'd0;
    assign m0_ARUSER = 0;

    assign m1_AWSIZE = 3'b011;
    assign m1_AWBURST = 2'b01;
    assign m1_AWLOCK = 0;
    assign m1_AWCACHE = 4'd0;
    assign m1_AWPROT = 3'd0;
    assign m1_AWQOS = 4'd0;
    assign m1_AWREGION = 4'd0;
    assign m1_AWUSER = 0;
    assign m1_AWID = 1;
    assign m1_WSTRB = {STRB_WIDTH{1'b1}};
    assign m1_WUSER = 0;
    assign m1_ARSIZE = 3'b011;
    assign m1_ARBURST = 2'b01;
    assign m1_ARLOCK = 0;
    assign m1_ARCACHE = 4'd0;
    assign m1_ARPROT = 3'd0;
    assign m1_ARQOS = 4'd0;
    assign m1_ARREGION = 4'd0;
    assign m1_ARUSER = 0;

    assign m2_AWSIZE = 3'b011;
    assign m2_AWBURST = 2'b01;
    assign m2_AWLOCK = 0;
    assign m2_AWCACHE = 4'd0;
    assign m2_AWPROT = 3'd0;
    assign m2_AWQOS = 4'd0;
    assign m2_AWREGION = 4'd0;
    assign m2_AWUSER = 0;
    assign m2_WSTRB = {STRB_WIDTH{1'b1}};
    assign m2_WUSER = 0;
    assign m2_ARSIZE = 3'b011;
    assign m2_ARBURST = 2'b01;
    assign m2_ARLOCK = 0;
    assign m2_ARCACHE = 4'd0;
    assign m2_ARPROT = 3'd0;
    assign m2_ARQOS = 4'd0;
    assign m2_ARREGION = 4'd0;
    assign m2_ARUSER = 0;

    assign m3_AWSIZE = 3'b011;
    assign m3_AWBURST = 2'b01;
    assign m3_AWLOCK = 0;
    assign m3_AWCACHE = 4'd0;
    assign m3_AWPROT = 3'd0;
    assign m3_AWQOS = 4'd0;
    assign m3_AWREGION = 4'd0;
    assign m3_AWUSER = 0;
    assign m3_WSTRB = {STRB_WIDTH{1'b1}};
    assign m3_WUSER = 0;
    assign m3_ARSIZE = 3'b011;
    assign m3_ARBURST = 2'b01;
    assign m3_ARLOCK = 0;
    assign m3_ARCACHE = 4'd0;
    assign m3_ARPROT = 3'd0;
    assign m3_ARQOS = 4'd0;
    assign m3_ARREGION = 4'd0;
    assign m3_ARUSER = 0;
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
            m0_write(0, 7, data0);      //m0写s0
            m1_write(32'h8000_0000, 7, data1);    //m1写s1
        join
    #(8*CLOCK_PERIOD)
        m0_write(0+64/8*8, 7, data2);      //m0写s0
    #(8*CLOCK_PERIOD)
        m0_read(0, 7, get_data0);
    #(8*CLOCK_PERIOD)
        m1_read(0+64/8*8, 7, get_data1);
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
	.S_AXI_AWID(s_AWID),
	.S_AXI_AWADDR(s_AWADDR),
	.S_AXI_AWLEN(s_AWLEN),
	.S_AXI_AWSIZE(s_AWSIZE),
	.S_AXI_AWBURST(s_AWBURST),
	.S_AXI_AWLOCK(s_AWLOCK),
	.S_AXI_AWCACHE(s_AWCACHE),
	.S_AXI_AWPROT(s_AWPROT),
	.S_AXI_AWQOS(s_AWQOS),
	.S_AXI_AWREGION(s_AWREGION),
	.S_AXI_AWUSER(s_AWUSER),
	.S_AXI_AWVALID(s0_AWVALID),
	.S_AXI_AWREADY(s0_AWREADY),
	.S_AXI_WDATA(s_WDATA),
	.S_AXI_WSTRB(s_WSTRB),
	.S_AXI_WLAST(s_WLAST),
	.S_AXI_WUSER(s_WUSER),
	.S_AXI_WVALID(s0_WVALID),
	.S_AXI_WREADY(s0_WREADY),
	.S_AXI_BID(s0_BID),
	.S_AXI_BRESP(s0_BRESP),
	.S_AXI_BUSER(s0_BUSER),
	.S_AXI_BVALID(s0_BVALID),
	.S_AXI_BREADY(s0_BREADY),
	.S_AXI_ARID(s_ARID),
	.S_AXI_ARADDR(s_ARADDR),
	.S_AXI_ARLEN(s_ARLEN),
	.S_AXI_ARSIZE(s_ARSIZE),
	.S_AXI_ARBURST(s_ARBURST),
	.S_AXI_ARLOCK(s_ARLOCK),
	.S_AXI_ARCACHE(s_ARCACHE),
	.S_AXI_ARPROT(s_ARPROT),
	.S_AXI_ARQOS(s_ARQOS),
	.S_AXI_ARREGION(s_ARREGION),
	.S_AXI_ARUSER(s_ARUSER),
	.S_AXI_ARVALID(s0_ARVALID),
	.S_AXI_ARREADY(s0_ARREADY),
	.S_AXI_RID(s0_RID),
	.S_AXI_RDATA(s0_RDATA),
	.S_AXI_RRESP(s0_RRESP),
	.S_AXI_RLAST(s0_RLAST),
	.S_AXI_RUSER(s0_RUSER),
	.S_AXI_RVALID(s0_RVALID),
	.S_AXI_RREADY(s0_RREADY)
);

AXI_Slave1 #(
    .C_S_AXI_ID_WIDTH(4)
) Slave1(
    .S_AXI_ACLK(ACLK),
    .S_AXI_ARESETN(ARESETn),
	.S_AXI_AWID(s_AWID),
	.S_AXI_AWADDR(s_AWADDR),
	.S_AXI_AWLEN(s_AWLEN),
	.S_AXI_AWSIZE(s_AWSIZE),
	.S_AXI_AWBURST(s_AWBURST),
	.S_AXI_AWLOCK(s_AWLOCK),
	.S_AXI_AWCACHE(s_AWCACHE),
	.S_AXI_AWPROT(s_AWPROT),
	.S_AXI_AWQOS(s_AWQOS),
	.S_AXI_AWREGION(s_AWREGION),
	.S_AXI_AWUSER(s_AWUSER),
	.S_AXI_AWVALID(s1_AWVALID),
	.S_AXI_AWREADY(s1_AWREADY),
	.S_AXI_WDATA(s_WDATA),
	.S_AXI_WSTRB(s_WSTRB),
	.S_AXI_WLAST(s_WLAST),
	.S_AXI_WUSER(s_WUSER),
	.S_AXI_WVALID(s1_WVALID),
	.S_AXI_WREADY(s1_WREADY),
	.S_AXI_BID(s1_BID),
	.S_AXI_BRESP(s1_BRESP),
	.S_AXI_BUSER(s1_BUSER),
	.S_AXI_BVALID(s1_BVALID),
	.S_AXI_BREADY(s1_BREADY),
	.S_AXI_ARID(s_ARID),
	.S_AXI_ARADDR(s_ARADDR),
	.S_AXI_ARLEN(s_ARLEN),
	.S_AXI_ARSIZE(s_ARSIZE),
	.S_AXI_ARBURST(s_ARBURST),
	.S_AXI_ARLOCK(s_ARLOCK),
	.S_AXI_ARCACHE(s_ARCACHE),
	.S_AXI_ARPROT(s_ARPROT),
	.S_AXI_ARQOS(s_ARQOS),
	.S_AXI_ARREGION(s_ARREGION),
	.S_AXI_ARUSER(s_ARUSER),
	.S_AXI_ARVALID(s1_ARVALID),
	.S_AXI_ARREADY(s1_ARREADY),
	.S_AXI_RID(s1_RID),
	.S_AXI_RDATA(s1_RDATA),
	.S_AXI_RRESP(s1_RRESP),
	.S_AXI_RLAST(s1_RLAST),
	.S_AXI_RUSER(s1_RUSER),
	.S_AXI_RVALID(s1_RVALID),
	.S_AXI_RREADY(s1_RREADY)
);

endmodule