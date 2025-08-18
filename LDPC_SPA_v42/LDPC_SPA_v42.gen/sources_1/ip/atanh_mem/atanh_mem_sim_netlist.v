// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Jul 29 00:45:41 2025
// Host        : LAPTOP-3T4U0UNN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Vivado_files/Master_thesis/LDPC_SPA_v34/LDPC_SPA_v34.gen/sources_1/ip/atanh_mem/atanh_mem_sim_netlist.v
// Design      : atanh_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "atanh_mem,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module atanh_mem
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [11:0]addra;
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
  wire [11:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "12" *) 
  (* C_ADDRB_WIDTH = "12" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "3" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.43867 mW" *) 
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
  (* C_INIT_FILE = "atanh_mem.mem" *) 
  (* C_INIT_FILE_NAME = "atanh_mem.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2049" *) 
  (* C_READ_DEPTH_B = "2049" *) 
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
  (* C_WRITE_DEPTH_A = "2049" *) 
  (* C_WRITE_DEPTH_B = "2049" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  atanh_mem_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[11:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[11:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 43856)
`pragma protect data_block
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
DMI+2nEd1G7Mr5Hd2K3XunMMOVjqciw=
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
