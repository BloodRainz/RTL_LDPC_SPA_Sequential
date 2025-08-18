// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Jul 21 01:54:08 2025
// Host        : LAPTOP-3T4U0UNN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Vivado_files/Master_thesis/LDPC_SPA_v29/LDPC_SPA_v29.gen/sources_1/ip/hrow_count_mem/hrow_count_mem_sim_netlist.v
// Design      : hrow_count_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "hrow_count_mem,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module hrow_count_mem
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [2:0]douta;

  wire [10:0]addra;
  wire clka;
  wire [2:0]douta;
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
  wire [2:0]NLW_U0_doutb_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [2:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.0836 mW" *) 
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
  (* C_INIT_FILE = "hrow_count_mem.mem" *) 
  (* C_INIT_FILE_NAME = "hrow_count_mem.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1536" *) 
  (* C_READ_DEPTH_B = "1536" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "3" *) 
  (* C_READ_WIDTH_B = "3" *) 
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
  (* C_WRITE_DEPTH_A = "1536" *) 
  (* C_WRITE_DEPTH_B = "1536" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "3" *) 
  (* C_WRITE_WIDTH_B = "3" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  hrow_count_mem_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[2:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[2:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17984)
`pragma protect data_block
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
KwWd4g/RBfyPbvi4o28jo96amNWyjuuo5niT0hQ=
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
