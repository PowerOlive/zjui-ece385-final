
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module project_top(
	//////////// Sma //////////
//	input logic          		SMA_CLKIN,
//	output logic          		SMA_CLKOUT,

	//////////// LED //////////
	output logic     [8:0]		LEDG,
	output logic    [17:0]		LEDR,

	//////////// KEY //////////
	input logic     [3:0]		KEY,

	//////////// EX_IO //////////
//	inout logic     [6:0]		EX_IO,

	//////////// SW //////////
	input logic    [17:0]		SW,

	//////////// SEG7 //////////
	output logic     [6:0]		HEX0,
	output logic     [6:0]		HEX1,
	output logic     [6:0]		HEX2,
	output logic     [6:0]		HEX3,
	output logic     [6:0]		HEX4,
	output logic     [6:0]		HEX5,
	output logic     [6:0]		HEX6,
	output logic     [6:0]		HEX7,

	//////////// LCD //////////
//	output logic          		LCD_BLON,
//	inout logic     [7:0]		LCD_DATA,
//	output logic          		LCD_EN,
//	output logic          		LCD_ON,
//	output logic          		LCD_RS,
//	output logic          		LCD_RW,

	//////////// RS232 //////////
//	input logic          		UART_CTS,
//	output logic          		UART_RTS,
//	input logic          		UART_RXD,
//	output logic          		UART_TXD,

	//////////// PS2 for Keyboard and Mouse //////////
//	inout logic          		PS2_CLK,
//	inout logic          		PS2_CLK2,
//	inout logic          		PS2_DAT,
//	inout logic          		PS2_DAT2,

	//////////// SDCARD //////////
//	output logic          		SD_CLK,
//	inout logic          		SD_CMD,
//	inout logic     [3:0]		SD_DAT,
//	input logic          		SD_WP_N,

	//////////// VGA //////////
	output logic     [7:0]		VGA_B,
	output logic          		VGA_BLANK_N,
	output logic          		VGA_CLK,
	output logic     [7:0]		VGA_G,
	output logic          		VGA_HS,
	output logic     [7:0]		VGA_R,
	output logic          		VGA_SYNC_N,
	output logic          		VGA_VS,

	//////////// Audio //////////
	input logic          		AUD_ADCDAT,
	inout logic          		AUD_ADCLRCK,
	inout logic          		AUD_BCLK,
	output logic          		AUD_DACDAT,
	inout logic          		AUD_DACLRCK,
	output logic          		AUD_XCK,

	//////////// I2C for EEPROM //////////
//	output logic          		EEP_I2C_SCLK,
//	inout logic          		EEP_I2C_SDAT,

	//////////// I2C for Audio Tv-Decoder HSMC  //////////
	output logic          		I2C_SCLK,
	inout logic          		I2C_SDAT,

	//////////// Ethernet 0 //////////
	output logic          		ENET0_GTX_CLK,
	input logic          		ENET0_INT_N,
	input logic          		ENET0_LINK100,
	output logic          		ENET0_MDC,
	inout logic          		ENET0_MDIO,
	output logic          		ENET0_RST_N,
	input logic          		ENET0_RX_CLK,
	input logic          		ENET0_RX_COL,
	input logic          		ENET0_RX_CRS,
	input logic     [3:0]		ENET0_RX_DATA,
	input logic          		ENET0_RX_DV,
	input logic          		ENET0_RX_ER,
	input logic          		ENET0_TX_CLK,
	output logic     [3:0]		ENET0_TX_DATA,
	output logic          		ENET0_TX_EN,
	output logic          		ENET0_TX_ER,
	input logic          		ENETCLK_25,

	//////////// Ethernet 1 //////////
	output logic          		ENET1_GTX_CLK,
	input logic          		ENET1_INT_N,
	input logic          		ENET1_LINK100,
	output logic          		ENET1_MDC,
	inout logic          		ENET1_MDIO,
	output logic          		ENET1_RST_N,
	input logic          		ENET1_RX_CLK,
	input logic          		ENET1_RX_COL,
	input logic          		ENET1_RX_CRS,
	input logic     [3:0]		ENET1_RX_DATA,
	input logic          		ENET1_RX_DV,
	input logic          		ENET1_RX_ER,
	input logic          		ENET1_TX_CLK,
	output logic     [3:0]		ENET1_TX_DATA,
	output logic          		ENET1_TX_EN,
	output logic          		ENET1_TX_ER,

	//////////// TV Decoder //////////
//	input logic          		TD_CLK27,
//	input logic     [7:0]		TD_DATA,
//	input logic          		TD_HS,
//	output logic          		TD_RESET_N,
//	input logic          		TD_VS,

	//////////// USB 2.0 OTG (Cypress CY7C67200) //////////
	output logic     [1:0]		OTG_ADDR,
	output logic          		OTG_CS_N,
	inout           [15:0]		OTG_DATA,
	input logic          		OTG_INT,
	output logic          		OTG_RD_N,
	output logic          		OTG_RST_N,
	output logic          		OTG_WE_N,

	//////////// IR Receiver //////////
//	input logic          		IRDA_RXD,

	//////////// SDRAM //////////
	output logic    [12:0]		DRAM_ADDR,
	output logic     [1:0]		DRAM_BA,
	output logic          		DRAM_CAS_N,
	output logic          		DRAM_CKE,
	output logic          		DRAM_CLK,
	output logic          		DRAM_CS_N,
	inout logic    [31:0]		DRAM_DQ,
	output logic     [3:0]		DRAM_DQM,
	output logic          		DRAM_RAS_N,
	output logic          		DRAM_WE_N,

	//////////// SRAM //////////
	output logic    [19:0]		SRAM_ADDR,
	output logic          		SRAM_CE_N,
	inout logic    [15:0]		SRAM_DQ,
	output logic          		SRAM_LB_N,
	output logic          		SRAM_OE_N,
	output logic          		SRAM_UB_N,
	output logic          		SRAM_WE_N,

	//////////// Flash //////////
//	output logic    [22:0]		FL_ADDR,
//	output logic          		FL_CE_N,
//	inout logic     [7:0]		FL_DQ,
//	output logic          		FL_OE_N,
//	output logic          		FL_RST_N,
//	input logic          		FL_RY,
//	output logic          		FL_WE_N,
//	output logic          		FL_WP_N,

	//////////// GPIO, GPIO connect to GPIO Default //////////
//	inout logic    [35:0]		GPIO,

	//////////// HSMC, HSMC connect to HSMC Default //////////
//	input logic          		HSMC_CLKIN_N1,
//	input logic          		HSMC_CLKIN_N2,
//	input logic          		HSMC_CLKIN_P1,
//	input logic          		HSMC_CLKIN_P2,
//	input logic          		HSMC_CLKIN0,
//	output logic          		HSMC_CLKOUT_N1,
//	output logic          		HSMC_CLKOUT_N2,
//	output logic          		HSMC_CLKOUT_P1,
//	output logic          		HSMC_CLKOUT_P2,
//	output logic          		HSMC_CLKOUT0,
//	inout logic     [3:0]		HSMC_D,
//	inout logic    [16:0]		HSMC_RX_D_N,
//	inout logic    [16:0]		HSMC_RX_D_P,
//	inout logic    [16:0]		HSMC_TX_D_N,
//	inout logic    [16:0]		HSMC_TX_D_P,

	//////////// CLOCK //////////
	input logic          		CLOCK_50,
	input logic          		CLOCK2_50,
	input logic          		CLOCK3_50
);

// Reset signal
logic RESET, RESET_USB;
always_ff @ (posedge CLOCK_50) begin
	RESET <= KEY[0];
	RESET_USB <= KEY[1];
end

// USB OTG
logic [1:0] hpi_addr;
logic [15:0] hpi_data_in, hpi_data_out;
logic hpi_r, hpi_w, hpi_cs, hpi_reset;
hpi_io_intf hpi_io_inst(
	.Clk(CLOCK_50), .Reset(~RESET_USB),
    
	// signals connected to NIOS II
    .from_sw_address(hpi_addr),
    .from_sw_data_in(hpi_data_in),
    .from_sw_data_out(hpi_data_out),
    .from_sw_r(hpi_r),
    .from_sw_w(hpi_w),
    .from_sw_cs(hpi_cs),
    .from_sw_reset(hpi_reset),
    
	// signals connected to EZ-OTG chip
    .OTG_DATA(OTG_DATA),    
    .OTG_ADDR(OTG_ADDR),    
    .OTG_RD_N(OTG_RD_N),    
    .OTG_WR_N(OTG_WE_N),    
    .OTG_CS_N(OTG_CS_N),
    .OTG_RST_N(OTG_RST_N)
);

//logic [15:0] OTG_DATA_OUT;
//assign OTG_DATA = OTG_WE_N ? {16{1'bZ}} : OTG_DATA_OUT;
     

// Hex display
logic[31:0] HEX_EXPORT;
hexdriver hexdrv0 (
	.In(HEX_EXPORT[3:0]),
   .Out(HEX0)
);
hexdriver hexdrv1 (
	.In(HEX_EXPORT[7:4]),
   .Out(HEX1)
);
hexdriver hexdrv2 (
	.In(HEX_EXPORT[11:8]),
   .Out(HEX2)
);
hexdriver hexdrv3 (
	.In(HEX_EXPORT[15:12]),
   .Out(HEX3)
);
hexdriver hexdrv4 (
	.In(HEX_EXPORT[19:16]),
   .Out(HEX4)
);
hexdriver hexdrv5 (
	.In(HEX_EXPORT[23:20]),
   .Out(HEX5)
);
hexdriver hexdrv6 (
	.In(HEX_EXPORT[27:24]),
   .Out(HEX6)
);
hexdriver hexdrv7 (
	.In(HEX_EXPORT[31:28]),
   .Out(HEX7)
);

logic ETH_CLK_125;

// Ethernet 0 external logic

logic ETH0_MDIO_IN, ETH0_MDIO_OEN, ETH0_MDIO_OUT;
assign ETH0_MDIO_IN = ENET0_MDIO;
assign ENET0_MDIO = ETH0_MDIO_OEN ? 1'bZ : ETH0_MDIO_OUT;

assign ENET0_RST_N = RESET;
assign ENET0_TX_ER = 1'b0;

logic ETH0_CLK_TX, ETH0_CLK_RX;

logic [31:0] ETH0_TX_FIFO_DATA;
logic [1:0] ETH0_TX_FIFO_EMPTY;
logic ETH0_TX_FIFO_VALID, ETH0_TX_FIFO_READY, ETH0_TX_FIFO_SOP, ETH0_TX_FIFO_EOP;

logic [7:0] ETH0_TX_DATA;
logic ETH0_TX_VALID, ETH0_TX_READY, ETH0_TX_SOP, ETH0_TX_EOP;

logic [7:0] ETH0_RX_DATA;
logic ETH0_RX_VALID, ETH0_RX_EOP, ETH0_RX_SOP;
logic [2:0] ETH0_RX_ERROR;

eth_mac_1g_rgmii #(
    .ENABLE_PADDING(1),
    .MIN_FRAME_LENGTH(64)
) ETH0 (
    .gtx_clk(ETH_CLK_125),
    .gtx_rst(~RESET),

    .tx_clk(ETH0_CLK_TX),
    .tx_rst(~RESET),
    .tx_axis_tdata(ETH0_TX_DATA),
    .tx_axis_tvalid(ETH0_TX_VALID),
    .tx_axis_tready(ETH0_TX_READY),
    .tx_axis_tlast(ETH0_TX_EOP),

    .rx_clk(ETH0_CLK_RX),
    .rx_rst(~RESET),
    .rx_axis_tdata(ETH0_RX_DATA),
    .rx_axis_tvalid(ETH0_RX_VALID),
    .rx_axis_tlast(ETH0_RX_EOP),
    .rx_axis_tuser(ETH0_RX_ERROR[0]),
	.rx_start_packet(ETH0_RX_SOP),
    .rx_error_bad_frame(ETH0_RX_ERROR[1]),
    .rx_error_bad_fcs(ETH0_RX_ERROR[2]),

    .rgmii_rx_clk(ENET0_RX_CLK),
    .rgmii_rxd(ENET0_RX_DATA),
    .rgmii_rx_ctl(ENET0_RX_DV),
    .rgmii_tx_clk(ENET0_GTX_CLK),
    .rgmii_txd(ENET0_TX_DATA),
    .rgmii_tx_ctl(ENET0_TX_EN),
	
	.ifg_delay(8'd12)
);

// Ethernet 1 external logic

logic ETH1_MDIO_IN, ETH1_MDIO_OEN, ETH1_MDIO_OUT;
assign ETH1_MDIO_IN = ENET1_MDIO;
assign ENET1_MDIO = ETH1_MDIO_OEN ? 1'bZ : ETH1_MDIO_OUT;

assign ENET1_RST_N = RESET;
assign ENET1_TX_ER = 1'b1;

logic ETH1_CLK_TX, ETH1_CLK_RX;

logic [31:0] ETH1_TX_FIFO_DATA;
logic [1:0] ETH1_TX_FIFO_EMPTY;
logic ETH1_TX_FIFO_VALID, ETH1_TX_FIFO_READY, ETH1_TX_FIFO_SOP, ETH1_TX_FIFO_EOP;

logic [7:0] ETH1_TX_DATA;
logic ETH1_TX_VALID, ETH1_TX_READY, ETH1_TX_SOP, ETH1_TX_EOP;

logic [7:0] ETH1_RX_DATA;
logic ETH1_RX_VALID, ETH1_RX_EOP, ETH1_RX_SOP;
logic [2:0] ETH1_RX_ERROR;

eth_mac_1g_rgmii #(
    .ENABLE_PADDING(1),
    .MIN_FRAME_LENGTH(64)
) ETH1 (
    .gtx_clk(ETH_CLK_125),
    .gtx_rst(~RESET),

    .tx_clk(ETH1_CLK_TX),
    .tx_rst(~RESET),
    .tx_axis_tdata(ETH1_TX_DATA),
    .tx_axis_tvalid(ETH1_TX_VALID),
    .tx_axis_tready(ETH1_TX_READY),
    .tx_axis_tlast(ETH1_TX_EOP),

    .rx_clk(ETH1_CLK_RX),
    .rx_rst(~RESET),
    .rx_axis_tdata(ETH1_RX_DATA),
    .rx_axis_tvalid(ETH1_RX_VALID),
    .rx_axis_tlast(ETH1_RX_EOP),
    .rx_axis_tuser(ETH1_RX_ERROR[0]),
	.rx_start_packet(ETH1_RX_SOP),
    .rx_error_bad_frame(ETH1_RX_ERROR[1]),
    .rx_error_bad_fcs(ETH1_RX_ERROR[2]),

    .rgmii_rx_clk(ENET1_RX_CLK),
    .rgmii_rxd(ENET1_RX_DATA),
    .rgmii_rx_ctl(ENET1_RX_DV),
    .rgmii_tx_clk(ENET1_GTX_CLK),
    .rgmii_txd(ENET1_TX_DATA),
    .rgmii_tx_ctl(ENET1_TX_EN),
	
	.ifg_delay(8'd12)
);

// VGA Controller
logic[9:0] VGA_DrawX, VGA_DrawY;
logic [15:0] VGA_VAL;

logic [7:0][11:0] VGA_SPRITE_ADDR;
logic [7:0][15:0] VGA_SPRITE_DATA;
logic [63:0] VGA_SPRITE_ISOBJ;
logic [63:0][15:0] VGA_SPRITE_PIXEL;
logic [31:0] VGA_BG_OFFSET;

VGA_controller VGA(
	.Clk(CLOCK_50), .Reset(~RESET),
	.VGA_HS(VGA_HS), .VGA_VS(VGA_VS), .VGA_CLK, .VGA_BLANK_N(VGA_BLANK_N), .VGA_SYNC_N(VGA_SYNC_N),
	.DrawX(VGA_DrawX), .DrawY(VGA_DrawY)
);

VGA_layer VGA_layer_manager(
	.VGA_VAL,
	.VGA_R(VGA_R), .VGA_G(VGA_G), .VGA_B(VGA_B),
	.VGA_DrawY,
	.VGA_SPRITE_ISOBJ, .VGA_SPRITE_PIXEL
);

logic VGA_entities_manager_read, VGA_entities_manager_write;
logic [7:0] VGA_entities_manager_addr;
logic [31:0] VGA_entities_manager_readdata, VGA_entities_manager_writedata;
logic [255:0][31:0] VGA_entities_export;
VGA_entities VGA_entities_manager (
	.CLK(CLOCK_50), .RESET(~RESET),
	.AVL_READ(VGA_entities_manager_read),
	.AVL_WRITE(VGA_entities_manager_write),
	.AVL_ADDR(VGA_entities_manager_addr),
	.AVL_WRITEDATA(VGA_entities_manager_writedata),
	.AVL_READDATA(VGA_entities_manager_readdata),
	.EXPORT_DATA(VGA_entities_export)
);

genvar i;
generate
	for(i = 0; i < 8; i++) begin: generate_vga_sprites
		VGA_sprite VGA_sprite_instance (
			.Clk(CLOCK_50), .Reset(~RESET),
			.VGA_DrawX, .VGA_DrawY,
			.SpriteX(VGA_entities_export[4*i][19:4]),
			.SpriteY(VGA_entities_export[4*i+1][19:4]),
			.SpriteWidth(VGA_entities_export[4*i+2][15:0]),
			.SpriteHeight(VGA_entities_export[4*i+3][15:0]),
			.AVL_Addr(VGA_SPRITE_ADDR[i]),
			.AVL_ReadData(VGA_SPRITE_DATA[i]),
			.VGA_isObject(VGA_SPRITE_ISOBJ[i]),
			.VGA_Pixel(VGA_SPRITE_PIXEL[i])
		);
	end
	for(i = 8; i < 64; i++) begin: generate_vga_bullets
		bullet bullet_instance (
			.BulletX(VGA_entities_export[4*i][19:4]),
			.BulletY(VGA_entities_export[4*i+1][19:4]),
			.BulletRadius(VGA_entities_export[4*i+2][15:0]),
			.BulletColor(VGA_entities_export[4*i+3][15:0]),
			.DrawX(VGA_DrawX), .DrawY(VGA_DrawY),
			.VGA_isObject(VGA_SPRITE_ISOBJ[i]),
			.VGA_Pixel(VGA_SPRITE_PIXEL[i])
		);
	end
endgenerate

// Wolfson 8731 Music chip
logic [15:0] WM8731_LDATA, WM8731_RDATA;
logic WM8731_DATA_OVER, WM8731_DATA_OVER_PREV;
logic WM8731_READY;
wm8731 wm8731_inst(
	.clk(CLOCK_50), .Reset(~RESET), .INIT(1'b1),
	
	.AUD_ADCDAT(AUD_ADCDAT), .AUD_ADCLRCK(AUD_ADCLRCK), .AUD_BCLK(AUD_BCLK),
	.AUD_DACDAT(AUD_DACDAT), .AUD_DACLRCK(AUD_DACLRCK), .AUD_MCLK(AUD_XCK),
	.I2C_SDAT(I2C_SDAT), .I2C_SCLK(I2C_SCLK),
	
	.LDATA(WM8731_LDATA), .RDATA(WM8731_RDATA),
	.data_over(WM8731_DATA_OVER),
);

// VGA Scrolling & Statusbar
logic [9:0] VGA_RealDrawY;
always_comb begin
	if(VGA_DrawY >= 448) begin
		VGA_RealDrawY = VGA_DrawY;
	end else if(VGA_DrawY + VGA_BG_OFFSET >= 448) begin
		VGA_RealDrawY = VGA_DrawY + VGA_BG_OFFSET - 448;
	end else begin
		VGA_RealDrawY = VGA_DrawY + VGA_BG_OFFSET;
	end
end

// Main system
ECE385 ECE385_sys(
	.clk_clk(CLOCK_50),
	.reset_reset_n(RESET),
	
	.usb_clk_clk(CLOCK_50),
	.usb_reset_reset_n(RESET_USB),
	
	.io_keys_export(KEY),
	.io_led_green_export(LEDG),
	.io_led_red_export(LEDR),
	.io_switches_export(SW),
	.io_hex_export(HEX_EXPORT),
	.io_vga_sync_export(VGA_VS),
	
	.sdram_addr(DRAM_ADDR),
	.sdram_ba(DRAM_BA),
	.sdram_cas_n(DRAM_CAS_N),
	.sdram_cke(DRAM_CKE),
	.sdram_cs_n(DRAM_CS_N),
	.sdram_dq(DRAM_DQ),
	.sdram_dqm(DRAM_DQM),
	.sdram_ras_n(DRAM_RAS_N),
	.sdram_we_n(DRAM_WE_N),
	.nios2_pll_sdram_clk(DRAM_CLK),
	
	.sram_sram_addr(SRAM_ADDR),
	.sram_sram_ce_n(SRAM_CE_N),
	.sram_sram_dq(SRAM_DQ),
	.sram_sram_lb_n(SRAM_LB_N),
	.sram_sram_oe_n(SRAM_OE_N),
	.sram_sram_ub_n(SRAM_UB_N),
	.sram_sram_we_n(SRAM_WE_N),
	
	.vga_vga_val(VGA_VAL),
	.vga_vga_drawx(VGA_DrawX),
	.vga_vga_drawy(VGA_RealDrawY),
	.vga_background_offset_export(VGA_BG_OFFSET),
	.nios2_pll_vga_clk(VGA_CLK),
	
	.vga_sprite_0_clk2_clk(CLOCK_50),
	.vga_sprite_0_reset2_reset(~RESET),
	.vga_sprite_0_s2_address(VGA_SPRITE_ADDR[0]),
	.vga_sprite_0_s2_chipselect(1'b1),
	.vga_sprite_0_s2_clken(1'b1),
	.vga_sprite_0_s2_write(1'b0),
	.vga_sprite_0_s2_readdata(VGA_SPRITE_DATA[0]),
	.vga_sprite_0_s2_writedata(16'b0),
	.vga_sprite_0_s2_byteenable(2'b11),
	
	.vga_sprite_1_clk2_clk(CLOCK_50),
	.vga_sprite_1_reset2_reset(~RESET),
	.vga_sprite_1_s2_address(VGA_SPRITE_ADDR[1]),
	.vga_sprite_1_s2_chipselect(1'b1),
	.vga_sprite_1_s2_clken(1'b1),
	.vga_sprite_1_s2_write(1'b0),
	.vga_sprite_1_s2_readdata(VGA_SPRITE_DATA[1]),
	.vga_sprite_1_s2_writedata(16'b0),
	.vga_sprite_1_s2_byteenable(2'b11),
	
	.vga_sprite_2_clk2_clk(CLOCK_50),
	.vga_sprite_2_reset2_reset(~RESET),
	.vga_sprite_2_s2_address(VGA_SPRITE_ADDR[2]),
	.vga_sprite_2_s2_chipselect(1'b1),
	.vga_sprite_2_s2_clken(1'b1),
	.vga_sprite_2_s2_write(1'b0),
	.vga_sprite_2_s2_readdata(VGA_SPRITE_DATA[2]),
	.vga_sprite_2_s2_writedata(16'b0),
	.vga_sprite_2_s2_byteenable(2'b11),
	
	.vga_sprite_3_clk2_clk(CLOCK_50),
	.vga_sprite_3_reset2_reset(~RESET),
	.vga_sprite_3_s2_address(VGA_SPRITE_ADDR[3]),
	.vga_sprite_3_s2_chipselect(1'b1),
	.vga_sprite_3_s2_clken(1'b1),
	.vga_sprite_3_s2_write(1'b0),
	.vga_sprite_3_s2_readdata(VGA_SPRITE_DATA[3]),
	.vga_sprite_3_s2_writedata(16'b0),
	.vga_sprite_3_s2_byteenable(2'b11),

	.vga_sprite_4_clk2_clk(CLOCK_50),
	.vga_sprite_4_reset2_reset(~RESET),
	.vga_sprite_4_s2_address(VGA_SPRITE_ADDR[4]),
	.vga_sprite_4_s2_chipselect(1'b1),
	.vga_sprite_4_s2_clken(1'b1),
	.vga_sprite_4_s2_write(1'b0),
	.vga_sprite_4_s2_readdata(VGA_SPRITE_DATA[4]),
	.vga_sprite_4_s2_writedata(16'b0),
	.vga_sprite_4_s2_byteenable(2'b11),

	.vga_sprite_5_clk2_clk(CLOCK_50),
	.vga_sprite_5_reset2_reset(~RESET),
	.vga_sprite_5_s2_address(VGA_SPRITE_ADDR[5]),
	.vga_sprite_5_s2_chipselect(1'b1),
	.vga_sprite_5_s2_clken(1'b1),
	.vga_sprite_5_s2_write(1'b0),
	.vga_sprite_5_s2_readdata(VGA_SPRITE_DATA[5]),
	.vga_sprite_5_s2_writedata(16'b0),
	.vga_sprite_5_s2_byteenable(2'b11),

	.vga_sprite_6_clk2_clk(CLOCK_50),
	.vga_sprite_6_reset2_reset(~RESET),
	.vga_sprite_6_s2_address(VGA_SPRITE_ADDR[6]),
	.vga_sprite_6_s2_chipselect(1'b1),
	.vga_sprite_6_s2_clken(1'b1),
	.vga_sprite_6_s2_write(1'b0),
	.vga_sprite_6_s2_readdata(VGA_SPRITE_DATA[6]),
	.vga_sprite_6_s2_writedata(16'b0),
	.vga_sprite_6_s2_byteenable(2'b11),

	.vga_sprite_7_clk2_clk(CLOCK_50),
	.vga_sprite_7_reset2_reset(~RESET),
	.vga_sprite_7_s2_address(VGA_SPRITE_ADDR[7]),
	.vga_sprite_7_s2_chipselect(1'b1),
	.vga_sprite_7_s2_clken(1'b1),
	.vga_sprite_7_s2_write(1'b0),
	.vga_sprite_7_s2_readdata(VGA_SPRITE_DATA[7]),
	.vga_sprite_7_s2_writedata(16'b0),
	.vga_sprite_7_s2_byteenable(2'b11),

	.vga_sprite_params_pass_address(VGA_entities_manager_addr),
	.vga_sprite_params_pass_write(VGA_entities_manager_write),
	.vga_sprite_params_pass_read(VGA_entities_manager_read),
	.vga_sprite_params_pass_readdata(VGA_entities_manager_readdata),
	.vga_sprite_params_pass_writedata(VGA_entities_manager_writedata),
		
	.nios2_pll_ethernet_clk(ETH_CLK_125),
	.eth0_mdio_mdc(ENET0_MDC),
	.eth0_mdio_mdio_in(ETH0_MDIO_IN),
	.eth0_mdio_mdio_out(ETH0_MDIO_OUT),
	.eth0_mdio_mdio_oen(ETH0_MDIO_OEN),
	.eth0_mdio_phy_addr(5'b10000),
	
	.eth0_rx_fifo_in_data(ETH0_RX_DATA),
	.eth0_rx_fifo_in_valid(ETH0_RX_VALID),
	.eth0_rx_fifo_in_startofpacket(ETH0_RX_SOP),
	.eth0_rx_fifo_in_endofpacket(ETH0_RX_EOP),
	.eth0_rx_fifo_in_error(ETH0_RX_ERROR),
	.eth0_rx_fifo_in_clk_clk(ETH0_CLK_RX),
	.eth0_rx_fifo_in_clk_reset_reset_n(RESET),
	
	.eth0_tx_fifo_out_data(ETH0_TX_FIFO_DATA),
	.eth0_tx_fifo_out_valid(ETH0_TX_FIFO_VALID),
	.eth0_tx_fifo_out_ready(ETH0_TX_FIFO_READY),
	.eth0_tx_fifo_out_startofpacket(ETH0_TX_FIFO_SOP),
	.eth0_tx_fifo_out_endofpacket(ETH0_TX_FIFO_EOP),
	.eth0_tx_fifo_out_empty(ETH0_TX_FIFO_EMPTY),
	.eth0_tx_fifo_out_clk_clk(ETH0_CLK_TX),
	.eth0_tx_fifo_out_clk_reset_reset_n(RESET),

	.eth0_tx_dma_buffer_in_0_data(ETH0_TX_FIFO_DATA),
	.eth0_tx_dma_buffer_in_0_valid(ETH0_TX_FIFO_VALID),
	.eth0_tx_dma_buffer_in_0_ready(ETH0_TX_FIFO_READY),
	.eth0_tx_dma_buffer_in_0_startofpacket(ETH0_TX_FIFO_SOP),
	.eth0_tx_dma_buffer_in_0_endofpacket(ETH0_TX_FIFO_EOP),
	.eth0_tx_dma_buffer_in_0_empty(ETH0_TX_FIFO_EMPTY),
	.eth0_tx_dma_buffer_in_clk_0_clk(ETH0_CLK_TX),
	.eth0_tx_dma_buffer_in_rst_0_reset(~RESET),
	.eth0_tx_dma_buffer_out_0_data(ETH0_TX_DATA),
	.eth0_tx_dma_buffer_out_0_valid(ETH0_TX_VALID),
	.eth0_tx_dma_buffer_out_0_ready(ETH0_TX_READY),
	.eth0_tx_dma_buffer_out_0_startofpacket(ETH0_TX_SOP),
	.eth0_tx_dma_buffer_out_0_endofpacket(ETH0_TX_EOP),
		
	.eth1_mdio_mdc(ENET1_MDC),
	.eth1_mdio_mdio_in(ETH1_MDIO_IN),
	.eth1_mdio_mdio_out(ETH1_MDIO_OUT),
	.eth1_mdio_mdio_oen(ETH1_MDIO_OEN),
	.eth1_mdio_phy_addr(5'b10001),
	
	.eth1_rx_fifo_in_data(ETH1_RX_DATA),
	.eth1_rx_fifo_in_valid(ETH1_RX_VALID),
	.eth1_rx_fifo_in_startofpacket(ETH1_RX_SOP),
	.eth1_rx_fifo_in_endofpacket(ETH1_RX_EOP),
	.eth1_rx_fifo_in_error(ETH1_RX_ERROR),
	.eth1_rx_fifo_in_clk_clk(ETH1_CLK_RX),
	.eth1_rx_fifo_in_clk_reset_reset_n(RESET),
	
	.eth1_tx_fifo_out_data(ETH1_TX_FIFO_DATA),
	.eth1_tx_fifo_out_valid(ETH1_TX_FIFO_VALID),
	.eth1_tx_fifo_out_ready(ETH1_TX_FIFO_READY),
	.eth1_tx_fifo_out_startofpacket(ETH1_TX_FIFO_SOP),
	.eth1_tx_fifo_out_endofpacket(ETH1_TX_FIFO_EOP),
	.eth1_tx_fifo_out_empty(ETH1_TX_FIFO_EMPTY),
	.eth1_tx_fifo_out_clk_clk(ETH1_CLK_TX),
	.eth1_tx_fifo_out_clk_reset_reset_n(RESET),

	.eth1_tx_dma_buffer_in_0_data(ETH1_TX_FIFO_DATA),
	.eth1_tx_dma_buffer_in_0_valid(ETH1_TX_FIFO_VALID),
	.eth1_tx_dma_buffer_in_0_ready(ETH1_TX_FIFO_READY),
	.eth1_tx_dma_buffer_in_0_startofpacket(ETH1_TX_FIFO_SOP),
	.eth1_tx_dma_buffer_in_0_endofpacket(ETH1_TX_FIFO_EOP),
	.eth1_tx_dma_buffer_in_0_empty(ETH1_TX_FIFO_EMPTY),
	.eth1_tx_dma_buffer_in_clk_0_clk(ETH1_CLK_TX),
	.eth1_tx_dma_buffer_in_rst_0_reset(~RESET),
	.eth1_tx_dma_buffer_out_0_data(ETH1_TX_DATA),
	.eth1_tx_dma_buffer_out_0_valid(ETH1_TX_VALID),
	.eth1_tx_dma_buffer_out_0_ready(ETH1_TX_READY),
	.eth1_tx_dma_buffer_out_0_startofpacket(ETH1_TX_SOP),
	.eth1_tx_dma_buffer_out_0_endofpacket(ETH1_TX_EOP),

    .otg_hpi_address_export(hpi_addr),
    .otg_hpi_data_in_port(hpi_data_in),
    .otg_hpi_data_out_port(hpi_data_out),
    .otg_hpi_cs_export(hpi_cs),
    .otg_hpi_r_export(hpi_r),
    .otg_hpi_w_export(hpi_w),
    .otg_hpi_reset_export(hpi_reset),

	.audio_pio_export({WM8731_RDATA, WM8731_LDATA})
);
	
endmodule
