[m n] = size(reac1);

S_Iin = in(m,1);
S_Sin = in(m,2);
X_Iin = in(m,3);
X_Sin = in(m,4);
X_BHin = in(m,5);
X_BAin = in(m,6);
X_Pin = in(m,7);
S_Oin = in(m,8);
S_NOin = in(m,9);
S_NHin = in(m,10);
S_NDin = in(m,11);
X_NDin = in(m,12);
S_ALKin = in(m,13);
TSSin = in(m,14);
Qin = in(m,15);

% _ASin represents mass (g/d), flow is still m3/d, used by hydraulic delay
S_I_ASin = ASinput(m,1);
S_S_ASin = ASinput(m,2);
X_I_ASin = ASinput(m,3);
X_S_ASin = ASinput(m,4);
X_BH_ASin = ASinput(m,5);
X_BA_ASin = ASinput(m,6);
X_P_ASin = ASinput(m,7);
S_O_ASin = ASinput(m,8);
S_NO_ASin = ASinput(m,9);
S_NH_ASin = ASinput(m,10);
S_ND_ASin = ASinput(m,11);
X_ND_ASin = ASinput(m,12);
S_ALK_ASin = ASinput(m,13);
TSS_ASin = ASinput(m,14);
Q_ASin = ASinput(m,15);

S_I1 = reac1(m,1);
S_S1 = reac1(m,2);
X_I1 = reac1(m,3);
X_S1 = reac1(m,4);
X_BH1 = reac1(m,5);
X_BA1 = reac1(m,6);
X_P1 = reac1(m,7);
S_O1 = reac1(m,8);
S_NO1 = reac1(m,9);
S_NH1 = reac1(m,10);
S_ND1 = reac1(m,11);
X_ND1 = reac1(m,12);
S_ALK1 = reac1(m,13);
TSS1 = reac1(m,14);
Q1 = reac1(m,15);

S_I2 = reac2(m,1);
S_S2 = reac2(m,2);
X_I2 = reac2(m,3);
X_S2 = reac2(m,4);
X_BH2 = reac2(m,5);
X_BA2 = reac2(m,6);
X_P2 = reac2(m,7);
S_O2 = reac2(m,8);
S_NO2 = reac2(m,9);
S_NH2 = reac2(m,10);
S_ND2 = reac2(m,11);
X_ND2 = reac2(m,12);
S_ALK2 = reac2(m,13);
TSS2 = reac2(m,14);
Q2 = reac2(m,15);

S_I3 = reac3(m,1);
S_S3 = reac3(m,2);
X_I3 = reac3(m,3);
X_S3 = reac3(m,4);
X_BH3 = reac3(m,5);
X_BA3 = reac3(m,6);
X_P3 = reac3(m,7);
S_O3 = reac3(m,8);
S_NO3 = reac3(m,9);
S_NH3 = reac3(m,10);
S_ND3 = reac3(m,11);
X_ND3 = reac3(m,12);
S_ALK3 = reac3(m,13);
TSS3 = reac3(m,14);
Q3 = reac3(m,15);

S_I4 = reac4(m,1);
S_S4 = reac4(m,2);
X_I4 = reac4(m,3);
X_S4 = reac4(m,4);
X_BH4 = reac4(m,5);
X_BA4 = reac4(m,6);
X_P4 = reac4(m,7);
S_O4 = reac4(m,8);
S_NO4 = reac4(m,9);
S_NH4 = reac4(m,10);
S_ND4 = reac4(m,11);
X_ND4 = reac4(m,12);
S_ALK4 = reac4(m,13);
TSS4 = reac4(m,14);
Q4 = reac4(m,15);

S_I5 = reac5(m,1);
S_S5 = reac5(m,2);
X_I5 = reac5(m,3);
X_S5 = reac5(m,4);
X_BH5 = reac5(m,5);
X_BA5 = reac5(m,6);
X_P5 = reac5(m,7);
S_O5 = reac5(m,8);
S_NO5 = reac5(m,9);
S_NH5 = reac5(m,10);
S_ND5 = reac5(m,11);
X_ND5 = reac5(m,12);
S_ALK5 = reac5(m,13);
TSS5 = reac5(m,14);
Q5 = reac5(m,15);


Xin = [ S_Iin S_Sin  X_Iin  X_Sin  X_BHin  X_BAin  X_Pin  S_Oin  S_NOin  S_NHin  S_NDin  X_NDin  S_ALKin TSSin Qin ];
XINITDELAY = [ S_I_ASin  S_S_ASin  X_I_ASin  X_S_ASin  X_BH_ASin  X_BA_ASin  X_P_ASin  S_O_ASin  S_NO_ASin  S_NH_ASin  S_ND_ASin  X_ND_ASin  S_ALK_ASin TSS_ASin Q_ASin ];
XINIT1 = [ S_I1  S_S1  X_I1  X_S1  X_BH1  X_BA1  X_P1  S_O1  S_NO1  S_NH1  S_ND1  X_ND1  S_ALK1 TSS1 Q1 ];
XINIT2 = [ S_I2  S_S2  X_I2  X_S2  X_BH2  X_BA2  X_P2  S_O2  S_NO2  S_NH2  S_ND2  X_ND2  S_ALK2 TSS2 Q2 ];
XINIT3 = [ S_I3  S_S3  X_I3  X_S3  X_BH3  X_BA3  X_P3  S_O3  S_NO3  S_NH3  S_ND3  X_ND3  S_ALK3 TSS3 Q3 ];
XINIT4 = [ S_I4  S_S4  X_I4  X_S4  X_BH4  X_BA4  X_P4  S_O4  S_NO4  S_NH4  S_ND4  X_ND4  S_ALK4 TSS4 Q4 ];
XINIT5 = [ S_I5  S_S5  X_I5  X_S5  X_BH5  X_BA5  X_P5  S_O5  S_NO5  S_NH5  S_ND5  X_ND5  S_ALK5 TSS5 Q5 ];

TSS_1 = settler(m,32);
TSS_2 = settler(m,33);
TSS_3 = settler(m,34);
TSS_4 = settler(m,35);
TSS_5 = settler(m,36);
TSS_6 = settler(m,37);
TSS_7 = settler(m,38);
TSS_8 = settler(m,39);
TSS_9 = settler(m,40);
TSS_10 = settler(m,41);

SI_1 = settler(m,44);
SI_2 = settler(m,45);
SI_3 = settler(m,46);
SI_4 = settler(m,47);
SI_5 = settler(m,48);
SI_6 = settler(m,49);
SI_7 = settler(m,50);
SI_8 = settler(m,51);
SI_9 = settler(m,52);
SI_10 = settler(m,53);

SS_1 = settler(m,54);
SS_2 = settler(m,55);
SS_3 = settler(m,56);
SS_4 = settler(m,57);
SS_5 = settler(m,58);
SS_6 = settler(m,59);
SS_7 = settler(m,60);
SS_8 = settler(m,61);
SS_9 = settler(m,62);
SS_10 = settler(m,63);

SO_1 = settler(m,64);
SO_2 = settler(m,65);
SO_3 = settler(m,66);
SO_4 = settler(m,67);
SO_5 = settler(m,68);
SO_6 = settler(m,69);
SO_7 = settler(m,70);
SO_8 = settler(m,71);
SO_9 = settler(m,72);
SO_10 = settler(m,73);

SNO_1 = settler(m,74);
SNO_2 = settler(m,75);
SNO_3 = settler(m,76);
SNO_4 = settler(m,77);
SNO_5 = settler(m,78);
SNO_6 = settler(m,79);
SNO_7 = settler(m,80);
SNO_8 = settler(m,81);
SNO_9 = settler(m,82);
SNO_10 = settler(m,83);

SNH_1 = settler(m,84);
SNH_2 = settler(m,85);
SNH_3 = settler(m,86);
SNH_4 = settler(m,87);
SNH_5 = settler(m,88);
SNH_6 = settler(m,89);
SNH_7 = settler(m,90);
SNH_8 = settler(m,91);
SNH_9 = settler(m,92);
SNH_10 = settler(m,93);

SND_1 = settler(m,94);
SND_2 = settler(m,95);
SND_3 = settler(m,96);
SND_4 = settler(m,97);
SND_5 = settler(m,98);
SND_6 = settler(m,99);
SND_7 = settler(m,100);
SND_8 = settler(m,101);
SND_9 = settler(m,102);
SND_10 = settler(m,103);

SALK_1 = settler(m,104);
SALK_2 = settler(m,105);
SALK_3 = settler(m,106);
SALK_4 = settler(m,107);
SALK_5 = settler(m,108);
SALK_6 = settler(m,109);
SALK_7 = settler(m,110);
SALK_8 = settler(m,111);
SALK_9 = settler(m,112);
SALK_10 = settler(m,113);

SETTLERINIT = [ TSS_1 TSS_2 TSS_3 TSS_4 TSS_5 TSS_6 TSS_7 TSS_8 TSS_9 TSS_10  SI_1 SI_2 SI_3 SI_4 SI_5 SI_6 SI_7 SI_8 SI_9 SI_10  SS_1 SS_2 SS_3 SS_4 SS_5 SS_6 SS_7 SS_8 SS_9 SS_10  SO_1 SO_2 SO_3 SO_4 SO_5 SO_6 SO_7 SO_8 SO_9 SO_10  SNO_1 SNO_2 SNO_3 SNO_4 SNO_5 SNO_6 SNO_7 SNO_8 SNO_9 SNO_10  SNH_1 SNH_2 SNH_3 SNH_4 SNH_5 SNH_6 SNH_7 SNH_8 SNH_9 SNH_10 SND_1 SND_2 SND_3 SND_4 SND_5 SND_6 SND_7 SND_8 SND_9 SND_10  SALK_1 SALK_2 SALK_3 SALK_4 SALK_5 SALK_6 SALK_7 SALK_8 SALK_9 SALK_10 ];

S_Iu = settler(m,1);
S_Su = settler(m,2);
X_Iu = settler(m,3);
X_Su = settler(m,4);
X_BHu = settler(m,5);
X_BAu = settler(m,6);
X_Pu = settler(m,7);
S_Ou = settler(m,8);
S_NOu = settler(m,9);
S_NHu = settler(m,10);
S_NDu = settler(m,11);
X_NDu = settler(m,12);
S_ALKu = settler(m,13);
TSSu = settler(m,14);
Qr = settler(m,15);
Qw = settler(m,16);

XUNDER = [ S_Iu S_Su X_Iu X_Su X_BHu X_BAu X_Pu S_Ou S_NOu S_NHu S_NDu X_NDu S_ALKu TSSu Qr Qw ];

S_Ie = settler(m,17);
S_Se = settler(m,18);
X_Ie = settler(m,19);
X_Se = settler(m,20);
X_BHe = settler(m,21);
X_BAe = settler(m,22);
X_Pe = settler(m,23);
S_Oe = settler(m,24);
S_NOe = settler(m,25);
S_NHe = settler(m,26);
S_NDe = settler(m,27);
X_NDe = settler(m,28);
S_ALKe = settler(m,29);
TSSe = settler(m,30);
Qe = settler(m,31);

XEFF = [ S_Ie S_Se X_Ie X_Se X_BHe X_BAe X_Pe S_Oe S_NOe S_NHe S_NDe X_NDe S_ALKe TSSe Qe ];

out = [ Xin XINITDELAY XINIT1 XINIT2 XINIT3 XINIT4 XINIT5 SETTLERINIT XUNDER XEFF ]';

save states_ss.txt out -ascii
