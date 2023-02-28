`timescale 1ns/1ns

module AXI_Master_Mux_W#(
    parameter   DATA_WIDTH  = 1024,
                ADDR_WIDTH  = 64,
                ID_WIDTH    = 8,
                USER_WIDTH  = 8,
                STRB_WIDTH  = (DATA_WIDTH/8)
)(
	//input                       clk,
	//input      	                rstn,
    /********** 0号主控 **********/
    //写地址通道
	input[ID_WIDTH-1:0]         s0_AWID,
    input[ADDR_WIDTH-1:0]       s0_AWADDR,
    input[7:0]                  s0_AWLEN,
    input[2:0]                  s0_AWSIZE,
    input[1:0]                  s0_AWBURST,
    input                       s0_AWLOCK,
    input[3:0]                  s0_AWCACHE,
    input[2:0]                  s0_AWPROT,
    input[3:0]                  s0_AWQOS,
    input[3:0]                  s0_AWREGION,
    input[USER_WIDTH-1:0]       s0_AWUSER,
    input                       s0_AWVALID,
    output reg                  s0_AWREADY,
    //写数据通道
    //input      [ID_WIDTH-1:0]   s0_WID,
    input[DATA_WIDTH-1:0]       s0_WDATA,
    input[STRB_WIDTH-1:0]       s0_WSTRB,
    input                       s0_WLAST,
    input[USER_WIDTH-1:0]       s0_WUSER,
    input                       s0_WVALID,
    output reg                  s0_WREADY,
    //写响应通道
    output reg                  s0_BVALID,
    input                       s0_BREADY,
    output reg[ID_WIDTH-1:0]	s0_BID,
	output reg[1:0]	            s0_BRESP,
	output[USER_WIDTH-1:0]      s0_BUSER,
    /********** 1号主控 **********/
    //写地址通道
    input[ID_WIDTH-1:0]         s1_AWID,
    input[ADDR_WIDTH-1:0]	    s1_AWADDR,
    input[7:0]                  s1_AWLEN,
    input[2:0]                  s1_AWSIZE,
    input[1:0]                  s1_AWBURST,
    input                       s1_AWLOCK,
    input[3:0]                  s1_AWCACHE,
    input[2:0]                  s1_AWPROT,
    input[3:0]                  s1_AWQOS,
    input[3:0]                  s1_AWREGION,
    input[USER_WIDTH-1:0]       s1_AWUSER,
    input                       s1_AWVALID,
    output reg                  s1_AWREADY,
    //写数据通道
    //input      [ID_WIDTH-1:0]   s1_WID,
    input[DATA_WIDTH-1:0]       s1_WDATA,
    input[STRB_WIDTH-1:0]       s1_WSTRB,
    input                       s1_WLAST,
    input[USER_WIDTH-1:0]       s1_WUSER,
    input                       s1_WVALID,
    output reg                  s1_WREADY,
    //写响应通道
    output reg                  s1_BVALID,
    input                       s1_BREADY,
    output reg[ID_WIDTH-1:0]	s1_BID,
	output reg[1:0]	            s1_BRESP,
	output[USER_WIDTH-1:0]      s1_BUSER,
    /********** 2号主控 **********/
    //写地址通道
    input[ID_WIDTH-1:0]         s2_AWID,
    input[ADDR_WIDTH-1:0]	    s2_AWADDR,
    input[7:0]                  s2_AWLEN,
    input[2:0]                  s2_AWSIZE,
    input[1:0]                  s2_AWBURST,
    input                       s2_AWLOCK,
    input[3:0]                  s2_AWCACHE,
    input[2:0]                  s2_AWPROT,
    input[3:0]                  s2_AWQOS,
    input[3:0]                  s2_AWREGION,
    input[USER_WIDTH-1:0]       s2_AWUSER,
    input                       s2_AWVALID,
    output reg                  s2_AWREADY,
    //写数据通道
    //input      [ID_WIDTH-1:0]   s2_WID,
    input[DATA_WIDTH-1:0]       s2_WDATA,
    input[STRB_WIDTH-1:0]       s2_WSTRB,
    input                       s2_WLAST,
    input[USER_WIDTH-1:0]       s2_WUSER,
    input                       s2_WVALID,
    output reg                  s2_WREADY,
    //写响应通道
    output reg                  s2_BVALID,
    input                       s2_BREADY,
    output reg[ID_WIDTH-1:0]	s2_BID,
	output reg[1:0]	            s2_BRESP,
	output[USER_WIDTH-1:0]      s2_BUSER,
    /********** 3号主控 **********/
    //写地址通道
    input [ID_WIDTH-1:0]        s3_AWID,
    input[ADDR_WIDTH-1:0]	    s3_AWADDR,
    input[7:0]                  s3_AWLEN,
    input[2:0]                  s3_AWSIZE,
    input[1:0]                  s3_AWBURST,
    input                       s3_AWLOCK,
    input[3:0]                  s3_AWCACHE,
    input[2:0]                  s3_AWPROT,
    input[3:0]                  s3_AWQOS,
    input[3:0]                  s3_AWREGION,
    input[USER_WIDTH-1:0]       s3_AWUSER,
    input                       s3_AWVALID,
    output reg                  s3_AWREADY,
    //写数据通道
    //input      [ID_WIDTH-1:0]   s3_WID,
    input[DATA_WIDTH-1:0]       s3_WDATA,
    input[STRB_WIDTH-1:0]       s3_WSTRB,
    input                       s3_WLAST,
    input[USER_WIDTH-1:0]       s3_WUSER,
    input                       s3_WVALID,
    output reg                  s3_WREADY,
    //写响应通道
    output reg                  s3_BVALID,
    input                       s3_BREADY,
    output reg[ID_WIDTH-1:0]	s3_BID,
	output reg[1:0]	            s3_BRESP,
	output[USER_WIDTH-1:0]      s3_BUSER,
    /******** 左到右通用信号 ********/
    //写地址通道
    output reg[ID_WIDTH-1:0]    s2m_AWID,
    output reg[ADDR_WIDTH-1:0]	s2m_AWADDR,
    output reg[7:0]             s2m_AWLEN,
    output reg[2:0]             s2m_AWSIZE,
    output reg[1:0]             s2m_AWBURST,
    output reg                  s2m_AWLOCK,
    output reg[3:0]             s2m_AWCACHE,
    output reg[2:0]             s2m_AWPROT,
    output reg[3:0]             s2m_AWQOS,
    output reg[3:0]             s2m_AWREGION,
    output reg[USER_WIDTH-1:0]  s2m_AWUSER,
    output reg                  s2m_AWVALID,
    input                       s2m_AWREADY,
    //写数据通道
    //output reg [ID_WIDTH-1:0]   s2m_WID,
    output reg[DATA_WIDTH-1:0]  s2m_WDATA,
    output reg[STRB_WIDTH-1:0]  s2m_WSTRB,
    output reg                  s2m_WLAST,
    output reg[USER_WIDTH-1:0]  s2m_WUSER,
    output reg                  s2m_WVALID,
    input                       s2m_WREADY,
    //写响应通道
    output reg                  s2m_BREADY,
    input                       s2m_BVALID,
    input[ID_WIDTH-1:0]	        s2m_BID,
	input[1:0]	                s2m_BRESP,
	input[USER_WIDTH-1:0]       s2m_BUSER,
    
    input                       s0_wgrnt,
	input                       s1_wgrnt,
    input                       s2_wgrnt,
    input                       s3_wgrnt

);

always @(*) begin
    case({s0_wgrnt,s1_wgrnt,s2_wgrnt,s3_wgrnt})     //判断写入通路的仲裁结果
        4'b1000: begin
            s2m_AWID      =  s0_AWID;
            s2m_AWADDR    =  s0_AWADDR;
            s2m_AWLEN     =  s0_AWLEN;
            s2m_AWSIZE    =  s0_AWSIZE;
            s2m_AWBURST   =  s0_AWBURST;
            s2m_AWLOCK    =  s0_AWLOCK;
            s2m_AWCACHE   =  s0_AWCACHE;
            s2m_AWPROT    =  s0_AWPROT;
            s2m_AWQOS     =  s0_AWQOS;
            s2m_AWREGION  =  s0_AWREGION;
            s2m_AWUSER    =  s0_AWUSER;
            s2m_AWVALID   =  s0_AWVALID;
            //s2m_WID       =  s0_WID;
            s2m_WDATA     =  s0_WDATA;
            s2m_WSTRB     =  s0_WSTRB;
            s2m_WLAST     =  s0_WLAST;
            s2m_WUSER     =  s0_WUSER;
            s2m_WVALID    =  s0_WVALID;
            s2m_BREADY    =  s0_BREADY;
        end
        4'b0100: begin
            s2m_AWID      =  s1_AWID;
            s2m_AWADDR    =  s1_AWADDR;
            s2m_AWLEN     =  s1_AWLEN;
            s2m_AWSIZE    =  s1_AWSIZE;
            s2m_AWBURST   =  s1_AWBURST;
            s2m_AWLOCK    =  s1_AWLOCK;
            s2m_AWCACHE   =  s1_AWCACHE;
            s2m_AWPROT    =  s1_AWPROT;
            s2m_AWQOS     =  s1_AWQOS;
            s2m_AWREGION  =  s1_AWREGION;
            s2m_AWUSER    =  s1_AWUSER;
            s2m_AWVALID   =  s1_AWVALID;
            //s2m_WID       =  s1_WID;
            s2m_WDATA     =  s1_WDATA;
            s2m_WSTRB     =  s1_WSTRB;
            s2m_WLAST     =  s1_WLAST;
            s2m_WUSER     =  s1_WUSER;
            s2m_WVALID    =  s1_WVALID;
            s2m_BREADY    =  s1_BREADY;
        end
        4'b0010: begin
            s2m_AWID      =  s2_AWID;
            s2m_AWADDR    =  s2_AWADDR;
            s2m_AWLEN     =  s2_AWLEN;
            s2m_AWSIZE    =  s2_AWSIZE;
            s2m_AWBURST   =  s2_AWBURST;
            s2m_AWLOCK    =  s2_AWLOCK;
            s2m_AWCACHE   =  s2_AWCACHE;
            s2m_AWPROT    =  s2_AWPROT;
            s2m_AWQOS     =  s2_AWQOS;
            s2m_AWREGION  =  s2_AWREGION;
            s2m_AWUSER    =  s2_AWUSER;
            s2m_AWVALID   =  s2_AWVALID;
            //s2m_WID       =  s2_WID;
            s2m_WDATA     =  s2_WDATA;
            s2m_WSTRB     =  s2_WSTRB;
            s2m_WLAST     =  s2_WLAST;
            s2m_WUSER     =  s2_WUSER;
            s2m_WVALID    =  s2_WVALID;
            s2m_BREADY    =  s2_BREADY;
        end
        4'b0001: begin
            s2m_AWID      =  s3_AWID;
            s2m_AWADDR    =  s3_AWADDR;
            s2m_AWLEN     =  s3_AWLEN;
            s2m_AWSIZE    =  s3_AWSIZE;
            s2m_AWBURST   =  s3_AWBURST;
            s2m_AWLOCK    =  s3_AWLOCK;
            s2m_AWCACHE   =  s3_AWCACHE;
            s2m_AWPROT    =  s3_AWPROT;
            s2m_AWQOS     =  s3_AWQOS;
            s2m_AWREGION  =  s3_AWREGION;
            s2m_AWUSER    =  s3_AWUSER;
            s2m_AWVALID   =  s3_AWVALID;
            //s2m_WID       =  s3_WID;
            s2m_WDATA     =  s3_WDATA;
            s2m_WSTRB     =  s3_WSTRB;
            s2m_WLAST     =  s3_WLAST;
            s2m_WUSER     =  s3_WUSER;
            s2m_WVALID    =  s3_WVALID;
            s2m_BREADY    =  s3_BREADY;
        end
        default: begin
            s2m_AWID      =  0;
            s2m_AWADDR    =  0;
            s2m_AWLEN     =  0;
            s2m_AWSIZE    =  0;
            s2m_AWBURST   =  0;
            s2m_AWLOCK    =  0;
            s2m_AWCACHE   =  0;
            s2m_AWPROT    =  0;
            s2m_AWQOS     =  0;
            s2m_AWREGION  =  0;
            s2m_AWUSER    =  0;
            s2m_AWVALID   =  0;
            //s2m_WID       =  0;
            s2m_WDATA     =  0;
            s2m_WSTRB     =  0;
            s2m_WLAST     =  0;
            s2m_WUSER     =  0;
            s2m_WVALID    =  0;
            s2m_BREADY    =  0;
        end
    endcase
end

//AWREADY信号复用
always @(*) begin
    case({s0_wgrnt,s1_wgrnt,s2_wgrnt,s3_wgrnt})
        4'b1000: begin 
            s0_AWREADY = s2m_AWREADY;
            s1_AWREADY = 0;
            s2_AWREADY = 0;
            s3_AWREADY = 0;
        end
        4'b0100: begin
            s0_AWREADY = 0;
            s1_AWREADY = s2m_AWREADY;
            s2_AWREADY = 0;
            s3_AWREADY = 0;
        end
        4'b0010: begin
            s0_AWREADY = 0;
            s1_AWREADY = 0;
            s2_AWREADY = s2m_AWREADY;
            s3_AWREADY = 0;
        end
        4'b0001: begin
            s0_AWREADY = 0;
            s1_AWREADY = 0;
            s2_AWREADY = 0;
            s3_AWREADY = s2m_AWREADY;
        end
        default: begin
            s0_AWREADY = 0;
            s1_AWREADY = 0;
            s2_AWREADY = 0;
            s3_AWREADY = 0;
        end
    endcase
end

//WREADY信号复用
always @(*) begin
    case({s0_wgrnt,s1_wgrnt,s2_wgrnt,s3_wgrnt})
        4'b1000: begin 
            s0_WREADY = s2m_WREADY;
            s1_WREADY = 0;
            s2_WREADY = 0;
            s3_WREADY = 0;
        end
        4'b0100: begin
            s0_WREADY = 0;
            s1_WREADY = s2m_WREADY;
            s2_WREADY = 0;
            s3_WREADY = 0;
        end
        4'b0010: begin
            s0_WREADY = 0;
            s1_WREADY = 0;
            s2_WREADY = s2m_WREADY;
            s3_WREADY = 0;
        end
        4'b0001: begin
            s0_WREADY = 0;
            s1_WREADY = 0;
            s2_WREADY = 0;
            s3_WREADY = s2m_WREADY;
        end
        default: begin
            s0_WREADY = 0;
            s1_WREADY = 0;
            s2_WREADY = 0;
            s3_WREADY = 0;
        end
    endcase
end    

//BVALID信号复用
always @(*) begin
    case({s0_wgrnt,s1_wgrnt,s2_wgrnt,s3_wgrnt})
        4'b1000: begin 
            s0_BVALID = s2m_BVALID;
            s1_BVALID = 0;
            s2_BVALID = 0;
            s3_BVALID = 0;
        end
        4'b0100: begin
            s0_BVALID = 0;
            s1_BVALID = s2m_BVALID;
            s2_BVALID = 0;
            s3_BVALID = 0;
        end
        4'b0010: begin
            s0_BVALID = 0;
            s1_BVALID = 0;
            s2_BVALID = s2m_BVALID;
            s3_BVALID = 0;
        end
        4'b0001: begin
            s0_BVALID = 0;
            s1_BVALID = 0;
            s2_BVALID = 0;
            s3_BVALID = s2m_BVALID;
        end
        default: begin
            s0_BVALID = 0;
            s1_BVALID = 0;
            s2_BVALID = 0;
            s3_BVALID = 0;
        end
    endcase
end    

//BID信号复用
always @(*) begin
    case({s0_wgrnt,s1_wgrnt,s2_wgrnt,s3_wgrnt})
        4'b1000: begin 
            s0_BID = s2m_BID;
            s1_BID = 0;
            s2_BID = 0;
            s3_BID = 0;
        end
        4'b0100: begin
            s0_BID = 0;
            s1_BID = s2m_BID;
            s2_BID = 0;
            s3_BID = 0;
        end
        4'b0010: begin
            s0_BID = 0;
            s1_BID = 0;
            s2_BID = s2m_BID;
            s3_BID = 0;
        end
        4'b0001: begin
            s0_BID = 0;
            s1_BID = 0;
            s2_BID = 0;
            s3_BID = s2m_BID;
        end
        default: begin
            s0_BID = 0;
            s1_BID = 0;
            s2_BID = 0;
            s3_BID = 0;
        end
    endcase
end    

//BRESP信号复用
always @(*) begin
    case({s0_wgrnt,s1_wgrnt,s2_wgrnt,s3_wgrnt})
        4'b1000: begin 
            s0_BRESP = s2m_BRESP;
            s1_BRESP = 0;
            s2_BRESP = 0;
            s3_BRESP = 0;
        end
        4'b0100: begin
            s0_BRESP = 0;
            s1_BRESP = s2m_BRESP;
            s2_BRESP = 0;
            s3_BRESP = 0;
        end
        4'b0010: begin
            s0_BRESP = 0;
            s1_BRESP = 0;
            s2_BRESP = s2m_BRESP;
            s3_BRESP = 0;
        end
        4'b0001: begin
            s0_BRESP = 0;
            s1_BRESP = 0;
            s2_BRESP = 0;
            s3_BRESP = s2m_BRESP;
        end
        default: begin
            s0_BRESP = 0;
            s1_BRESP = 0;
            s2_BRESP = 0;
            s3_BRESP = 0;
        end
    endcase
end    

assign s0_BUSER = 0;
assign s1_BUSER = 0;
assign s2_BUSER = 0;
assign s3_BUSER = 0;

endmodule