task s0_write(input bit[ID_WIDTH-1:0] id, input bit[31:0] addr, input bit[BURST_LEN-1:0] len, input bit[63:0] data[]);
    @(posedge ACLK);
        s0_AWID <= id;
        s0_AWLEN <= len;
        s0_AWVALID <= 1;
        s0_WVALID <= 1;
        s0_AWADDR <= addr;
    @(posedge ACLK);
    while(s0_AWREADY == 0) @(posedge ACLK);
    s0_BREADY <= 1;
    s0_AWVALID <= 0;
    while(s0_WREADY == 0) @(posedge ACLK);
    for(int i=0; i<=len; i++) begin
        s0_WDATA <= data[i];
        if(i==len) s0_WLAST <= 1;
        @(posedge ACLK);
        while(s0_WREADY == 0) @(posedge ACLK);
    end
    while(s0_BVALID == 0) @(posedge ACLK);
    s0_BREADY <= 0;
    s0_WVALID <= 0;
    s0_WLAST <= 0;
endtask

task s1_write(input bit[ID_WIDTH-1:0] id, input bit[31:0] addr, input bit[BURST_LEN-1:0] len, input bit[63:0] data[]);
    @(posedge ACLK);
        s1_AWID <= id;
        s1_AWLEN <= len;
        s1_AWVALID <= 1;
        s1_WVALID <= 1;
        s1_AWADDR <= addr;
    @(posedge ACLK);
    while(s1_AWREADY == 0) @(posedge ACLK);
    s1_BREADY <= 1;
    s1_AWVALID <= 0;
    while(s1_WREADY == 0) @(posedge ACLK);
    for(int i=0; i<=len; i++) begin
        s1_WDATA <= data[i];
        if(i==len) s1_WLAST <= 1;
        @(posedge ACLK);
        while(s1_WREADY == 0) @(posedge ACLK);
    end
    while(s1_BVALID == 0) @(posedge ACLK);
    s1_BREADY <= 0;
    s1_WVALID <= 0;
    s1_WLAST <= 0;
endtask

task s2_write(input bit[31:0] addr, input bit[BURST_LEN-1:0] len, input bit[63:0] data[]);
    @(posedge ACLK);
        s2_AWLEN <= len;
        s2_AWVALID <= 1;
        s2_WVALID <= 1;
        s2_AWADDR <= addr;
    @(posedge ACLK);
    while(s2_AWREADY == 0) @(posedge ACLK);
    s2_BREADY <= 1;
    s2_AWVALID <= 0;
    while(s2_WREADY == 0) @(posedge ACLK);
    for(int i=0; i<=len; i++) begin
        s2_WDATA <= data[i];
        if(i==len-1) s2_WLAST <= 1;
        @(posedge ACLK);
        while(s2_WREADY == 0) @(posedge ACLK);
    end
    while(s2_BVALID == 0) @(posedge ACLK);
    s2_BREADY <= 0;
    s2_WVALID <= 0;
    s2_WLAST <= 0;
endtask

task s3_write(input bit[31:0] addr, input bit[BURST_LEN-1:0] len, input bit[63:0] data[]);
    @(posedge ACLK);
        s3_AWLEN <= len;
        s3_AWVALID <= 1;
        s3_WVALID <= 1;
        s3_AWADDR <= addr;
    @(posedge ACLK);
    while(s3_AWREADY == 0) @(posedge ACLK);
    s3_BREADY <= 1;
    s3_AWVALID <= 0;
    while(s3_WREADY == 0) @(posedge ACLK);
    for(int i=0; i<=len; i++) begin
        s3_WDATA <= data[i];
        if(i==len-1) s3_WLAST <= 1;
        @(posedge ACLK);
        while(s3_WREADY == 0) @(posedge ACLK);
    end
    while(s3_BVALID == 0) @(posedge ACLK);
    s3_BREADY <= 0;
    s3_WVALID <= 0;
    s3_WLAST <= 0;
endtask

task automatic s0_read(input bit[ID_WIDTH-1:0] id, input bit[31:0] addr, input bit[BURST_LEN-1:0] len, ref bit[63:0] data[]);
    @(posedge ACLK);
    s0_ARLEN = len;
    s0_ARVALID <= 1;
    s0_ARADDR <= addr;
    @(posedge ACLK);
    while(s0_ARREADY == 0) @(posedge ACLK);
    s0_ARVALID <= 0;
    @(posedge ACLK);
    s0_RREADY <= 1;
    for (int i=0; i<len; i++) begin
        @(posedge ACLK);
        while(((s0_RVALID&s0_RREADY)!=1) || s0_RID!=2'b00) @(posedge ACLK);
        data[i] = s0_RDATA; 
    end
    @(posedge ACLK);
    while(s0_RLAST == 0) @(posedge ACLK);
    @(posedge ACLK);  
    while(s0_RVALID == 1) @(posedge ACLK);
    s0_RREADY <= 0;
endtask

task automatic s1_read(input bit[ID_WIDTH-1:0] id, input bit[31:0] addr, input bit[BURST_LEN-1:0] len, ref bit[63:0] data[]);
    @(posedge ACLK);
    s1_ARLEN = len;
    s1_ARVALID <= 1;
    s1_ARADDR <= addr;
    @(posedge ACLK);
    while(s1_ARREADY == 0) @(posedge ACLK);
    s1_ARVALID <= 0;
    @(posedge ACLK);
    s1_RREADY <= 1;
    for (int i=0; i<len; i++) begin
        @(posedge ACLK);
        while(((s1_RVALID&s1_RREADY)!=1) || s1_RID!=2'b01) @(posedge ACLK);
        data[i] = s1_RDATA;   
    end
    @(posedge ACLK);
    while(s1_RLAST == 0) @(posedge ACLK);
    @(posedge ACLK);
    while(s1_RVALID == 1) @(posedge ACLK);
    s1_RREADY <= 0;
endtask

task automatic s2_read(input bit[31:0] addr, input bit[BURST_LEN-1:0] len, ref bit[63:0] data[]);
    @(posedge ACLK);
    s2_ARLEN = len;
    s2_ARVALID <= 1;
    @(posedge ACLK);
    while(s2_ARREADY == 0) @(posedge ACLK);
    s2_RREADY <= 1;
    s2_ARVALID <= 0;
    while(s2_RVALID == 0) @(posedge ACLK);
    for (int i=0; i<len; i++) begin
        @(posedge ACLK);
        while(s2_RVALID&s2_RREADY != 1) @(posedge ACLK);
        data[i] = s2_RDATA;
    end
    s2_RREADY <= 0;
endtask

task automatic s3_read(input bit[31:0] addr, input bit[BURST_LEN-1:0] len, ref bit[63:0] data[]);
    @(posedge ACLK);
    s3_ARLEN = len;
    s3_ARVALID <= 1;
    @(posedge ACLK);
    while(s3_ARREADY == 0) @(posedge ACLK);
    s3_RREADY <= 1;
    s3_ARVALID <= 0;
    while(s3_RVALID == 0) @(posedge ACLK);
    for (int i=0; i<len; i++) begin
        @(posedge ACLK);
        while(s3_RVALID&s3_RREADY != 1) @(posedge ACLK);
        data[i] = s3_RDATA;
    end
    s3_RREADY <= 0;
endtask