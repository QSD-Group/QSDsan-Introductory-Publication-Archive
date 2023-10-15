TSS_1 = 12.5016;
TSS_2 = 18.1183;
TSS_3 = 29.548;
TSS_4 = 69.0015;
TSS_5 = 356.2825;
TSS_6 = 356.2825;
TSS_7 = 356.2825;
TSS_8 = 356.2825;
TSS_9 = 356.2825;
TSS_10 = 6399.2981;

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

SS_1 = 0.80801;
SS_2 = 0.80801;
SS_3 = 0.80801;
SS_4 = 0.80801;
SS_5 = 0.80801;
SS_6 = 0.80801;
SS_7 = 0.80801;
SS_8 = 0.80801;
SS_9 = 0.80801;
SS_10 = 0.80801;

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

SNO_1 = 13.5243;
SNO_2 = 13.5243;
SNO_3 = 13.5243;
SNO_4 = 13.5243;
SNO_5 = 13.5243;
SNO_6 = 13.5243;
SNO_7 = 13.5243;
SNO_8 = 13.5243;
SNO_9 = 13.5243;
SNO_10 = 13.5243;

SNH_1 = 0.67193;
SNH_2 = 0.67193;
SNH_3 = 0.67193;
SNH_4 = 0.67193;
SNH_5 = 0.67193;
SNH_6 = 0.67193;
SNH_7 = 0.67193;
SNH_8 = 0.67193;
SNH_9 = 0.67193;
SNH_10 = 0.67193;

SND_1 = 0.6645;
SND_2 = 0.6645;
SND_3 = 0.6645;
SND_4 = 0.6645;
SND_5 = 0.6645;
SND_6 = 0.6645;
SND_7 = 0.6645;
SND_8 = 0.6645;
SND_9 = 0.6645;
SND_10 = 0.6645;

SALK_1 = 3.8277;
SALK_2 = 3.8277;
SALK_3 = 3.8277;
SALK_4 = 3.8277;
SALK_5 = 3.8277;
SALK_6 = 3.8277;
SALK_7 = 3.8277;
SALK_8 = 3.8277;
SALK_9 = 3.8277;
SALK_10 = 3.8277;

SETTLERINIT = [ TSS_1 TSS_2 TSS_3 TSS_4 TSS_5 TSS_6 TSS_7 TSS_8 TSS_9 TSS_10  SI_1 SI_2 SI_3 SI_4 SI_5 SI_6 SI_7 SI_8 SI_9 SI_10  SS_1 SS_2 SS_3 SS_4 SS_5 SS_6 SS_7 SS_8 SS_9 SS_10  SO_1 SO_2 SO_3 SO_4 SO_5 SO_6 SO_7 SO_8 SO_9 SO_10  SNO_1 SNO_2 SNO_3 SNO_4 SNO_5 SNO_6 SNO_7 SNO_8 SNO_9 SNO_10  SNH_1 SNH_2 SNH_3 SNH_4 SNH_5 SNH_6 SNH_7 SNH_8 SNH_9 SNH_10 SND_1 SND_2 SND_3 SND_4 SND_5 SND_6 SND_7 SND_8 SND_9 SND_10  SALK_1 SALK_2 SALK_3 SALK_4 SALK_5 SALK_6 SALK_7 SALK_8 SALK_9 SALK_10 ];


v0_max = 250;
v0 = 474;
r_h = 0.000576;
r_p = 0.00286;
f_ns = 0.00228;
X_t = 3000;

%v0_max = 100;
%v0 = 145;
%r_h = 0.00042;
%r_p = 0.005;
%f_ns = 0;
%X_t = 3000;

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
