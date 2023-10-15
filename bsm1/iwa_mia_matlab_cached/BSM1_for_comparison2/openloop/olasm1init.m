Qin0 = 18446;
Qintr = 3*Qin0;

% if (exist('in'))
%   Qin = in(end,15);
% else
%   Qin = Qin0;
% end
% 
% if (exist('rec'))
%   Qintr = rec(end,15);
% else
%   Qintr = 3*Qin0;
% end

%{
S_I_ASin = 1118309.9999999998;
S_S_ASin = 1376151.9999999998;
X_I_ASin = 56739990.75555555;
X_S_ASin = 9311550.275555555;
X_BH_ASin = 28417401.597777773;
X_BA_ASin = 5579555.555555555;
X_P_ASin = 5579555.555555555;
S_O_ASin = 37662.0;
S_NO_ASin = 376620.0;
S_NH_ASin = 619817.7599999998;
S_ND_ASin = 147030.69999999995;
X_ND_ASin = 251138.69555555546;
S_ALK_ASin = 260939.0;
TSS_ASin = 105879192.43555553;
Q_ASin = Qin0+Qin0+Qintr;
%}


S_I_ASin = 0;
S_S_ASin = 0;
X_I_ASin = 0;
X_S_ASin = 0;
X_BH_ASin = 0;
X_BA_ASin = 0;
X_P_ASin = 0;
S_O_ASin = 0;
S_NO_ASin = 0;
S_NH_ASin = 0;
S_ND_ASin = 0;
X_ND_ASin = 0;
S_ALK_ASin = 0;
TSS_ASin = 0;
Q_ASin = 0;


%{
% _ASin represents mass (g/d), flow is still m3/d, used by hydraulic delay
S_I_ASin = 2766900;
S_S_ASin = 1347627.3369;
X_I_ASin = 105983815.1469;
X_S_ASin = 8238925.9873;
X_BH_ASin = 234464432.5673;
X_BA_ASin = 13692675.9678;
X_P_ASin = 41335770.7712;
S_O_ASin = 36223.7760;
S_NO_ASin = 768476.5949;
S_NH_ASin = 710047.8983;
S_ND_ASin = 178983.7519;
X_ND_ASin = 517755.6423;
S_ALK_ASin = 433523.7502;
TSS_ASin = 302786716.3004;
Q_ASin = Qin0+Qin0+Qintr;
%}

% Same as those used in QSDsan,
% for comparison purpose
S_I1 = 30;
S_S1 = 5.0;
X_I1 = 1000;
X_S1 = 100;
X_BH1 = 500;
X_BA1 = 100;
X_P1 = 100;
S_O1 = 2;
S_NO1 = 20;
S_NH1 = 2;
S_ND1 = 1;
X_ND1 = 1;
S_ALK1 = 7;
TSS1 = 675;
Q1 = Qin0+Qin0+Qintr;

S_I2 = 30;
S_S2 = 5.0;
X_I2 = 1000;
X_S2 = 100;
X_BH2 = 500;
X_BA2 = 100;
X_P2 = 100;
S_O2 = 2;
S_NO2 = 20;
S_NH2 = 2;
S_ND2 = 1;
X_ND2 = 1;
S_ALK2 = 7;
TSS2 = 675;
Q2 = Qin0+Qin0+Qintr;

S_I3 = 30;
S_S3 = 5.0;
X_I3 = 1000;
X_S3 = 100;
X_BH3 = 500;
X_BA3 = 100;
X_P3 = 100;
S_O3 = 2;
S_NO3 = 20;
S_NH3 = 2;
S_ND3 = 1;
X_ND3 = 1;
S_ALK3 = 7;
TSS3 = 675;
Q3 = Qin0+Qin0+Qintr;

S_I4 = 30;
S_S4 = 5.0;
X_I4 = 1000;
X_S4 = 100;
X_BH4 = 500;
X_BA4 = 100;
X_P4 = 100;
S_O4 = 2;
S_NO4 = 20;
S_NH4 = 2;
S_ND4 = 1;
X_ND4 = 1;
S_ALK4 = 7;
TSS4 = 675;
Q4 = Qin0+Qin0+Qintr;

S_I5 = 30;
S_S5 = 5.0;
X_I5 = 1000;
X_S5 = 100;
X_BH5 = 500;
X_BA5 = 100;
X_P5 = 100;
S_O5 = 2;
S_NO5 = 20;
S_NH5 = 2;
S_ND5 = 1;
X_ND5 = 1;
S_ALK5 = 7;
TSS5 = 675;
Q5 = Qin0+Qin0+Qintr;

%{
Steady state conditions,
default initial conditions used by the MATLAB codes
S_I1 = 30;
S_S1 = 2.8082;
X_I1 = 1149.1252;
X_S1 = 82.1349;
X_BH1 = 2551.7658;
X_BA1 = 148.3894;
X_P1 = 448.8519;
S_O1 = 0.0042984;
S_NO1 = 5.3699;
S_NH1 = 7.9179;
S_ND1 = 1.2166;
X_ND1 = 5.2849;
S_ALK1 = 4.9277;
TSS1 = 3285.2004;
Q1 = Qin0+Qin0+Qintr;

S_I2 = 30;
S_S2 = 1.4588;
X_I2 = 1149.1252;
X_S2 = 76.3862;
X_BH2 = 2553.3851;
X_BA2 = 148.3091;
X_P2 = 449.5227;
S_O2 = 6.3132e-05;
S_NO2 = 3.662;
S_NH2 = 8.3444;
S_ND2 = 0.88206;
X_ND2 = 5.0291;
S_ALK2 = 5.0802;
TSS2 = 3282.5462;
Q2 = Qin0+Qin0+Qintr;

S_I3 = 30;
S_S3 = 1.1495;
X_I3 = 1149.1252;
X_S3 = 64.8549;
X_BH3 = 2557.1314;
X_BA3 = 148.9413;
X_P3 = 450.4183;
S_O3 = 1.7184;
S_NO3 = 6.5409;
S_NH3 = 5.5479;
S_ND3 = 0.82889;
X_ND3 = 4.3924;
S_ALK3 = 4.6748;
TSS3 = 3277.8533;
Q3 = Qin0+Qin0+Qintr;

S_I4 = 30;
S_S4 = 0.99532;
X_I4 = 1149.1252;
X_S4 = 55.694;
X_BH4 = 2559.1826;
X_BA4 = 149.5271;
X_P4 = 451.3147;
S_O4 = 2.4289;
S_NO4 = 9.299;
S_NH4 = 2.9674;
S_ND4 = 0.76679;
X_ND4 = 3.879;
S_ALK4 = 4.2935;
TSS4 = 3273.6327;
Q4 = Qin0+Qin0+Qintr;

S_I5 = 30;
S_S5 = 0.88949;
X_I5 = 1149.1252;
X_S5 = 49.3056;
X_BH5 = 2559.3436;
X_BA5 = 149.7971;
X_P5 = 452.2111;
S_O5 = 0.49094;
S_NO5 = 10.4152;
S_NH5 = 1.7333;
S_ND5 = 0.68828;
X_ND5 = 3.5272;
S_ALK5 = 4.1256;
TSS5 = 3269.8370;
Q5 = Qin0+Qin0+Qintr;
%}


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

%{
% Max
mu_H = 5.00;
K_S = 15.00;
K_OH = 0.30;
K_NO = 0.75;
b_H = 0.32;
mu_A = 0.53;
K_NH = 1.50;
K_OA = 0.50;
b_A = 0.06;
ny_g = 1.00;
k_a = 0.08;
k_h = 3.75;
K_X = 0.125;
ny_h = 1.00;
Y_H = 0.70;
Y_A = 0.25;
f_P = 0.107;
i_XB = 0.12;
i_XP = 0.06;
X_I2TSS = 0.95;
X_S2TSS = 0.95;
X_BH2TSS = 0.95;
X_BA2TSS = 0.95;
X_P2TSS = 0.95;
%}

%{
% Min
mu_H = 3.00;
K_S = 5.00;
K_OH = 0.10;
K_NO = 0.25;
b_H = 0.29;
mu_A = 0.48;
K_NH = 0.50;
K_OA = 0.30;
b_A = 0.04;
ny_g = 0.60;
k_a = 0.03;
k_h = 2.25;
K_X = 0.075;
ny_h = 0.60;
Y_H = 0.64;
Y_A = 0.23;
f_P = 0.050;
i_XB = 0.04;
i_XP = 0.06;
X_I2TSS = 0.70;
X_S2TSS = 0.70;
X_BH2TSS = 0.70;
X_BA2TSS = 0.70;
X_P2TSS = 0.70;
%}

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
KLa5 = 84;

carb1 = 0; % external carbon flow rate to reactor 1
carb2 = 0; % external carbon flow rate to reactor 2
carb3 = 0; % external carbon flow rate to reactor 3
carb4 = 0; % external carbon flow rate to reactor 4
carb5 = 0; % external carbon flow rate to reactor 5
CARBONSOURCECONC = 400000; % external carbon source concentration = 400000 mg COD/l

% T = 0.0001;
T = 0.0002;