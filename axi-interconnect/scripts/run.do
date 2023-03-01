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
#================master0===================
add wave testbench/s0_AWID
add wave testbench/s0_AWADDR
add wave testbench/s0_AWVALID
add wave testbench/s0_AWREADY

add wave testbench/s0_WDATA
add wave testbench/s0_WLAST
add wave testbench/s0_WVALID
add wave testbench/s0_WREADY

add wave testbench/s0_BVALID
add wave testbench/s0_BREADY
add wave testbench/s0_BID

add wave testbench/s0_ARID
add wave testbench/s0_ARADDR
add wave testbench/s0_ARVALID
add wave testbench/s0_ARREADY

add wave testbench/s0_RVALID
add wave testbench/s0_RREADY
add wave testbench/s0_RID
add wave testbench/s0_RDATA
add wave testbench/s0_RLAST

add wave -divider {Master1}
#=============master1================
add wave testbench/s1_AWID
add wave testbench/s1_AWADDR
add wave testbench/s1_AWVALID
add wave testbench/s1_AWREADY

add wave testbench/s1_WDATA
add wave testbench/s1_WLAST
add wave testbench/s1_WVALID
add wave testbench/s1_WREADY

add wave testbench/s1_BVALID
add wave testbench/s1_BREADY
add wave testbench/s1_BID

add wave testbench/s1_ARID
add wave testbench/s1_ARADDR
add wave testbench/s1_ARVALID
add wave testbench/s1_ARREADY

add wave testbench/s1_RVALID
add wave testbench/s1_RREADY
add wave testbench/s1_RID
add wave testbench/s1_RDATA
add wave testbench/s1_RLAST

add wave -divider {Slave0}
#==================slave0========================
add wave testbench/m0_AWVALID
add wave testbench/m0_AWREADY
add wave testbench/m0_AWID
add wave testbench/m0_AWADDR

add wave testbench/m0_WVALID
add wave testbench/m0_WREADY
add wave testbench/m0_WDATA
add wave testbench/m0_WLAST

add wave testbench/m0_BID
add wave testbench/m0_BVALID
add wave testbench/m0_BREADY

add wave testbench/m0_ARVALID
add wave testbench/m0_ARREADY
add wave testbench/m0_ARADDR
add wave testbench/m0_ARID

add wave testbench/m0_RID
add wave testbench/m0_RDATA
add wave testbench/m0_RLAST
add wave testbench/m0_RVALID
add wave testbench/m0_RREADY

add wave -divider {Slave1}
#==================slave1========================
add wave testbench/m1_AWVALID
add wave testbench/m1_AWREADY
add wave testbench/m1_AWID
add wave testbench/m1_AWADDR

add wave testbench/m1_WVALID
add wave testbench/m1_WREADY
add wave testbench/m1_WDATA
add wave testbench/m1_WLAST

add wave testbench/m1_BID
add wave testbench/m1_BVALID
add wave testbench/m1_BREADY

add wave testbench/m1_ARVALID
add wave testbench/m1_ARREADY
add wave testbench/m1_ARADDR
add wave testbench/m1_ARID

add wave testbench/m1_RID
add wave testbench/m1_RDATA
add wave testbench/m1_RLAST
add wave testbench/m1_RVALID
add wave testbench/m1_RREADY

run 2000ns