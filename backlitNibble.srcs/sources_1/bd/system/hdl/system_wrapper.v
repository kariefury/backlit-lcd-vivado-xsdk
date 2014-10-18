//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.1 (lin64) Build 881834 Fri Apr  4 14:00:25 MDT 2014
//Date        : Tue Oct 14 16:46:39 2014
//Host        : umnak.ece.ucsb.edu running 64-bit CentOS release 6.5 (Final)
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
    rs,
    rw,
    v0);
  input btnCpuReset;
  input clock_rtl;
  output [3:0]db;
  output en;
  output rs;
  output rw;
  output v0;

  wire btnCpuReset;
  wire clock_rtl;
  wire [3:0]db;
  wire en;
  wire rs;
  wire rw;
  wire v0;

system system_i
       (.btnCpuReset(btnCpuReset),
        .clock_rtl(clock_rtl),
        .db(db),
        .en(en),
        .rs(rs),
        .rw(rw),
        .v0(v0));
endmodule
