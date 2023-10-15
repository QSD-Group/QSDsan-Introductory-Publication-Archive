Qin0 = 18446;

if (exist('in'))
  Qin = in(end,15);
else
  Qin = Qin0;
end

if (exist('rec'))
  Qintr = rec(end,15);
else
  Qintr = 3*Qin0;
end

% _ASin represents mass (g/d), flow is still m3/d, used by hydraulic delay
S_I_ASin = 1601328.2216;
S_S_ASin = 1310222.0115;
X_I_ASin = 61339851.4962;
X_S_ASin = 6069822.4622;
X_BH_ASin = 135212240.1361;
X_BA_ASin = 8102155.1356;
X_P_ASin = 23793923.1344;
S_O_ASin = 69863.2148;
S_NO_ASin = 472426.1427;
S_NH_ASin = 605627.2491;
S_ND_ASin = 151411.6736;
X_ND_ASin = 366699.3472;
S_ALK_ASin = 262829.2386;
TSS_ASin = 175888494.2733;
Q_ASin = Qin+Qin0+Qintr;

S_I1 = 30;
S_S1 = 3.2439;
X_I1 = 1149.1683;
X_S1 = 98.6029;
X_BH1 = 2552.1095;
X_BA1 = 151.6721;
X_P1 = 446.9249;
S_O1 = 0.0076964;
S_NO1 = 3.5133;
S_NH1 = 11.8312;
S_ND1 = 1.3621;
X_ND1 = 6.1775;
S_ALK1 = 5.3399;
TSS1 = 3298.8582;
Q1 = Qin+Qin0+Qintr;

S_I2 = 30;
S_S2 = 1.6707;
X_I2 = 1149.1683;
X_S2 = 91.7032;
X_BH2 = 2552.3711;
X_BA2 = 151.5303;
X_P2 = 448.0838;
S_O2 = 6.0271e-05;
S_NO2 = 1;
S_NH2 = 12.5482;
S_ND2 = 0.78899;
X_ND2 = 5.9537;
S_ALK2 = 5.5706;
TSS2 = 3294.6425;
Q2 = Qin+Qin0+Qintr;

S_I3 = 30;
S_S3 = 1.2195;
X_I3 = 1149.1683;
X_S3 = 69.6594;
X_BH3 = 2560.2025;
X_BA3 = 152.6873;
X_P3 = 449.6336;
S_O3 = 1.635;
S_NO3 = 6.2289;
S_NH3 = 7.3197;
S_ND3 = 0.8307;
X_ND3 = 4.7131;
S_ALK3 = 4.8236;
TSS3 = 3286.0132;
Q3 = Qin+Qin0+Qintr;

S_I4 = 30;
S_S4 = 0.97326;
X_I4 = 1149.1683;
X_S4 = 54.4484;
X_BH4 = 2563.3104;
X_BA4 = 153.7108;
X_P4 = 451.1852;
S_O4 = 2.4745;
S_NO4 = 11.0693;
S_NH4 = 2.7825;
S_ND4 = 0.75276;
X_ND4 = 3.8403;
S_ALK4 = 4.1538;
TSS4 = 3278.8674;
Q4 = Qin+Qin0+Qintr;

S_I5 = 30;
S_S5 = 0.80801;
X_I5 = 1149.1683;
X_S5 = 44.4828;
X_BH5 = 2562.8514;
X_BA5 = 154.163;
X_P5 = 452.7367;
S_O5 = 2;
S_NO5 = 13.5243;
S_NH5 = 0.67193;
S_ND5 = 0.6645;
X_ND5 = 3.2605;
S_ALK5 = 3.8277;
TSS5 = 3272.5516;
Q5 = Qin+Qin0+Qintr;

XINITDELAY = [ S_I_ASin  S_S_ASin  X_I_ASin  X_S_ASin  X_BH_ASin  X_BA_ASin  X_P_ASin  S_O_ASin  S_NO_ASin  S_NH_ASin  S_ND_ASin  X_ND_ASin  S_ALK_ASin TSS_ASin Q_ASin ];
XINIT1 = [ S_I1  S_S1  X_I1  X_S1  X_BH1  X_BA1  X_P1  S_O1  S_NO1  S_NH1  S_ND1  X_ND1  S_ALK1 TSS1 Q1 ];
XINIT2 = [ S_I2  S_S2  X_I2  X_S2  X_BH2  X_BA2  X_P2  S_O2  S_NO2  S_NH2  S_ND2  X_ND2  S_ALK2 TSS2 Q2 ];
XINIT3 = [ S_I3  S_S3  X_I3  X_S3  X_BH3  X_BA3  X_P3  S_O3  S_NO3  S_NH3  S_ND3  X_ND3  S_ALK3 TSS3 Q3 ];
XINIT4 = [ S_I4  S_S4  X_I4  X_S4  X_BH4  X_BA4  X_P4  S_O4  S_NO4  S_NH4  S_ND4  X_ND4  S_ALK4 TSS4 Q4 ];
XINIT5 = [ S_I5  S_S5  X_I5  X_S5  X_BH5  X_BA5  X_P5  S_O5  S_NO5  S_NH5  S_ND5  X_ND5  S_ALK5 TSS5 Q5 ];

XINIT1 = XINIT1.*(rand(1, 15)/2);
XINIT2 = XINIT2.*(rand(1, 15)/2);
XINIT3 = XINIT3.*(rand(1, 15)/2);
XINIT4 = XINIT4.*(rand(1, 15)/2);
XINIT5 = XINIT5.*(rand(1, 15)/2);

XINIT5(8) = 2; % just to avoid antiwindupeffect the first sample time


mu_H = 4.0;  %6.0;
K_S = 10.0;  %20;
K_OH = 0.2;
K_NO = 0.5;
b_H = 0.3;  %0.62;
mu_A = 0.5;  %0.8;
K_NH = 1.0;
K_OA = 0.4;
b_A = 0.05;  %0.2;
ny_g = 0.8;
k_a = 0.05;  %0.08;
k_h = 3.0;
K_X = 0.1;  %0.03;
ny_h = 0.8;  %0.4;
Y_H = 0.67;
Y_A = 0.24;
f_P = 0.08;
i_XB = 0.08;  %0.086;
i_XP = 0.06;
X_I2TSS = 0.75;
X_S2TSS = 0.75;
X_BH2TSS = 0.75;
X_BA2TSS = 0.75;
X_P2TSS = 0.75;

PAR1 = [ mu_H  K_S  K_OH  K_NO  b_H  mu_A  K_NH  K_OA  b_A  ny_g  k_a  k_h  K_X  ny_h  Y_H  Y_A  f_P  i_XB  i_XP X_I2TSS  X_S2TSS  X_BH2TSS  X_BA2TSS  X_P2TSS ];
PAR2 = PAR1;
PAR3 = PAR1;
PAR4 = PAR1;
PAR5 = PAR1;


VOL1 = 1000;
VOL2 = VOL1;
VOL3 = 1333;
VOL4 = VOL3;
VOL5 = VOL3;


SOSAT1 = 8;
SOSAT2 = SOSAT1;
SOSAT3 = SOSAT1;
SOSAT4 = SOSAT1;
SOSAT5 = SOSAT1;


KLa1 = 0;
KLa2 = 0;
KLa3 = 240;
KLa4 = 240;
KLa5 = NaN;


carb1 = 0; % external carbon flow rate to reactor 1
carb2 = 0; % external carbon flow rate to reactor 2
carb3 = 0; % external carbon flow rate to reactor 3
carb4 = 0; % external carbon flow rate to reactor 4
carb5 = 0; % external carbon flow rate to reactor 5
CARBONSOURCECONC = 400000; % external carbon source concentration = 400000 mg COD/l


T = 0.0001; % used by hydraulic delays
QintrT = T*10;
