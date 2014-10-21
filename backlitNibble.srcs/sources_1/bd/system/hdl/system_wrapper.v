//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.1 (lin64) Build 881834 Fri Apr  4 14:00:25 MDT 2014
//Date        : Mon Oct 20 23:53:50 2014
//Host        : fury running 64-bit Ubuntu 14.04.1 LTS
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (btnCpuReset,
    clock_rtl,
    db,
    en,
    inp,
    rs,
    rw,
    v0);
  input btnCpuReset;
  input clock_rtl;
  output [3:0]db;
  output en;
  output inp;
  output rs;
  output rw;
  output v0;

  wire btnCpuReset;
  wire clock_rtl;
  wire [3:0]db;
  wire en;
  wire inp;
  wire rs;
  wire rw;
  wire v0;

system system_i
       (.btnCpuReset(btnCpuReset),
        .clock_rtl(clock_rtl),
        .db(db),
        .en(en),
        .inp(inp),
        .rs(rs),
        .rw(rw),
        .v0(v0));
endmodule
