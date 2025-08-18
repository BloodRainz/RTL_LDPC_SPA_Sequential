// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Jul 28 22:35:12 2025
// Host        : LAPTOP-3T4U0UNN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Vivado_files/Master_thesis/LDPC_SPA_v33/LDPC_SPA_v33.gen/sources_1/ip/tanh_mem/tanh_mem_sim_netlist.v
// Design      : tanh_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "tanh_mem,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module tanh_mem
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.3548 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "tanh_mem.mem" *) 
  (* C_INIT_FILE_NAME = "tanh_mem.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "801" *) 
  (* C_READ_DEPTH_B = "801" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "801" *) 
  (* C_WRITE_DEPTH_B = "801" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  tanh_mem_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17968)
`pragma protect data_block
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
fPSL9OTgh0gDU8B92w==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
