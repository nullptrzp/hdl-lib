`timescale 1ns/1ns

module AXI_Master_Mux_R#(
    parameter   DATA_WIDTH  = 1024,
                ADDR_WIDTH  = 64,
                ID_WIDTH    = 8,
                USER_WIDTH  = 8
)(
	//input                       clk,
	//input      	                rstn,
    /********** 0号主控 **********/
    //读地址通道
    input      [ID_WIDTH-1:0]   s0_ARID,
    input      [ADDR_WIDTH-1:0] s0_ARADDR,
    input      [7:0]            s0_ARLEN,
    input      [2:0]            s0_ARSIZE,
    input      [1:0]            s0_ARBURST,
    input                       s0_ARLOCK,
    input      [3:0]            s0_ARCACHE,
    input      [2:0]            s0_ARPROT,
    input      [3:0]            s0_ARQOS,
    input      [3:0]            s0_ARREGION,
    input      [USER_WIDTH-1:0] s0_ARUSER,
    input                       s0_ARVALID,
    output reg                  s0_ARREADY,
    //读数据通道
    output reg                  s0_RVALID,
    input                       s0_RREADY,
    output reg    [ID_WIDTH-1:0]   s0_RID,
	output reg    [DATA_WIDTH-1:0] s0_RDATA,
	output reg    [1:0]	        s0_RRESP,
    output reg                     s0_RLAST,
	output    [USER_WIDTH-1:0]	s0_RUSER,
    /********** 1号主控 **********/
    //读地址通道
    input      [ID_WIDTH-1:0]   s1_ARID,
    input      [ADDR_WIDTH-1:0] s1_ARADDR,
    input      [7:0]            s1_ARLEN,
    input      [2:0]            s1_ARSIZE,
    input      [1:0]            s1_ARBURST,
    input                       s1_ARLOCK,
    input      [3:0]            s1_ARCACHE,
    input      [2:0]            s1_ARPROT,
    input      [3:0]            s1_ARQOS,
    input      [3:0]            s1_ARREGION,
    input      [USER_WIDTH-1:0] s1_ARUSER,
    input                       s1_ARVALID,
    output reg                  s1_ARREADY,
    //读数据通道
    output reg                  s1_RVALID,
    input                       s1_RREADY,
    output reg    [ID_WIDTH-1:0]   s1_RID,
	output reg    [DATA_WIDTH-1:0] s1_RDATA,
	output reg    [1:0]	        s1_RRESP,
    output reg                     s1_RLAST,
	output    [USER_WIDTH-1:0]	s1_RUSER,
    /********** 2号主控 **********/
    //读地址通道
    input      [ID_WIDTH-1:0]   s2_ARID,
    input      [ADDR_WIDTH-1:0] s2_ARADDR,
    input      [7:0]            s2_ARLEN,
    input      [2:0]            s2_ARSIZE,
    input      [1:0]            s2_ARBURST,
    input                       s2_ARLOCK,
    input      [3:0]            s2_ARCACHE,
    input      [2:0]            s2_ARPROT,
    input      [3:0]            s2_ARQOS,
    input      [3:0]            s2_ARREGION,
    input      [USER_WIDTH-1:0] s2_ARUSER,
    input                       s2_ARVALID,
    output reg                  s2_ARREADY,
    //读数据通道
    output reg                  s2_RVALID,
    input                       s2_RREADY,
    output reg    [ID_WIDTH-1:0]   s2_RID,
	output reg    [DATA_WIDTH-1:0] s2_RDATA,
	output reg    [1:0]	        s2_RRESP,
    output reg                     s2_RLAST,
	output     [USER_WIDTH-1:0]	s2_RUSER,
    /********** 3号主控 **********/
    //读地址通道
    input      [ID_WIDTH-1:0]   s3_ARID,
    input      [ADDR_WIDTH-1:0] s3_ARADDR,
    input      [7:0]            s3_ARLEN,
    input      [2:0]            s3_ARSIZE,
    input      [1:0]            s3_ARBURST,
    input                       s3_ARLOCK,
    input      [3:0]            s3_ARCACHE,
    input      [2:0]            s3_ARPROT,
    input      [3:0]            s3_ARQOS,
    input      [3:0]            s3_ARREGION,
    input      [USER_WIDTH-1:0] s3_ARUSER,
    input                       s3_ARVALID,
    output reg                  s3_ARREADY,
    //读数据通道
    output reg                  s3_RVALID,
    input                       s3_RREADY,
    output reg    [ID_WIDTH-1:0]   s3_RID,
	output reg    [DATA_WIDTH-1:0] s3_RDATA,
	output reg    [1:0]	        s3_RRESP,
    output reg                     s3_RLAST,
	output    [USER_WIDTH-1:0]	s3_RUSER,
    //===============内部信号==================
    //读地址通道
    output reg [ID_WIDTH-1:0]   s2m_ARID,
    output reg [ADDR_WIDTH-1:0] s2m_ARADDR,
    output reg [7:0]            s2m_ARLEN,
    output reg [2:0]            s2m_ARSIZE,
    output reg [1:0]            s2m_ARBURST,
    output reg                  s2m_ARLOCK,
    output reg [3:0]            s2m_ARCACHE,
    output reg [2:0]            s2m_ARPROT,
    output reg [3:0]            s2m_ARQOS,
    output reg [3:0]            s2m_ARREGION,
    output reg [USER_WIDTH-1:0] s2m_ARUSER,
    output reg                  s2m_ARVALID,
    input                       s2m_ARREADY,
    //读数据通道
    output reg                  s2m_RREADY,
    input                       s2m_RVALID,
    input     [ID_WIDTH-1:0]   s2m_RID,
	input     [DATA_WIDTH-1:0] s2m_RDATA,
	input     [1:0]	        s2m_RRESP,
    input                      s2m_RLAST,
	input     [USER_WIDTH-1:0]	s2m_RUSER,
    
    input                       s0_rgrnt,
	input                       s1_rgrnt,
    input                       s2_rgrnt,
    input                       s3_rgrnt
);

always @(*) begin
    case({s0_rgrnt,s1_rgrnt,s2_rgrnt,s3_rgrnt})
        4'b1000: begin
            s2m_ARID      =   s0_ARID;
            s2m_ARADDR    =   s0_ARADDR;
            s2m_ARLEN     =   s0_ARLEN;
            s2m_ARSIZE    =   s0_ARSIZE;
            s2m_ARBURST   =   s0_ARBURST;
            s2m_ARLOCK    =   s0_ARLOCK;
            s2m_ARCACHE   =   s0_ARCACHE;
            s2m_ARPROT    =   s0_ARPROT;
            s2m_ARQOS     =   s0_ARQOS;
            s2m_ARREGION  =   s0_ARREGION;
            s2m_ARUSER    =   s0_ARUSER;
            s2m_ARVALID   =   s0_ARVALID;
            s2m_RREADY    =   s0_RREADY;
        end
        4'b0100: begin
            s2m_ARID      =   s1_ARID;
            s2m_ARADDR    =   s1_ARADDR;
            s2m_ARLEN     =   s1_ARLEN;
            s2m_ARSIZE    =   s1_ARSIZE;
            s2m_ARBURST   =   s1_ARBURST;
            s2m_ARLOCK    =   s1_ARLOCK;
            s2m_ARCACHE   =   s1_ARCACHE;
            s2m_ARPROT    =   s1_ARPROT;
            s2m_ARQOS     =   s1_ARQOS;
            s2m_ARREGION  =   s1_ARREGION;
            s2m_ARUSER    =   s1_ARUSER;
            s2m_ARVALID   =   s1_ARVALID;
            s2m_RREADY    =   s1_RREADY;
        end
        4'b0010: begin
            s2m_ARID      =   s2_ARID;
            s2m_ARADDR    =   s2_ARADDR;
            s2m_ARLEN     =   s2_ARLEN;
            s2m_ARSIZE    =   s2_ARSIZE;
            s2m_ARBURST   =   s2_ARBURST;
            s2m_ARLOCK    =   s2_ARLOCK;
            s2m_ARCACHE   =   s2_ARCACHE;
            s2m_ARPROT    =   s2_ARPROT;
            s2m_ARQOS     =   s2_ARQOS;
            s2m_ARREGION  =   s2_ARREGION;
            s2m_ARUSER    =   s2_ARUSER;
            s2m_ARVALID   =   s2_ARVALID;
            s2m_RREADY    =   s2_RREADY;
        end
        4'b0001: begin
            s2m_ARID      =   s3_ARID;
            s2m_ARADDR    =   s3_ARADDR;
            s2m_ARLEN     =   s3_ARLEN;
            s2m_ARSIZE    =   s3_ARSIZE;
            s2m_ARBURST   =   s3_ARBURST;
            s2m_ARLOCK    =   s3_ARLOCK;
            s2m_ARCACHE   =   s3_ARCACHE;
            s2m_ARPROT    =   s3_ARPROT;
            s2m_ARQOS     =   s3_ARQOS;
            s2m_ARREGION  =   s3_ARREGION;
            s2m_ARUSER    =   s3_ARUSER;
            s2m_ARVALID   =   s3_ARVALID;
            s2m_RREADY    =   s3_RREADY;
        end
        default: begin
            s2m_ARID      =   0;
            s2m_ARADDR    =   0;
            s2m_ARLEN     =   0;
            s2m_ARSIZE    =   0;
            s2m_ARBURST   =   0;
            s2m_ARLOCK    =   0;
            s2m_ARCACHE   =   0;
            s2m_ARPROT    =   0;
            s2m_ARQOS     =   0;
            s2m_ARREGION  =   0;
            s2m_ARUSER    =   0;
            s2m_ARVALID   =   0;
            s2m_RREADY    =   0;
        end
    endcase
end

//ARREADY信号复用
always @(*) begin
    case({s0_rgrnt,s1_rgrnt,s2_rgrnt,s3_rgrnt})
        4'b1000: begin
            s0_ARREADY  = s2m_ARREADY;
            s1_ARREADY  = 0;
            s2_ARREADY  = 0;
            s3_ARREADY  = 0;
        end
        4'b0100: begin
            s0_ARREADY  = 0;
            s1_ARREADY  = s2m_ARREADY;
            s2_ARREADY  = 0;
            s3_ARREADY  = 0;
        end
        4'b0010: begin
            s0_ARREADY  = 0;
            s1_ARREADY  = 0;
            s2_ARREADY  = s2m_ARREADY;
            s3_ARREADY  = 0;
        end
        4'b0001: begin
            s0_ARREADY  = 0;
            s1_ARREADY  = 0;
            s2_ARREADY  = 0;
            s3_ARREADY  = s2m_ARREADY;
        end
        default: begin
            s0_ARREADY  = 0;
            s1_ARREADY  = 0;
            s2_ARREADY  = 0;
            s3_ARREADY  = 0;
        end
    endcase
end

//RVALID信号复用
always @(*)begin
    case({s0_rgrnt,s1_rgrnt,s2_rgrnt,s3_rgrnt})
        4'b1000: begin
            s0_RVALID  = s2m_RVALID;
            s1_RVALID  = 0;
            s2_RVALID  = 0;
            s3_RVALID  = 0;
        end
        4'b0100: begin
            s0_RVALID  = 0;
            s1_RVALID  = s2m_RVALID;
            s2_RVALID  = 0;
            s3_RVALID  = 0;
        end
        4'b0010: begin
            s0_RVALID  = 0;
            s1_RVALID  = 0;
            s2_RVALID  = s2m_RVALID;
            s3_RVALID  = 0;
        end
        4'b0001: begin
            s0_RVALID  = 0;
            s1_RVALID  = 0;
            s2_RVALID  = 0;
            s3_RVALID  = s2m_RVALID;
        end
        default: begin
            s0_RVALID  = 0;
            s1_RVALID  = 0;
            s2_RVALID  = 0;
            s3_RVALID  = 0;
        end
    endcase
end

//RID信号复用
always @(*) begin
    case({s0_rgrnt,s1_rgrnt,s2_rgrnt,s3_rgrnt})
        4'b1000: begin
            s0_RID  = s2m_RID;
            s1_RID  = 0;
            s2_RID  = 0;
            s3_RID  = 0;
        end
        4'b0100: begin
            s0_ARREADY  = 0;
            s1_ARREADY  = s2m_RID;
            s2_ARREADY  = 0;
            s3_ARREADY  = 0;
        end
        4'b0010: begin
            s0_ARREADY  = 0;
            s1_ARREADY  = 0;
            s2_ARREADY  = s2m_RID;
            s3_ARREADY  = 0;
        end
        4'b0001: begin
            s0_ARREADY  = 0;
            s1_ARREADY  = 0;
            s2_ARREADY  = 0;
            s3_ARREADY  = s2m_RID;
        end
        default: begin
            s0_ARREADY  = 0;
            s1_ARREADY  = 0;
            s2_ARREADY  = 0;
            s3_ARREADY  = 0;
        end
    endcase
end

//RDATA信号复用
always @(*) begin
    case({s0_rgrnt,s1_rgrnt,s2_rgrnt,s3_rgrnt})
        4'b1000: begin
            s0_RDATA  = s2m_RDATA;
            s1_RDATA  = 0;
            s2_RDATA  = 0;
            s3_RDATA  = 0;
        end
        4'b0100: begin
            s0_RDATA  = 0;
            s1_RDATA  = s2m_RDATA;
            s2_RDATA  = 0;
            s3_RDATA  = 0;
        end
        4'b0010: begin
            s0_RDATA  = 0;
            s1_RDATA  = 0;
            s2_RDATA  = s2m_RDATA;
            s3_RDATA  = 0;
        end
        4'b0001: begin
            s0_RDATA  = 0;
            s1_RDATA  = 0;
            s2_RDATA  = 0;
            s3_RDATA  = s2m_RDATA;
        end
        default: begin
            s0_RDATA  = 0;
            s1_RDATA  = 0;
            s2_RDATA  = 0;
            s3_RDATA  = 0;
        end
    endcase
end

//RRESP信号复用
always @(*) begin
    case({s0_rgrnt,s1_rgrnt,s2_rgrnt,s3_rgrnt})
        4'b1000: begin
            s0_RRESP  = s2m_RRESP;
            s1_RRESP  = 0;
            s2_RRESP  = 0;
            s3_RRESP  = 0;
        end
        4'b0100: begin
            s0_RRESP  = 0;
            s1_RRESP  = s2m_RRESP;
            s2_RRESP  = 0;
            s3_RRESP  = 0;
        end
        4'b0010: begin
            s0_RRESP  = 0;
            s1_RRESP  = 0;
            s2_RRESP  = s2m_RRESP;
            s3_RRESP  = 0;
        end
        4'b0001: begin
            s0_RRESP  = 0;
            s1_RRESP  = 0;
            s2_RRESP  = 0;
            s3_RRESP  = s2m_RRESP;
        end
        default: begin
            s0_RRESP  = 0;
            s1_RRESP  = 0;
            s2_RRESP  = 0;
            s3_RRESP  = 0;
        end
    endcase
end

//RLAST信号复用
always @(*) begin
    case({s0_rgrnt,s1_rgrnt,s2_rgrnt,s3_rgrnt})
        4'b1000: begin
            s0_RLAST  = s2m_RLAST;
            s1_RLAST  = 0;
            s2_RLAST  = 0;
            s3_RLAST  = 0;
        end
        4'b0100: begin
            s0_RLAST  = 0;
            s1_RLAST  = s2m_RLAST;
            s2_RLAST  = 0;
            s3_RLAST  = 0;
        end
        4'b0010: begin
            s0_RLAST  = 0;
            s1_RLAST  = 0;
            s2_RLAST  = s2m_RLAST;
            s3_RLAST  = 0;
        end
        4'b0001: begin
            s0_RLAST  = 0;
            s1_RLAST  = 0;
            s2_RLAST  = 0;
            s3_RLAST  = s2m_RLAST;
        end
        default: begin
            s0_RLAST  = 0;
            s1_RLAST  = 0;
            s2_RLAST  = 0;
            s3_RLAST  = 0;
        end
    endcase
end

assign s0_RUSER = 0;
assign s1_RUSER = 0;
assign s2_RUSER = 0;
assign s3_RUSER = 0;

endmodule