S_Iin = in(:,1);
S_Sin = in(:,2);
X_Iin = in(:,3);
X_Sin = in(:,4);
X_BHin = in(:,5);
X_BAin = in(:,6);
X_Pin = in(:,7);
S_Oin = in(:,8);
S_NOin = in(:,9);
S_NHin = in(:,10);
S_NDin = in(:,11);
X_NDin = in(:,12);
S_ALKin = in(:,13);
TSSin = in(:,14);
Qin = in(:,15);

% _ASin represents mass (g/d), flow is still m3/d, used by hydraulic delay
S_I_ASin = ASinput(:,1);
S_S_ASin = ASinput(:,2);
X_I_ASin = ASinput(:,3);
X_S_ASin = ASinput(:,4);
X_BH_ASin = ASinput(:,5);
X_BA_ASin = ASinput(:,6);
X_P_ASin = ASinput(:,7);
S_O_ASin = ASinput(:,8);
S_NO_ASin = ASinput(:,9);
S_NH_ASin = ASinput(:,10);
S_ND_ASin = ASinput(:,11);
X_ND_ASin = ASinput(:,12);
S_ALK_ASin = ASinput(:,13);
TSS_ASin = ASinput(:,14);
Q_ASin = ASinput(:,15);

S_I1 = reac1(:,1);
S_S1 = reac1(:,2);
X_I1 = reac1(:,3);
X_S1 = reac1(:,4);
X_BH1 = reac1(:,5);
X_BA1 = reac1(:,6);
X_P1 = reac1(:,7);
S_O1 = reac1(:,8);
S_NO1 = reac1(:,9);
S_NH1 = reac1(:,10);
S_ND1 = reac1(:,11);
X_ND1 = reac1(:,12);
S_ALK1 = reac1(:,13);
TSS1 = reac1(:,14);
Q1 = reac1(:,15);

S_I2 = reac2(:,1);
S_S2 = reac2(:,2);
X_I2 = reac2(:,3);
X_S2 = reac2(:,4);
X_BH2 = reac2(:,5);
X_BA2 = reac2(:,6);
X_P2 = reac2(:,7);
S_O2 = reac2(:,8);
S_NO2 = reac2(:,9);
S_NH2 = reac2(:,10);
S_ND2 = reac2(:,11);
X_ND2 = reac2(:,12);
S_ALK2 = reac2(:,13);
TSS2 = reac2(:,14);
Q2 = reac2(:,15);

S_I3 = reac3(:,1);
S_S3 = reac3(:,2);
X_I3 = reac3(:,3);
X_S3 = reac3(:,4);
X_BH3 = reac3(:,5);
X_BA3 = reac3(:,6);
X_P3 = reac3(:,7);
S_O3 = reac3(:,8);
S_NO3 = reac3(:,9);
S_NH3 = reac3(:,10);
S_ND3 = reac3(:,11);
X_ND3 = reac3(:,12);
S_ALK3 = reac3(:,13);
TSS3 = reac3(:,14);
Q3 = reac3(:,15);

S_I4 = reac4(:,1);
S_S4 = reac4(:,2);
X_I4 = reac4(:,3);
X_S4 = reac4(:,4);
X_BH4 = reac4(:,5);
X_BA4 = reac4(:,6);
X_P4 = reac4(:,7);
S_O4 = reac4(:,8);
S_NO4 = reac4(:,9);
S_NH4 = reac4(:,10);
S_ND4 = reac4(:,11);
X_ND4 = reac4(:,12);
S_ALK4 = reac4(:,13);
TSS4 = reac4(:,14);
Q4 = reac4(:,15);

S_I5 = reac5(:,1);
S_S5 = reac5(:,2);
X_I5 = reac5(:,3);
X_S5 = reac5(:,4);
X_BH5 = reac5(:,5);
X_BA5 = reac5(:,6);
X_P5 = reac5(:,7);
S_O5 = reac5(:,8);
S_NO5 = reac5(:,9);
S_NH5 = reac5(:,10);
S_ND5 = reac5(:,11);
X_ND5 = reac5(:,12);
S_ALK5 = reac5(:,13);
TSS5 = reac5(:,14);
Q5 = reac5(:,15);


Xin = [ S_Iin S_Sin  X_Iin  X_Sin  X_BHin  X_BAin  X_Pin  S_Oin  S_NOin  S_NHin  S_NDin  X_NDin  S_ALKin TSSin Qin ];
XINITDELAY = [ S_I_ASin  S_S_ASin  X_I_ASin  X_S_ASin  X_BH_ASin  X_BA_ASin  X_P_ASin  S_O_ASin  S_NO_ASin  S_NH_ASin  S_ND_ASin  X_ND_ASin  S_ALK_ASin TSS_ASin Q_ASin ];
XINIT1 = [ S_I1  S_S1  X_I1  X_S1  X_BH1  X_BA1  X_P1  S_O1  S_NO1  S_NH1  S_ND1  X_ND1  S_ALK1 TSS1 Q1 ];
XINIT2 = [ S_I2  S_S2  X_I2  X_S2  X_BH2  X_BA2  X_P2  S_O2  S_NO2  S_NH2  S_ND2  X_ND2  S_ALK2 TSS2 Q2 ];
XINIT3 = [ S_I3  S_S3  X_I3  X_S3  X_BH3  X_BA3  X_P3  S_O3  S_NO3  S_NH3  S_ND3  X_ND3  S_ALK3 TSS3 Q3 ];
XINIT4 = [ S_I4  S_S4  X_I4  X_S4  X_BH4  X_BA4  X_P4  S_O4  S_NO4  S_NH4  S_ND4  X_ND4  S_ALK4 TSS4 Q4 ];
XINIT5 = [ S_I5  S_S5  X_I5  X_S5  X_BH5  X_BA5  X_P5  S_O5  S_NO5  S_NH5  S_ND5  X_ND5  S_ALK5 TSS5 Q5 ];

TSS_1 = settler(:,32);
TSS_2 = settler(:,33);
TSS_3 = settler(:,34);
TSS_4 = settler(:,35);
TSS_5 = settler(:,36);
TSS_6 = settler(:,37);
TSS_7 = settler(:,38);
TSS_8 = settler(:,39);
TSS_9 = settler(:,40);
TSS_10 = settler(:,41);

SI_1 = settler(:,44);
SI_2 = settler(:,45);
SI_3 = settler(:,46);
SI_4 = settler(:,47);
SI_5 = settler(:,48);
SI_6 = settler(:,49);
SI_7 = settler(:,50);
SI_8 = settler(:,51);
SI_9 = settler(:,52);
SI_10 = settler(:,53);

SS_1 = settler(:,54);
SS_2 = settler(:,55);
SS_3 = settler(:,56);
SS_4 = settler(:,57);
SS_5 = settler(:,58);
SS_6 = settler(:,59);
SS_7 = settler(:,60);
SS_8 = settler(:,61);
SS_9 = settler(:,62);
SS_10 = settler(:,63);

SO_1 = settler(:,64);
SO_2 = settler(:,65);
SO_3 = settler(:,66);
SO_4 = settler(:,67);
SO_5 = settler(:,68);
SO_6 = settler(:,69);
SO_7 = settler(:,70);
SO_8 = settler(:,71);
SO_9 = settler(:,72);
SO_10 = settler(:,73);

SNO_1 = settler(:,74);
SNO_2 = settler(:,75);
SNO_3 = settler(:,76);
SNO_4 = settler(:,77);
SNO_5 = settler(:,78);
SNO_6 = settler(:,79);
SNO_7 = settler(:,80);
SNO_8 = settler(:,81);
SNO_9 = settler(:,82);
SNO_10 = settler(:,83);

SNH_1 = settler(:,84);
SNH_2 = settler(:,85);
SNH_3 = settler(:,86);
SNH_4 = settler(:,87);
SNH_5 = settler(:,88);
SNH_6 = settler(:,89);
SNH_7 = settler(:,90);
SNH_8 = settler(:,91);
SNH_9 = settler(:,92);
SNH_10 = settler(:,93);

SND_1 = settler(:,94);
SND_2 = settler(:,95);
SND_3 = settler(:,96);
SND_4 = settler(:,97);
SND_5 = settler(:,98);
SND_6 = settler(:,99);
SND_7 = settler(:,100);
SND_8 = settler(:,101);
SND_9 = settler(:,102);
SND_10 = settler(:,103);

SALK_1 = settler(:,104);
SALK_2 = settler(:,105);
SALK_3 = settler(:,106);
SALK_4 = settler(:,107);
SALK_5 = settler(:,108);
SALK_6 = settler(:,109);
SALK_7 = settler(:,110);
SALK_8 = settler(:,111);
SALK_9 = settler(:,112);
SALK_10 = settler(:,113);

SETTLERINIT = [ TSS_1 TSS_2 TSS_3 TSS_4 TSS_5 TSS_6 TSS_7 TSS_8 TSS_9 TSS_10  SI_1 SI_2 SI_3 SI_4 SI_5 SI_6 SI_7 SI_8 SI_9 SI_10  SS_1 SS_2 SS_3 SS_4 SS_5 SS_6 SS_7 SS_8 SS_9 SS_10  SO_1 SO_2 SO_3 SO_4 SO_5 SO_6 SO_7 SO_8 SO_9 SO_10  SNO_1 SNO_2 SNO_3 SNO_4 SNO_5 SNO_6 SNO_7 SNO_8 SNO_9 SNO_10  SNH_1 SNH_2 SNH_3 SNH_4 SNH_5 SNH_6 SNH_7 SNH_8 SNH_9 SNH_10 SND_1 SND_2 SND_3 SND_4 SND_5 SND_6 SND_7 SND_8 SND_9 SND_10  SALK_1 SALK_2 SALK_3 SALK_4 SALK_5 SALK_6 SALK_7 SALK_8 SALK_9 SALK_10 ];

S_Iu = settler(:,1);
S_Su = settler(:,2);
X_Iu = settler(:,3);
X_Su = settler(:,4);
X_BHu = settler(:,5);
X_BAu = settler(:,6);
X_Pu = settler(:,7);
S_Ou = settler(:,8);
S_NOu = settler(:,9);
S_NHu = settler(:,10);
S_NDu = settler(:,11);
X_NDu = settler(:,12);
S_ALKu = settler(:,13);
TSSu = settler(:,14);
Qr = settler(:,15);
Qw = settler(:,16);

XUNDER = [ S_Iu S_Su X_Iu X_Su X_BHu X_BAu X_Pu S_Ou S_NOu S_NHu S_NDu X_NDu S_ALKu TSSu Qr Qw ];

S_Ie = settler(:,17);
S_Se = settler(:,18);
X_Ie = settler(:,19);
X_Se = settler(:,20);
X_BHe = settler(:,21);
X_BAe = settler(:,22);
X_Pe = settler(:,23);
S_Oe = settler(:,24);
S_NOe = settler(:,25);
S_NHe = settler(:,26);
S_NDe = settler(:,27);
X_NDe = settler(:,28);
S_ALKe = settler(:,29);
TSSe = settler(:,30);
Qe = settler(:,31);

XEFF = [ S_Ie S_Se X_Ie X_Se X_BHe X_BAe X_Pe S_Oe S_NOe S_NHe S_NDe X_NDe S_ALKe TSSe Qe ];

out = [ t Xin XINITDELAY XINIT1 XINIT2 XINIT3 XINIT4 XINIT5 SETTLERINIT XUNDER XEFF ];

save states_dyn.txt out -ascii
