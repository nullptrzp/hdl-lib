quit -sim
.main clear

vlib ../work
vlib ../work/sim
vlib ../work/src

vmap sim ../work/sim
vmap src ../work/src

vlog -work src ../rtl/*.v
vlog -work sim ../sim/AXI_Slave0.sv ../sim/AXI_Slave1.sv ../sim/testbench.sv

vsim -voptargs=+acc -L sim -L src sim.testbench

#view source
view wave
#view list
#view varibles
#view structrue
view signals
#view all

add wave -divider {clk & reset}
add wave testbench/ACLK
add wave testbench/ARESETn

add wave -divider {Master0}
add wave -color green testbench/m0_AWID
add wave -color green testbench/m0_AWADDR
add wave testbench/m0_AWLEN
add wave testbench/m0_AWSIZE
add wave testbench/m0_AWBURST
add wave testbench/m0_AWLOCK
add wave testbench/m0_AWCACHE
add wave testbench/m0_AWPROT
add wave testbench/m0_AWQOS
add wave testbench/m0_AWREGION
add wave testbench/m0_AWUSER
add wave testbench/m0_AWVALID
add wave testbench/m0_AWREADY
add wave testbench/m0_WDATA
add wave testbench/m0_WSTRB
add wave testbench/m0_WLAST
add wave testbench/m0_WUSER
add wave testbench/m0_WVALID
add wave testbench/m0_WREADY
add wave testbench/m0_BVALID
add wave testbench/m0_BREADY
add wave testbench/m0_ARID
add wave testbench/m0_ARADDR
add wave testbench/m0_ARLEN
add wave testbench/m0_ARSIZE
add wave testbench/m0_ARBURST
add wave testbench/m0_ARLOCK
add wave testbench/m0_ARCACHE
add wave testbench/m0_ARPROT
add wave testbench/m0_ARQOS
add wave testbench/m0_ARREGION
add wave testbench/m0_ARUSER
add wave testbench/m0_ARVALID
add wave testbench/m0_ARREADY
add wave testbench/m0_RVALID
add wave testbench/m0_RREADY

add wave -divider {Master general}
add wave testbench/m_BID
add wave testbench/m_BRESP
add wave testbench/m_BUSER
add wave testbench/m_RID
add wave testbench/m_RDATA
add wave testbench/m_RRESP
add wave testbench/m_RLAST
add wave testbench/m_RUSER

add wave -divider {Master1}
add wave testbench/m1_AWID
add wave testbench/m1_AWADDR
add wave testbench/m1_AWLEN
add wave testbench/m1_AWSIZE
add wave testbench/m1_AWBURST
add wave testbench/m1_AWLOCK
add wave testbench/m1_AWCACHE
add wave testbench/m1_AWPROT
add wave testbench/m1_AWQOS
add wave testbench/m1_AWREGION
add wave testbench/m1_AWUSER
add wave testbench/m1_AWVALID
add wave testbench/m1_AWREADY
add wave testbench/m1_WDATA
add wave testbench/m1_WSTRB
add wave testbench/m1_WLAST
add wave testbench/m1_WUSER
add wave testbench/m1_WVALID
add wave testbench/m1_WREADY
add wave testbench/m1_BVALID
add wave testbench/m1_BREADY
add wave testbench/m1_ARID
add wave testbench/m1_ARADDR
add wave testbench/m1_ARLEN
add wave testbench/m1_ARSIZE
add wave testbench/m1_ARBURST
add wave testbench/m1_ARLOCK
add wave testbench/m1_ARCACHE
add wave testbench/m1_ARPROT
add wave testbench/m1_ARQOS
add wave testbench/m1_ARREGION
add wave testbench/m1_ARUSER
add wave testbench/m1_ARVALID
add wave testbench/m1_ARREADY
add wave testbench/m1_RVALID
add wave testbench/m1_RREADY


add wave -divider {Slave0}
add wave testbench/s0_AWVALID
add wave testbench/s0_AWREADY
add wave testbench/s0_WVALID
add wave testbench/s0_WREADY
add wave testbench/s0_BID
add wave testbench/s0_BRESP
add wave testbench/s0_BUSER
add wave testbench/s0_BVALID
add wave testbench/s0_BREADY
add wave testbench/s0_ARVALID
add wave testbench/s0_ARREADY
add wave testbench/s0_RID
add wave testbench/s0_RDATA
add wave testbench/s0_RRESP
add wave testbench/s0_RLAST
add wave testbench/s0_RUSER
add wave testbench/s0_RVALID
add wave testbench/s0_RREADY

add wave -divider {Slave1}
add wave testbench/s1_AWVALID
add wave testbench/s1_AWREADY
add wave testbench/s1_WVALID
add wave testbench/s1_WREADY
add wave testbench/s1_BID
add wave testbench/s1_BRESP
add wave testbench/s1_BUSER
add wave testbench/s1_BVALID
add wave testbench/s1_BREADY
add wave testbench/s1_ARVALID
add wave testbench/s1_ARREADY
add wave testbench/s1_RID
add wave testbench/s1_RDATA
add wave testbench/s1_RRESP
add wave testbench/s1_RLAST
add wave testbench/s1_RUSER
add wave testbench/s1_RVALID
add wave testbench/s1_RREADY

add wave -divider {Slave General}
add wave testbench/s_AWID
add wave testbench/s_AWADDR
add wave testbench/s_AWLEN
add wave testbench/s_AWSIZE
add wave testbench/s_AWBURST
add wave testbench/s_AWLOCK
add wave testbench/s_AWCACHE
add wave testbench/s_AWPROT
add wave testbench/s_AWQOS
add wave testbench/s_AWREGION
add wave testbench/s_AWUSER
add wave testbench/s_WID
add wave testbench/s_WDATA
add wave testbench/s_WSTRB
add wave testbench/s_WLAST
add wave testbench/s_WUSER
add wave testbench/s_ARID
add wave testbench/s_ARADDR
add wave testbench/s_ARLEN
add wave testbench/s_ARSIZE
add wave testbench/s_ARBURST
add wave testbench/s_ARLOCK
add wave testbench/s_ARCACHE
add wave testbench/s_ARPROT
add wave testbench/s_ARQOS
add wave testbench/s_ARREGION
add wave testbench/s_ARUSER

run 2000ns