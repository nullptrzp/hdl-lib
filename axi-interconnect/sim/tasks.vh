task m0_write(input bit[31:0] addr, input bit[BURST_LEN-1:0] len, input bit[63:0] data[]);
    @(posedge ACLK);
        m0_AWLEN <= len;
        m0_AWVALID <= 1;
        m0_WVALID <= 1;
        m0_AWADDR <= addr;
    @(posedge ACLK);
    while(m0_AWREADY == 0) @(posedge ACLK);
    m0_BREADY <= 1;
    m0_AWVALID <= 0;
    while(m0_WREADY == 0) @(posedge ACLK);
    for(int i=0; i<=len; i++) begin
        m0_WDATA <= data[i];
        if(i==len) m0_WLAST <= 1;
        @(posedge ACLK);
        while(m0_WREADY == 0) @(posedge ACLK);
    end
    while(m0_BVALID == 0) @(posedge ACLK);
    m0_BREADY <= 0;
    m0_WVALID <= 0;
    m0_WLAST <= 0;
endtask

task m1_write(input bit[31:0] addr, input bit[BURST_LEN-1:0] len, input bit[63:0] data[]);
    @(posedge ACLK);
        m1_AWLEN <= len;
        m1_AWVALID <= 1;
        m1_WVALID <= 1;
        m1_AWADDR <= addr;
    @(posedge ACLK);
    while(m1_AWREADY == 0) @(posedge ACLK);
    m1_BREADY <= 1;
    m1_AWVALID <= 0;
    while(m1_WREADY == 0) @(posedge ACLK);
    for(int i=0; i<=len; i++) begin
        m1_WDATA <= data[i];
        if(i==len) m1_WLAST <= 1;
        @(posedge ACLK);
        while(m1_WREADY == 0) @(posedge ACLK);
    end
    while(m1_BVALID == 0) @(posedge ACLK);
    m1_BREADY <= 0;
    m1_WVALID <= 0;
    m1_WLAST <= 0;
endtask

task m2_write(input bit[31:0] addr, input bit[BURST_LEN-1:0] len, input bit[63:0] data[]);
    @(posedge ACLK);
        m2_AWLEN <= len;
        m2_AWVALID <= 1;
        m2_WVALID <= 1;
        m2_AWADDR <= addr;
    @(posedge ACLK);
    while(m2_AWREADY == 0) @(posedge ACLK);
    m2_BREADY <= 1;
    m2_AWVALID <= 0;
    while(m2_WREADY == 0) @(posedge ACLK);
    for(int i=0; i<=len; i++) begin
        m2_WDATA <= data[i];
        if(i==len-1) m2_WLAST <= 1;
        @(posedge ACLK);
        while(m2_WREADY == 0) @(posedge ACLK);
    end
    while(m2_BVALID == 0) @(posedge ACLK);
    m2_BREADY <= 0;
    m2_WVALID <= 0;
    m2_WLAST <= 0;
endtask

task m3_write(input bit[31:0] addr, input bit[BURST_LEN-1:0] len, input bit[63:0] data[]);
    @(posedge ACLK);
        m3_AWLEN <= len;
        m3_AWVALID <= 1;
        m3_WVALID <= 1;
        m3_AWADDR <= addr;
    @(posedge ACLK);
    while(m3_AWREADY == 0) @(posedge ACLK);
    m3_BREADY <= 1;
    m3_AWVALID <= 0;
    while(m3_WREADY == 0) @(posedge ACLK);
    for(int i=0; i<=len; i++) begin
        m3_WDATA <= data[i];
        if(i==len-1) m3_WLAST <= 1;
        @(posedge ACLK);
        while(m3_WREADY == 0) @(posedge ACLK);
    end
    while(m3_BVALID == 0) @(posedge ACLK);
    m3_BREADY <= 0;
    m3_WVALID <= 0;
    m3_WLAST <= 0;
endtask

task automatic m0_read(input bit[31:0] addr, input bit[BURST_LEN-1:0] len, ref bit[63:0] data[]);
    @(posedge ACLK);
    m0_ARLEN = len;
    m0_ARVALID <= 1;
    m0_ARADDR <= addr;
    @(posedge ACLK);
    while(m0_ARREADY == 0) @(posedge ACLK);
    m0_ARVALID <= 0;
    @(posedge ACLK);
    m0_RREADY <= 1;
    for (int i=0; i<len; i++) begin
        @(posedge ACLK);
        while(((m0_RVALID&m0_RREADY)!=1) || m_RID!=2'b00) @(posedge ACLK);
        data[i] = m_RDATA; 
    end
    @(posedge ACLK);
    while(m_RLAST == 0) @(posedge ACLK);
    @(posedge ACLK);  
    while(m0_RVALID == 1) @(posedge ACLK);
    m0_RREADY <= 0;
endtask

task automatic m1_read(input bit[31:0] addr, input bit[BURST_LEN-1:0] len, ref bit[63:0] data[]);
    @(posedge ACLK);
    m1_ARLEN = len;
    m1_ARVALID <= 1;
    m1_ARADDR <= addr;
    @(posedge ACLK);
    while(m1_ARREADY == 0) @(posedge ACLK);
    m1_ARVALID <= 0;
    @(posedge ACLK);
    m1_RREADY <= 1;
    for (int i=0; i<len; i++) begin
        @(posedge ACLK);
        while(((m1_RVALID&m1_RREADY)!=1) || m_RID!=2'b01) @(posedge ACLK);
        data[i] = m_RDATA;   
    end
    @(posedge ACLK);
    while(m_RLAST == 0) @(posedge ACLK);
    @(posedge ACLK);
    while(m1_RVALID == 1) @(posedge ACLK);
    m1_RREADY <= 0;
endtask

task automatic m2_read(input bit[31:0] addr, input bit[BURST_LEN-1:0] len, ref bit[63:0] data[]);
    @(posedge ACLK);
    m2_ARLEN = len;
    m2_ARVALID <= 1;
    @(posedge ACLK);
    while(m2_ARREADY == 0) @(posedge ACLK);
    m2_RREADY <= 1;
    m2_ARVALID <= 0;
    while(m2_RVALID == 0) @(posedge ACLK);
    for (int i=0; i<len; i++) begin
        @(posedge ACLK);
        while(m2_RVALID&m2_RREADY != 1) @(posedge ACLK);
        data[i] = m_RDATA;
    end
    m2_RREADY <= 0;
endtask

task automatic m3_read(input bit[31:0] addr, input bit[BURST_LEN-1:0] len, ref bit[63:0] data[]);
    @(posedge ACLK);
    m3_ARLEN = len;
    m3_ARVALID <= 1;
    @(posedge ACLK);
    while(m3_ARREADY == 0) @(posedge ACLK);
    m3_RREADY <= 1;
    m3_ARVALID <= 0;
    while(m3_RVALID == 0) @(posedge ACLK);
    for (int i=0; i<len; i++) begin
        @(posedge ACLK);
        while(m3_RVALID&m3_RREADY != 1) @(posedge ACLK);
        data[i] = m_RDATA;
    end
    m3_RREADY <= 0;
endtask