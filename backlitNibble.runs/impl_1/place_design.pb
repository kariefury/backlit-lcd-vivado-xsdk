
H
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349
g
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22
G
Running DRC with %s threads
24*drc2
42default:defaultZ23-27
M
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198
\
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199
L

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103
t
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
42default:defaultZ30-611
m

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101
t

Phase %s%s
101*constraints2
1.1 2default:default2.
Placer Initialization Core2default:defaultZ18-101
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:00.012default:default2
00:00:00.022default:default2
1586.1562default:default2
0.0002default:defaultZ17-268
x

Phase %s%s
101*constraints2
1.1.1 2default:default20
Mandatory Logic Optimization2default:defaultZ18-101
^
1Inserted %s IBUFs to IO ports without IO buffers.100*opt2
02default:defaultZ31-140
^
1Inserted %s OBUFs to IO ports without IO buffers.101*opt2
02default:defaultZ31-141
C
Pushed %s inverter(s).
98*opt2
02default:defaultZ31-138
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:00.012default:default2
00:00:00.022default:default2
1586.1562default:default2
0.0002default:defaultZ17-268
J
>Phase 1.1.1 Mandatory Logic Optimization | Checksum: 7bc077ac
*common
�

%s
*constraints2u
aTime (s): cpu = 00:00:00.34 ; elapsed = 00:00:00.35 . Memory (MB): peak = 1586.156 ; gain = 0.0002default:default
�

Phase %s%s
101*constraints2
1.1.2 2default:default2;
'Build Super Logic Region (SLR) Database2default:defaultZ18-101
U
IPhase 1.1.2 Build Super Logic Region (SLR) Database | Checksum: 7bc077ac
*common
�

%s
*constraints2u
aTime (s): cpu = 00:00:00.36 ; elapsed = 00:00:00.36 . Memory (MB): peak = 1586.156 ; gain = 0.0002default:default
k

Phase %s%s
101*constraints2
1.1.3 2default:default2#
Add Constraints2default:defaultZ18-101
=
1Phase 1.1.3 Add Constraints | Checksum: 7bc077ac
*common
�

%s
*constraints2u
aTime (s): cpu = 00:00:00.36 ; elapsed = 00:00:00.37 . Memory (MB): peak = 1586.156 ; gain = 0.0002default:default
s

Phase %s%s
101*constraints2
1.1.4 2default:default2+
Build Shapes/ HD Config2default:defaultZ18-101
j

Phase %s%s
101*constraints2
1.1.4.1 2default:default2 
Build Macros2default:defaultZ18-101
)
%s*constraints2
 2default:default
<
0Phase 1.1.4.1 Build Macros | Checksum: 9419142b
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:01 ; elapsed = 00:00:01 . Memory (MB): peak = 1610.156 ; gain = 24.0002default:default
E
9Phase 1.1.4 Build Shapes/ HD Config | Checksum: 9419142b
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:01 ; elapsed = 00:00:01 . Memory (MB): peak = 1610.156 ; gain = 24.0002default:default
�

Phase %s%s
101*constraints2
1.1.5 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101
m

Phase %s%s
101*constraints2
1.1.5.1 2default:default2#
Pre-Place Cells2default:defaultZ18-101
?
3Phase 1.1.5.1 Pre-Place Cells | Checksum: 6cdcfe66
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:01 ; elapsed = 00:00:01 . Memory (MB): peak = 1610.156 ; gain = 24.0002default:default
~

Phase %s%s
101*constraints2
1.1.5.2 2default:default24
 Implementation Feasibility check2default:defaultZ18-101
P
DPhase 1.1.5.2 Implementation Feasibility check | Checksum: 6cdcfe66
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:03 ; elapsed = 00:00:02 . Memory (MB): peak = 1610.156 ; gain = 24.0002default:default
<
%Done setting XDC timing constraints.
35*timingZ38-35
�

Phase %s%s
101*constraints2
1.1.5.3 2default:default2>
*Implementation Feasibility check On IDelay2default:defaultZ18-101
Z
NPhase 1.1.5.3 Implementation Feasibility check On IDelay | Checksum: 6cdcfe66
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:04 ; elapsed = 00:00:03 . Memory (MB): peak = 1610.156 ; gain = 24.0002default:default
`
TPhase 1.1.5 IO Placement/ Clock Placement/ Build Placer Device | Checksum: d70fb0bb
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:04 ; elapsed = 00:00:03 . Memory (MB): peak = 1610.156 ; gain = 24.0002default:default
v

Phase %s%s
101*constraints2
1.1.6 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101
o

Phase %s%s
101*constraints2
1.1.6.1 2default:default2%
Place Init Design2default:defaultZ18-101
p

Phase %s%s
101*constraints2

1.1.6.1.1 2default:default2$
Build Clock Data2default:defaultZ18-101
C
7Phase 1.1.6.1.1 Build Clock Data | Checksum: 1a18b6e33
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:18 ; elapsed = 00:00:07 . Memory (MB): peak = 1610.156 ; gain = 24.0002default:default
B
6Phase 1.1.6.1 Place Init Design | Checksum: 1c421deb5
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:18 ; elapsed = 00:00:08 . Memory (MB): peak = 1610.156 ; gain = 24.0002default:default
I
=Phase 1.1.6 Build Placer Netlist Model | Checksum: 1c421deb5
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:18 ; elapsed = 00:00:08 . Memory (MB): peak = 1610.156 ; gain = 24.0002default:default
s

Phase %s%s
101*constraints2
1.1.7 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101
~

Phase %s%s
101*constraints2
1.1.7.1 2default:default24
 Constrain Global/Regional Clocks2default:defaultZ18-101
Q
EPhase 1.1.7.1 Constrain Global/Regional Clocks | Checksum: 1c421deb5
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:18 ; elapsed = 00:00:08 . Memory (MB): peak = 1610.156 ; gain = 24.0002default:default
F
:Phase 1.1.7 Constrain Clocks/Macros | Checksum: 1c421deb5
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:18 ; elapsed = 00:00:08 . Memory (MB): peak = 1610.156 ; gain = 24.0002default:default
G
;Phase 1.1 Placer Initialization Core | Checksum: 1c421deb5
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:18 ; elapsed = 00:00:08 . Memory (MB): peak = 1610.156 ; gain = 24.0002default:default
@
4Phase 1 Placer Initialization | Checksum: 1c421deb5
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:18 ; elapsed = 00:00:08 . Memory (MB): peak = 1610.156 ; gain = 24.0002default:default
h

Phase %s%s
101*constraints2
2 2default:default2$
Global Placement2default:defaultZ18-101
;
/Phase 2 Global Placement | Checksum: 13d4c4f59
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:36 ; elapsed = 00:00:16 . Memory (MB): peak = 1610.156 ; gain = 24.0002default:default
h

Phase %s%s
101*constraints2
3 2default:default2$
Detail Placement2default:defaultZ18-101
t

Phase %s%s
101*constraints2
3.1 2default:default2.
Commit Multi Column Macros2default:defaultZ18-101
G
;Phase 3.1 Commit Multi Column Macros | Checksum: 13d4c4f59
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:36 ; elapsed = 00:00:16 . Memory (MB): peak = 1610.156 ; gain = 24.0002default:default
v

Phase %s%s
101*constraints2
3.2 2default:default20
Commit Most Macros & LUTRAMs2default:defaultZ18-101
H
<Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: da625b88
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:40 ; elapsed = 00:00:18 . Memory (MB): peak = 1610.156 ; gain = 24.0002default:default
p

Phase %s%s
101*constraints2
3.3 2default:default2*
Area Swap Optimization2default:defaultZ18-101
C
7Phase 3.3 Area Swap Optimization | Checksum: 10666755f
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:40 ; elapsed = 00:00:18 . Memory (MB): peak = 1610.156 ; gain = 24.0002default:default
o

Phase %s%s
101*constraints2
3.4 2default:default2)
Timing Path Optimizer2default:defaultZ18-101
A
5Phase 3.4 Timing Path Optimizer | Checksum: 8db9bfdd
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:42 ; elapsed = 00:00:19 . Memory (MB): peak = 1610.156 ; gain = 24.0002default:default
z

Phase %s%s
101*constraints2
3.5 2default:default24
 Commit Small Macros & Core Logic2default:defaultZ18-101
M
APhase 3.5 Commit Small Macros & Core Logic | Checksum: 1a1a09443
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:44 ; elapsed = 00:00:21 . Memory (MB): peak = 1634.168 ; gain = 48.0122default:default
l

Phase %s%s
101*constraints2
3.6 2default:default2&
Re-assign LUT pins2default:defaultZ18-101
?
3Phase 3.6 Re-assign LUT pins | Checksum: 1a1a09443
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:44 ; elapsed = 00:00:21 . Memory (MB): peak = 1634.168 ; gain = 48.0122default:default
;
/Phase 3 Detail Placement | Checksum: 1a1a09443
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:44 ; elapsed = 00:00:21 . Memory (MB): peak = 1634.168 ; gain = 48.0122default:default
�

Phase %s%s
101*constraints2
4 2default:default2<
(Post Placement Optimization and Clean-Up2default:defaultZ18-101
m

Phase %s%s
101*constraints2
4.1 2default:default2'
PCOPT Shape updates2default:defaultZ18-101
@
4Phase 4.1 PCOPT Shape updates | Checksum: 11fcba19d
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:44 ; elapsed = 00:00:21 . Memory (MB): peak = 1634.168 ; gain = 48.0122default:default
u

Phase %s%s
101*constraints2
4.2 2default:default2/
Post Placement Optimization2default:defaultZ18-101
~

Phase %s%s
101*constraints2
4.2.1 2default:default26
"Post Placement Timing Optimization2default:defaultZ18-101
�
hPost Placement Timing Summary WNS=%s. For the most accurate timing information please run report_timing.610*place2
2.6652default:defaultZ30-746
Q
EPhase 4.2.1 Post Placement Timing Optimization | Checksum: 1365f02e3
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:47 ; elapsed = 00:00:22 . Memory (MB): peak = 1634.168 ; gain = 48.0122default:default
H
<Phase 4.2 Post Placement Optimization | Checksum: 1365f02e3
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:47 ; elapsed = 00:00:22 . Memory (MB): peak = 1634.168 ; gain = 48.0122default:default
p

Phase %s%s
101*constraints2
4.3 2default:default2*
Post Placement Cleanup2default:defaultZ18-101
C
7Phase 4.3 Post Placement Cleanup | Checksum: 1365f02e3
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:47 ; elapsed = 00:00:22 . Memory (MB): peak = 1634.168 ; gain = 48.0122default:default
j

Phase %s%s
101*constraints2
4.4 2default:default2$
Placer Reporting2default:defaultZ18-101
g

Phase %s%s
101*constraints2
4.4.1 2default:default2
Restore STA2default:defaultZ18-101
:
.Phase 4.4.1 Restore STA | Checksum: 1365f02e3
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:47 ; elapsed = 00:00:22 . Memory (MB): peak = 1634.168 ; gain = 48.0122default:default
=
1Phase 4.4 Placer Reporting | Checksum: 1365f02e3
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:49 ; elapsed = 00:00:23 . Memory (MB): peak = 1634.168 ; gain = 48.0122default:default
q

Phase %s%s
101*constraints2
4.5 2default:default2+
Final Placement Cleanup2default:defaultZ18-101
D
8Phase 4.5 Final Placement Cleanup | Checksum: 15b062b37
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:49 ; elapsed = 00:00:23 . Memory (MB): peak = 1634.168 ; gain = 48.0122default:default
S
GPhase 4 Post Placement Optimization and Clean-Up | Checksum: 15b062b37
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:49 ; elapsed = 00:00:23 . Memory (MB): peak = 1634.168 ; gain = 48.0122default:default
4
(Ending Placer Task | Checksum: d3d1bc3f
*common
�

%s
*constraints2p
\Time (s): cpu = 00:00:49 ; elapsed = 00:00:23 . Memory (MB): peak = 1634.168 ; gain = 48.0122default:default
Q
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
432default:default2
122default:default2
22default:default2
02default:defaultZ4-41
U
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
place_design: 2default:default2
00:00:502default:default2
00:00:252default:default2
1634.1682default:default2
48.0202default:defaultZ17-268
4
Writing XDEF routing.
211*designutilsZ20-211
A
#Writing XDEF routing logical nets.
209*designutilsZ20-209
A
#Writing XDEF routing special nets.
210*designutilsZ20-210
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:00.572default:default2
00:00:00.582default:default2
1634.1722default:default2
0.0002default:defaultZ17-268
�
vreport_utilization: Time (s): cpu = 00:00:00.18 ; elapsed = 00:00:00.21 . Memory (MB): peak = 1634.172 ; gain = 0.000
*common


End Record