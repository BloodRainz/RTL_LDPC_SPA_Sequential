// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Jul 21 14:12:19 2025
// Host        : LAPTOP-3T4U0UNN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Vivado_files/Master_thesis/LDPC_SPA_v29/LDPC_SPA_v29.gen/sources_1/ip/hcol_count_mem/hcol_count_mem_sim_netlist.v
// Design      : hcol_count_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "hcol_count_mem,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module hcol_count_mem
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [2:0]douta;

  wire [11:0]addra;
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
  wire [11:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [2:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.1416 mW" *) 
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
  (* C_INIT_FILE = "hcol_count_mem.mem" *) 
  (* C_INIT_FILE_NAME = "hcol_count_mem.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2560" *) 
  (* C_READ_DEPTH_B = "2560" *) 
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
  (* C_WRITE_DEPTH_A = "2560" *) 
  (* C_WRITE_DEPTH_B = "2560" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "3" *) 
  (* C_WRITE_WIDTH_B = "3" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  hcol_count_mem_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17472)
`pragma protect data_block
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
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
