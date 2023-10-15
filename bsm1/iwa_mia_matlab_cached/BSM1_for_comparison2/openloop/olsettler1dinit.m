% Same as those used in QSDsan,
% for comparison purpose
TSS_1 = 10;
TSS_2 = 20;
TSS_3 = 40;
TSS_4 = 70;
TSS_5 = 200;
TSS_6 = 300;
TSS_7 = 350;
TSS_8 = 350;
TSS_9 = 2000;
TSS_10 = 4000;

SI_1 = 30;
SI_2 = 30;
SI_3 = 30;
SI_4 = 30;
SI_5 = 30;
SI_6 = 30;
SI_7 = 30;
SI_8 = 30;
SI_9 = 30;
SI_10 = 30;

SS_1 = 5;
SS_2 = 5;
SS_3 = 5;
SS_4 = 5;
SS_5 = 5;
SS_6 = 5;
SS_7 = 5;
SS_8 = 5;
SS_9 = 5;
SS_10 = 5;

SO_1 = 2;
SO_2 = 2;
SO_3 = 2;
SO_4 = 2;
SO_5 = 2;
SO_6 = 2;
SO_7 = 2;
SO_8 = 2;
SO_9 = 2;
SO_10 = 2;

SNO_1 = 20;
SNO_2 = 20;
SNO_3 = 20;
SNO_4 = 20;
SNO_5 = 20;
SNO_6 = 20;
SNO_7 = 20;
SNO_8 = 20;
SNO_9 = 20;
SNO_10 = 20;

SNH_1 = 2;
SNH_2 = 2;
SNH_3 = 2;
SNH_4 = 2;
SNH_5 = 2;
SNH_6 = 2;
SNH_7 = 2;
SNH_8 = 2;
SNH_9 = 2;
SNH_10 = 2;

SND_1 = 1;
SND_2 = 1;
SND_3 = 1;
SND_4 = 1;
SND_5 = 1;
SND_6 = 1;
SND_7 = 1;
SND_8 = 1;
SND_9 = 1;
SND_10 = 1;

SALK_1 = 7;
SALK_2 = 7;
SALK_3 = 7;
SALK_4 = 7;
SALK_5 = 7;
SALK_6 = 7;
SALK_7 = 7;
SALK_8 = 7;
SALK_9 = 7;
SALK_10 = 7;

%{
Steady state conditions,
default initial conditions used by the MATLAB codes
TSS_1 = 12.4969;
TSS_2 = 18.1132;
TSS_3 = 29.5402;
TSS_4 = 68.9781;
TSS_5 = 356.0747;
TSS_6 = 356.0747;
TSS_7 = 356.0747;
TSS_8 = 356.0747;
TSS_9 = 356.0747;
TSS_10 = 6393.9844;

SI_1 = 30;
SI_2 = 30;
SI_3 = 30;
SI_4 = 30;
SI_5 = 30;
SI_6 = 30;
SI_7 = 30;
SI_8 = 30;
SI_9 = 30;
SI_10 = 30;

SS_1 = 0.88949;
SS_2 = 0.88949;
SS_3 = 0.88949;
SS_4 = 0.88949;
SS_5 = 0.88949;
SS_6 = 0.88949;
SS_7 = 0.88949;
SS_8 = 0.88949;
SS_9 = 0.88949;
SS_10 = 0.88949;

SO_1 = 0.49094;
SO_2 = 0.49094;
SO_3 = 0.49094;
SO_4 = 0.49094;
SO_5 = 0.49094;
SO_6 = 0.49094;
SO_7 = 0.49094;
SO_8 = 0.49094;
SO_9 = 0.49094;
SO_10 = 0.49094;

SNO_1 = 10.4152;
SNO_2 = 10.4152;
SNO_3 = 10.4152;
SNO_4 = 10.4152;
SNO_5 = 10.4152;
SNO_6 = 10.4152;
SNO_7 = 10.4152;
SNO_8 = 10.4152;
SNO_9 = 10.4152;
SNO_10 = 10.4152;

SNH_1 = 1.7333;
SNH_2 = 1.7333;
SNH_3 = 1.7333;
SNH_4 = 1.7333;
SNH_5 = 1.7333;
SNH_6 = 1.7333;
SNH_7 = 1.7333;
SNH_8 = 1.7333;
SNH_9 = 1.7333;
SNH_10 = 1.7333;

SND_1 = 0.68828;
SND_2 = 0.68828;
SND_3 = 0.68828;
SND_4 = 0.68828;
SND_5 = 0.68828;
SND_6 = 0.68828;
SND_7 = 0.68828;
SND_8 = 0.68828;
SND_9 = 0.68828;
SND_10 = 0.68828;

SALK_1 = 4.1256;
SALK_2 = 4.1256;
SALK_3 = 4.1256;
SALK_4 = 4.1256;
SALK_5 = 4.1256;
SALK_6 = 4.1256;
SALK_7 = 4.1256;
SALK_8 = 4.1256;
SALK_9 = 4.1256;
SALK_10 = 4.1256;
%}

SETTLERINIT = [ TSS_1 TSS_2 TSS_3 TSS_4 TSS_5 TSS_6 TSS_7 TSS_8 TSS_9 TSS_10  SI_1 SI_2 SI_3 SI_4 SI_5 SI_6 SI_7 SI_8 SI_9 SI_10  SS_1 SS_2 SS_3 SS_4 SS_5 SS_6 SS_7 SS_8 SS_9 SS_10  SO_1 SO_2 SO_3 SO_4 SO_5 SO_6 SO_7 SO_8 SO_9 SO_10  SNO_1 SNO_2 SNO_3 SNO_4 SNO_5 SNO_6 SNO_7 SNO_8 SNO_9 SNO_10  SNH_1 SNH_2 SNH_3 SNH_4 SNH_5 SNH_6 SNH_7 SNH_8 SNH_9 SNH_10 SND_1 SND_2 SND_3 SND_4 SND_5 SND_6 SND_7 SND_8 SND_9 SND_10  SALK_1 SALK_2 SALK_3 SALK_4 SALK_5 SALK_6 SALK_7 SALK_8 SALK_9 SALK_10 ];


v0_max = 250;
v0 = 474;
r_h = 0.000576;
r_p = 0.00286;
f_ns = 0.00228;
X_t = 3000;

SETTLERPAR = [ v0_max v0 r_h r_p f_ns X_t ];


area = 1500;
height = 4;

DIM = [ area height ];


feedlayer = 5;
nooflayers = 10;

LAYER = [ feedlayer nooflayers ];

% to use model with 10 layers for solubles use type 0 (COST Benchmark)
% to use model with 1 layer for solubles use type 1 (GSP-X implementation)
% to use model with 0 layers for solubles use type 2 (WEST implementation)

MODELTYPE = [ 0 ];
