% Plant performance module for BSM1 benchmarking
% 990410 UJ, updated many times
% Last update 2007-11-13
% Copyright: Ulf Jeppsson, IEA, Lund University, Lund, Sweden
% 2007-12-07 file updated to include both original and updated BSM1
% evaluation criteria, UJ
% 2007-12-27 file updated to include Risk estimation

% cut away first and last samples, i.e. t=smaller than starttime and 
% t = larger than stoptime
starttime = 7;
stoptime = 14;
startindex=max(find(t <= starttime));
stopindex=min(find(t >= stoptime));

time=t(startindex:stopindex);

sampletime = time(2)-time(1);
totalt=time(end)-time(1);

totalCODemax = 100;
totalNemax = 18;
SNHemax = 4;
TSSemax = 30;
BOD5emax = 10;

BSS=2;
BCOD=1;
BNKj=20; % original BSM1
BNO=20; % original BSM1
BBOD5=2;
BNKj_new = 30; % updated BSM TG meeting no 8
BNO_new = 10; % updated BSM TG meeting no 8

pumpfactor = 0.04; % original BSM1, same for all pumped flows
PF_Qintr = 0.004;  % kWh/m3, pumping energy factor, internal AS recirculation
PF_Qr = 0.008;  % kWh/m3, pumping energy factor, AS sludge recycle 
PF_Qw = 0.05;  % kWh/m3, pumping energy factor, AS wastage flow

%cut out the parts of the files to be used
inpart=in(startindex:(stopindex-1),:);
reac1part=reac1(startindex:(stopindex-1),:);
reac2part=reac2(startindex:(stopindex-1),:);
reac3part=reac3(startindex:(stopindex-1),:);
reac4part=reac4(startindex:(stopindex-1),:);
reac5part=reac5(startindex:(stopindex-1),:);
settlerpart=settler(startindex:(stopindex-1),:);
recpart=rec(startindex:(stopindex-1),:);

% Effluent concentrations
timevector=time(2:end)-time(1:(end-1));

Qevec=settlerpart(:,31).*timevector;
Qinvec=inpart(:,15).*timevector;
SIevec=settlerpart(:,17).*Qevec;
SSevec=settlerpart(:,18).*Qevec;     
XIevec=settlerpart(:,19).*Qevec;
XSevec=settlerpart(:,20).*Qevec;  
XBHevec=settlerpart(:,21).*Qevec;  
XBAevec=settlerpart(:,22).*Qevec;
XPevec=settlerpart(:,23).*Qevec;
SOevec=settlerpart(:,24).*Qevec;
SNOevec=settlerpart(:,25).*Qevec;
SNHevec=settlerpart(:,26).*Qevec;
SNDevec=settlerpart(:,27).*Qevec;
XNDevec=settlerpart(:,28).*Qevec;
SALKevec=settlerpart(:,29).*Qevec;
TSSevec=settlerpart(:,30).*Qevec;

Qetot = sum(Qevec);
Qeav = Qetot/totalt;

SIeload = sum(SIevec);
SSeload = sum(SSevec);
XIeload = sum(XIevec);
XSeload = sum(XSevec);
XBHeload = sum(XBHevec);
XBAeload = sum(XBAevec);
XPeload = sum(XPevec);
SOeload = sum(SOevec);
SNOeload = sum(SNOevec);
SNHeload = sum(SNHevec);
SNDeload = sum(SNDevec);
XNDeload = sum(XNDevec);
SALKeload = sum(SALKevec);
TSSeload = sum(TSSevec);

SIeav = SIeload/Qetot;
SSeav = SSeload/Qetot;
XIeav = XIeload/Qetot;
XSeav = XSeload/Qetot;
XBHeav = XBHeload/Qetot;
XBAeav = XBAeload/Qetot;
XPeav = XPeload/Qetot;
SOeav = SOeload/Qetot;
SNOeav = SNOeload/Qetot;
SNHeav = SNHeload/Qetot;
SNDeav = SNDeload/Qetot;
XNDeav = XNDeload/Qetot;
SALKeav = SALKeload/Qetot;
TSSeav = TSSeload/Qetot;

totalNKjevec2=(SNHevec+SNDevec+XNDevec+i_XB*(XBHevec+XBAevec)+i_XP*(XPevec+XIevec))./Qevec;
totalNevec2=(SNOevec+SNHevec+SNDevec+XNDevec+i_XB*(XBHevec+XBAevec)+i_XP*(XPevec+XIevec))./Qevec;
totalCODevec2=(SIevec+SSevec+XIevec+XSevec+XBHevec+XBAevec+XPevec)./Qevec;
SNHevec2=SNHevec./Qevec;
TSSevec2=TSSevec./Qevec;
BOD5evec2=(0.25*(SSevec+XSevec+(1-f_P)*(XBHevec+XBAevec)))./Qevec;

totalNKjeload=SNHeload+SNDeload+XNDeload+i_XB*(XBHeload+XBAeload)+i_XP*(XPeload+XIeload);
totalNeload=SNOeload+totalNKjeload;
totalCODeload=(SIeload+SSeload+XIeload+XSeload+XBHeload+XBAeload+XPeload);
BOD5eload=(0.25*(SSeload+XSeload+(1-f_P)*(XBHeload+XBAeload)));

% Influent and Effluent quality index
SSin=inpart(:,14);
CODin=inpart(:,1)+inpart(:,2)+inpart(:,3)+inpart(:,4)+inpart(:,5)+inpart(:,6)+inpart(:,7);
SNKjin=inpart(:,10)+inpart(:,11)+inpart(:,12)+i_XB*(inpart(:,5)+inpart(:,6))+i_XP*(inpart(:,3)+inpart(:,7));
SNOin=inpart(:,9);
BOD5in=0.65*(inpart(:,2)+inpart(:,4)+(1-f_P)*(inpart(:,5)+inpart(:,6)));

SSe=settlerpart(:,30);
CODe=settlerpart(:,17)+settlerpart(:,18)+settlerpart(:,19)+settlerpart(:,20)+settlerpart(:,21)+settlerpart(:,22)+settlerpart(:,23);
SNKje=settlerpart(:,26)+settlerpart(:,27)+settlerpart(:,28)+i_XB*(settlerpart(:,21)+settlerpart(:,22))+i_XP*(settlerpart(:,19)+settlerpart(:,23));
SNOe=settlerpart(:,25);
BOD5e=0.25*(settlerpart(:,18)+settlerpart(:,20)+(1-f_P)*(settlerpart(:,21)+settlerpart(:,22)));

EQvecinst=(BSS*SSe+BCOD*CODe+BNKj*SNKje+BNO*SNOe+BBOD5*BOD5e).*settlerpart(:,31);
EQvecinst_new=(BSS*SSe+BCOD*CODe+BNKj_new*SNKje+BNO_new*SNOe+BBOD5*BOD5e).*settlerpart(:,31); %updated BSM TG meeting no 8

IQvec=(BSS*SSin+BCOD*CODin+BNKj*SNKjin+BNO*SNOin+BBOD5*BOD5in).*Qinvec;
IQvec_new=(BSS*SSin+BCOD*CODin+BNKj_new*SNKjin+BNO_new*SNOin+BBOD5*BOD5in).*Qinvec; %updated BSM TG meeting no 8
IQ=sum(IQvec)/(totalt*1000);
IQ_new=sum(IQvec_new)/(totalt*1000);
EQvec=(BSS*SSe+BCOD*CODe+BNKj*SNKje+BNO*SNOe+BBOD5*BOD5e).*Qevec;
EQvec_new=(BSS*SSe+BCOD*CODe+BNKj_new*SNKje+BNO_new*SNOe+BBOD5*BOD5e).*Qevec; %updated BSM TG meeting no 8
EQ=sum(EQvec)/(totalt*1000);
EQ_new=sum(EQvec_new)/(totalt*1000); %updated BSM TG meeting no 8

% Costfactors for operation

% Sludge production
TSSreactors_start = (reac1part(1,14)*VOL1+reac2part(1,14)*VOL2+reac3part(1,14)*VOL3+reac4part(1,14)*VOL4+reac5part(1,14)*VOL5)/1000;
TSSreactors_end = (reac1part(end,14)*VOL1+reac2part(end,14)*VOL2+reac3part(end,14)*VOL3+reac4part(end,14)*VOL4+reac5part(end,14)*VOL5)/1000;
TSSsettler_start=(settlerpart(1,32)*DIM(1)*DIM(2)/10+settlerpart(1,33)*DIM(1)*DIM(2)/10+settlerpart(1,34)*DIM(1)*DIM(2)/10+settlerpart(1,35)*DIM(1)*DIM(2)/10+settlerpart(1,36)*DIM(1)*DIM(2)/10+settlerpart(1,37)*DIM(1)*DIM(2)/10+settlerpart(1,38)*DIM(1)*DIM(2)/10+settlerpart(1,39)*DIM(1)*DIM(2)/10+settlerpart(1,40)*DIM(1)*DIM(2)/10+settlerpart(1,41)*DIM(1)*DIM(2)/10)/1000;
TSSsettler_end=(settlerpart(end,32)*DIM(1)*DIM(2)/10+settlerpart(end,33)*DIM(1)*DIM(2)/10+settlerpart(end,34)*DIM(1)*DIM(2)/10+settlerpart(end,35)*DIM(1)*DIM(2)/10+settlerpart(end,36)*DIM(1)*DIM(2)/10+settlerpart(end,37)*DIM(1)*DIM(2)/10+settlerpart(end,38)*DIM(1)*DIM(2)/10+settlerpart(end,39)*DIM(1)*DIM(2)/10+settlerpart(end,40)*DIM(1)*DIM(2)/10+settlerpart(end,41)*DIM(1)*DIM(2)/10)/1000;
TSSwasteconc=settlerpart(:,41)/1000;  %kg/m3
Qwasteflow=settlerpart(:,16);         %m3/d
TSSuvec=TSSwasteconc.*Qwasteflow.*timevector;
TSSproduced=sum(TSSuvec)+TSSreactors_end+TSSsettler_end-TSSreactors_start-TSSsettler_start;
TSSproducedperd = TSSproduced/totalt; %for OCI


% Aeration energy, original BSM1
%Script to modify the workspace variables (Kla, carb) from scalars to
%vectors in the openloop simulations. The function changeScalarToVector is
%defined at the end of this script.
invecsize = size(t);
kla1in=changeScalarToVector(kla1in,invecsize);
kla2in=changeScalarToVector(kla2in,invecsize);
kla3in=changeScalarToVector(kla3in,invecsize);
kla4in=changeScalarToVector(kla4in,invecsize);
kla5in=changeScalarToVector(kla5in,invecsize);

carbon1in=changeScalarToVector(carbon1in,invecsize);
carbon2in=changeScalarToVector(carbon2in,invecsize);
carbon3in=changeScalarToVector(carbon3in,invecsize);
carbon4in=changeScalarToVector(carbon4in,invecsize);
carbon5in=changeScalarToVector(carbon5in,invecsize);

kla1vec = kla1in(startindex:(stopindex-1),:);
kla2vec = kla2in(startindex:(stopindex-1),:);
kla3vec = kla3in(startindex:(stopindex-1),:);
kla4vec = kla4in(startindex:(stopindex-1),:);
kla5vec = kla5in(startindex:(stopindex-1),:);

kla1newvec = 0.0007*(VOL1/1333)*(kla1vec.*kla1vec)+0.3267*(VOL1/1333)*kla1vec;
kla2newvec = 0.0007*(VOL2/1333)*(kla2vec.*kla2vec)+0.3267*(VOL2/1333)*kla2vec;
kla3newvec = 0.0007*(VOL3/1333)*(kla3vec.*kla3vec)+0.3267*(VOL3/1333)*kla3vec;
kla4newvec = 0.0007*(VOL4/1333)*(kla4vec.*kla4vec)+0.3267*(VOL4/1333)*kla4vec;
kla5newvec = 0.0007*(VOL5/1333)*(kla5vec.*kla5vec)+0.3267*(VOL5/1333)*kla5vec;
airenergyvec = 24*(kla1newvec+kla2newvec+kla3newvec+kla4newvec+kla5newvec);
airenergy = sum(airenergyvec.*timevector);
airenergyperd = airenergy/totalt; % for OCI

% Aeration energy, updated BSM1 (and also for BSM2)
kla1newvec_new = SOSAT1*VOL1*kla1vec;
kla2newvec_new = SOSAT2*VOL2*kla2vec;
kla3newvec_new = SOSAT3*VOL3*kla3vec;
kla4newvec_new = SOSAT4*VOL4*kla4vec;
kla5newvec_new = SOSAT5*VOL5*kla5vec;
airenergyvec_new = (kla1newvec_new+kla2newvec_new+kla3newvec_new+kla4newvec_new+kla5newvec_new)/(1.8*1000);
airenergy_new = sum(airenergyvec_new.*timevector);
airenergy_newperd = airenergy_new/totalt; % for OCI

% Mixing energy (calculated as kWh consumed for the complete evaluation
% period), same as for BSM2
mixnumreac1 = length(find(kla1vec<20));
mixnumreac2 = length(find(kla2vec<20));
mixnumreac3 = length(find(kla3vec<20));
mixnumreac4 = length(find(kla4vec<20));
mixnumreac5 = length(find(kla5vec<20));

mixenergyunitreac = 0.005; %kW/m3

mixenergyreac1 = mixnumreac1*mixenergyunitreac*VOL1;
mixenergyreac2 = mixnumreac2*mixenergyunitreac*VOL2;
mixenergyreac3 = mixnumreac3*mixenergyunitreac*VOL3;
mixenergyreac4 = mixnumreac4*mixenergyunitreac*VOL4;
mixenergyreac5 = mixnumreac5*mixenergyunitreac*VOL5;

mixenergy = 24*(mixenergyreac1+mixenergyreac2+mixenergyreac3+mixenergyreac4+mixenergyreac5)*sampletime;
mixenergyperd = mixenergy/totalt; % for OCI


% Pumping energy, original BSM1
Qintrflow = recpart(:,15);
Qrflow = settlerpart(:,15);
pumpenergyvec = pumpfactor*(Qwasteflow+Qintrflow+Qrflow);
pumpenergy = sum(pumpenergyvec.*timevector);
pumpenergyperd = pumpenergy/totalt; %for OCI

% Pumping energy (based on BSM2 principles)
Qintrflow_new = recpart(:,15);
Qrflow_new = settlerpart(:,15);
Qwflow_new = settlerpart(:,16);
pumpenergyvec_new = PF_Qintr*Qintrflow_new+PF_Qr*Qrflow_new+PF_Qw*Qwflow_new;
pumpenergy_new = sum(pumpenergyvec_new.*timevector);
pumpenergy_newperd = pumpenergy_new/totalt; % for OCI


% % Carbon source addition
carbon1vec = carbon1in(startindex:(stopindex-1),:);
carbon2vec = carbon2in(startindex:(stopindex-1),:);
carbon3vec = carbon3in(startindex:(stopindex-1),:);
carbon4vec = carbon4in(startindex:(stopindex-1),:);
carbon5vec = carbon5in(startindex:(stopindex-1),:);
Qcarbonvec = (carbon1vec+carbon2vec+carbon3vec+carbon4vec+carbon5vec);
carbonmassvec = Qcarbonvec*CARBONSOURCECONC/1000;
Qcarbon = sum(Qcarbonvec.*timevector); %m3
carbonmass = sum(carbonmassvec.*timevector); %kg COD
carbonmassperd = carbonmass/totalt; %for OCI


% Operational Cost Index for BSM1
TSScost = 5*TSSproducedperd;
airenergycost = 1*airenergyperd; %original BSM1
airenergy_newcost = 1*airenergy_newperd; %updated BSM1
mixenergycost = 1*mixenergyperd; %based on BSM2
pumpenergycost = 1*pumpenergyperd; % original BSM1
pumpenergy_newcost = 1*pumpenergy_newperd; % based on BSM2
carbonmasscost = 3*carbonmassperd;

OCI = TSScost + airenergycost + mixenergycost + pumpenergycost + carbonmasscost;
OCI_new = TSScost + airenergy_newcost + mixenergycost + pumpenergy_newcost + carbonmasscost;


% Calculate 95% percentiles for effluent SNH, TN and TSS; BSM2 standard criteria
SNHeffprctile=prctile(SNHevec2,95);
TNeffprctile=prctile(totalNevec2,95);
TSSeffprctile=prctile(TSSevec2,95);


disp(' ')
disp(['Overall plant performance during time ',num2str(time(1)),' to ',num2str(time(end)),' days'])
disp('**************************************************')
disp(' ')
disp('Effluent average concentrations based on load')
disp('---------------------------------------------')
disp(['Effluent average flow rate = ',num2str(Qeav),' m3/d'])
disp(['Effluent average SI conc = ',num2str(SIeav),' mg COD/l'])
disp(['Effluent average SS conc = ',num2str(SSeav),' mg COD/l'])
disp(['Effluent average XI conc = ',num2str(XIeav),' mg COD/l'])
disp(['Effluent average XS conc = ',num2str(XSeav),' mg COD/l'])
disp(['Effluent average XBH conc = ',num2str(XBHeav),' mg COD/l'])
disp(['Effluent average XBA conc = ',num2str(XBAeav),' mg COD/l'])
disp(['Effluent average XP conc = ',num2str(XPeav),' mg COD/l'])
disp(['Effluent average SO conc = ',num2str(SOeav),' mg (-COD)/l'])
disp(['Effluent average SNO conc = ',num2str(SNOeav),' mg N/l'])
disp(['Effluent average SNH conc = ',num2str(SNHeav),' mg N/l  (limit = 4 mg N/l)'])
disp(['Effluent average SND conc = ',num2str(SNDeav),' mg N/l'])
disp(['Effluent average XND conc = ',num2str(XNDeav),' mg N/l'])
disp(['Effluent average SALK conc = ',num2str(SALKeav),' mol HCO3/m3'])
disp(['Effluent average TSS conc = ',num2str(TSSeav),' mg SS/l  (limit = 30 mg SS/l)'])
disp(' ')
disp(['Effluent average Kjeldahl N conc = ',num2str(SNHeav+SNDeav+XNDeav+i_XB*(XBHeav+XBAeav)+i_XP*(XIeav+XPeav)),' mg N/l'])
disp(['Effluent average total N conc = ',num2str(SNOeav+SNHeav+SNDeav+XNDeav+i_XB*(XBHeav+XBAeav)+i_XP*(XIeav+XPeav)),' mg N/l  (limit = 18 mg COD/l)'])
disp(['Effluent average total COD conc = ',num2str(SIeav+SSeav+XIeav+XSeav+XBHeav+XBAeav+XPeav),' mg COD/l  (limit = 100 mg COD/l)'])
disp(['Effluent average BOD5 conc = ',num2str(0.25*(SSeav+XSeav+(1-f_P)*(XBHeav+XBAeav))),' mg/l  (limit = 10 mg/l)'])

disp(' ')
disp('Effluent average load')
disp('---------------------')
disp(['Effluent average SI load = ',num2str(SIeload/(1000*totalt)),' kg COD/day'])
disp(['Effluent average SS load = ',num2str(SSeload/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XI load = ',num2str(XIeload/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XS load = ',num2str(XSeload/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XBH load = ',num2str(XBHeload/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XBA load = ',num2str(XBAeload/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XP load = ',num2str(XPeload/(1000*totalt)),' kg COD/day'])
disp(['Effluent average SO load = ',num2str(SOeload/(1000*totalt)),' kg (-COD)/day'])
disp(['Effluent average SNO load = ',num2str(SNOeload/(1000*totalt)),' kg N/day'])
disp(['Effluent average SNH load = ',num2str(SNHeload/(1000*totalt)),' kg N/day'])
disp(['Effluent average SND load = ',num2str(SNDeload/(1000*totalt)),' kg N/day'])
disp(['Effluent average XND load = ',num2str(XNDeload/(1000*totalt)),' kg N/day'])
disp(['Effluent average SALK load = ',num2str(SALKeload/(1000*totalt)),' kmol HCO3/day'])
disp(['Effluent average TSS load = ',num2str(TSSeload/(1000*totalt)),' kg SS/day'])
disp(' ')
disp(['Effluent average Kjeldahl N load = ',num2str(totalNKjeload/(1000*totalt)),' kg N/d'])
disp(['Effluent average total N load = ',num2str(totalNeload/(1000*totalt)),' kg N/d'])
disp(['Effluent average total COD load = ',num2str(totalCODeload/(1000*totalt)),' kg COD/d'])
disp(['Effluent average BOD5 load = ',num2str(BOD5eload/(1000*totalt)),' kg/d'])
disp(' ')
disp('Other effluent quality variables')
disp('--------------------------------')
disp(['Influent Quality (I.Q.) index = ',num2str(IQ),' kg poll.units/d (original BSM1 version)'])
disp(['Effluent Quality (E.Q.) index = ',num2str(EQ),' kg poll.units/d (original BSM1 version)'])
disp(['Influent Quality (I.Q.) index = ',num2str(IQ_new),' kg poll.units/d (updated BSM1 version)'])
disp(['Effluent Quality (E.Q.) index = ',num2str(EQ_new),' kg poll.units/d (updated BSM1 version)'])

disp(' ')
disp(['Sludge production for disposal = ',num2str(TSSproduced),' kg SS'])
disp(['Average sludge production for disposal per day = ',num2str(TSSproduced/totalt),' kg SS/d'])
disp(['Sludge production released into effluent = ',num2str(TSSeload/1000),' kg SS'])
disp(['Average sludge production released into effluent per day = ',num2str(TSSeload/(1000*totalt)),' kg SS/d'])
disp(['Total sludge production = ',num2str(TSSproduced+TSSeload/1000),' kg SS'])
disp(['Total average sludge production per day = ',num2str(TSSproduced/totalt+TSSeload/(1000*totalt)),' kg SS/d'])

disp(' ')
disp(['Total aeration energy = ',num2str(airenergy),' kWh (original BSM1 version)'])
disp(['Average aeration energy per day = ',num2str(airenergy/totalt),' kWh/d (original BSM1 version)'])
disp(['Total aeration energy = ',num2str(airenergy_new),' kWh (updated BSM1 version)'])
disp(['Average aeration energy per day = ',num2str(airenergy_new/totalt),' kWh/d (updated BSM1 version)'])
disp(' ')
disp(['Total pumping energy (for Qintr, Qr and Qw) = ',num2str(pumpenergy),' kWh (original BSM1 version)'])
disp(['Average pumping energy per day (for Qintr, Qr and Qw) = ',num2str(pumpenergy/totalt),' kWh/d (original BSM1 version)'])
disp(['Total pumping energy (for Qintr, Qr and Qw) = ',num2str(pumpenergy_new),' kWh (based on BSM2 principles)'])
disp(['Average pumping energy per day (for Qintr, Qr and Qw) = ',num2str(pumpenergy_new/totalt),' kWh/d (based on BSM2 principles)'])
disp(' ')
disp(['Total mixing energy = ',num2str(mixenergy),' kWh (based on BSM2 principles)'])
disp(['Average mixing energy per day = ',num2str(mixenergy/totalt),' kWh/d (based on BSM2 principles)'])
disp(' ')
disp(['Total added carbon volume = ',num2str(Qcarbon),' m3'])
disp(['Average added carbon flow rate = ',num2str(Qcarbon/totalt),' m3/d'])
disp(['Total added carbon mass = ',num2str(carbonmass),' kg COD'])
disp(['Average added carbon mass per day = ',num2str(carbonmass/totalt),' kg COD/d'])
disp(' ')
disp('Operational Cost Index')
disp('----------------------')
disp(['Sludge production cost index = ',num2str(TSScost),' (using weight 5 for BSM1)'])
disp(['Aeration energy cost index = ',num2str(airenergycost),' (original BSM1 version)'])
disp(['Updated aeration energy cost index = ',num2str(airenergy_newcost),' (updated BSM1 version)'])
disp(['Pumping energy cost index = ',num2str(pumpenergycost),' (original BSM1 version)'])
disp(['Updated pumping energy cost index = ',num2str(pumpenergy_newcost),' (based on BSM2 principles)'])
disp(['Carbon source addition cost index = ',num2str(carbonmasscost)])
disp(['Mixing energy cost index = ',num2str(mixenergycost),' (based on BSM2 principles)'])
disp(['Total Operational Cost Index (OCI) = ',num2str(OCI),' (original BSM1 version)'])
disp(['Updated Total Operational Cost Index (OCI) = ',num2str(OCI_new),' (using new aeraration and pumping costs)'])
disp(' ')

Nviolation=find(totalNevec2>totalNemax);
CODviolation=find(totalCODevec2>totalCODemax);
SNHviolation=find(SNHevec2>SNHemax);
TSSviolation=find(TSSevec2>TSSemax);
BOD5violation=find(BOD5evec2>BOD5emax);

noofNviolation = 1;
noofCODviolation = 1;
noofSNHviolation = 1;
noofTSSviolation = 1;
noofBOD5violation = 1;

disp('Effluent violations')
disp('-------------------')
disp(['95% percentile for effluent SNH (Ammonia95) = ',num2str(SNHeffprctile),' g N/m3'])
disp(['95% percentile for effluent TN (TN95) = ',num2str(TNeffprctile),' g N/m3'])
disp(['95% percentile for effluent TSS (TSS95) = ',num2str(TSSeffprctile),' g SS/m3'])
disp(' ')

if not(isempty(Nviolation))
  disp('The maximum effluent total nitrogen level (18 mg N/l) was violated')
  disp(['during ',num2str(min(totalt,length(Nviolation)*sampletime)),' days, i.e. ',num2str(min(100,length(Nviolation)*sampletime/totalt*100)),'% of the operating time.'])
  for i=2:length(Nviolation)
    if Nviolation(i-1)~=(Nviolation(i)-1)
      noofNviolation = noofNviolation+1;
    end
  end
  disp(['The limit was violated at ',num2str(noofNviolation),' different occasions.'])
  disp(' ')
end

if not(isempty(CODviolation))
  disp('The maximum effluent total COD level (100 mg COD/l) was violated')
  disp(['during ',num2str(min(totalt,length(CODviolation)*sampletime)),' days, i.e. ',num2str(min(100,length(CODviolation)*sampletime/totalt*100)),'% of the operating time.'])
  for i=2:length(CODviolation)
    if CODviolation(i-1)~=(CODviolation(i)-1)
      noofCODviolation = noofCODviolation+1;
    end
  end
  disp(['The limit was violated at ',num2str(noofCODviolation),' different occasions.'])
  disp(' ')
end

if not(isempty(SNHviolation))
  disp('The maximum effluent ammonia nitrogen level (4 mg N/l) was violated')
  disp(['during ',num2str(min(totalt,length(SNHviolation)*sampletime)),' days, i.e. ',num2str(min(100,length(SNHviolation)*sampletime/totalt*100)),'% of the operating time.'])
  for i=2:length(SNHviolation)
    if SNHviolation(i-1)~=(SNHviolation(i)-1)
      noofSNHviolation = noofSNHviolation+1;
    end
  end
  disp(['The limit was violated at ',num2str(noofSNHviolation),' different occasions.'])
  disp(' ')
end

if not(isempty(TSSviolation))
  disp('The maximum effluent total suspended solids level (30 mg SS/l) was violated')
  disp(['during ',num2str(min(totalt,length(TSSviolation)*sampletime)),' days, i.e. ',num2str(min(100,length(TSSviolation)*sampletime/totalt*100)),'% of the operating time.'])
  for i=2:length(TSSviolation)
    if TSSviolation(i-1)~=(TSSviolation(i)-1)
      noofTSSviolation = noofTSSviolation+1;
    end
  end
  disp(['The limit was violated at ',num2str(noofTSSviolation),' different occasions.'])
  disp(' ')
end

if not(isempty(BOD5violation))
  disp('The maximum effluent BOD5 level (10 mg/l) was violated')
  disp(['during ',num2str(min(totalt,length(BOD5violation)*sampletime)),' days, i.e. ',num2str(min(100,length(BOD5violation)*sampletime/totalt*100)),'% of the operating time.'])
  for i=2:length(BOD5violation)
    if BOD5violation(i-1)~=(BOD5violation(i)-1)
      noofBOD5violation = noofBOD5violation+1;
    end
  end
  disp(['The limit was violated at ',num2str(noofBOD5violation),' different occasions.'])
  disp(' ')
end

figure(3)
plot(time(1:(end-1)),totalNevec2)
hold on
plot([time(1) time(end-1)],[totalNemax totalNemax],'r')
xlabel('time (days)')
ylabel('Total nitrogen concentration in effluent (mg N/l)')
title('Effluent total nitrogen and limit value')
hold off

figure(4)
plot(time(1:(end-1)),totalCODevec2)
hold on
plot([time(1) time(end-1)],[totalCODemax totalCODemax],'r')
xlabel('time (days)')
ylabel('Total COD concentration in effluent (mg COD/l)')
title('Effluent total COD and limit value')
hold off

figure(5)
plot(time(1:(end-1)),SNHevec2)
hold on
plot([time(1) time(end-1)],[SNHemax SNHemax],'r')
xlabel('time (days)')
ylabel('Ammonia concentration in effluent (mg N/l)')
title('Effluent total ammonia and limit value')
hold off

figure(6)
plot(time(1:(end-1)),TSSevec2)
hold on
plot([time(1) time(end-1)],[TSSemax TSSemax],'r')
xlabel('time (days)')
ylabel('Suspended solids concentration in effluent (mg SS/l)')
title('Effluent suspended solids and limit value')
hold off

figure(7)
plot(time(1:(end-1)),BOD5evec2)
hold on
plot([time(1) time(end-1)],[BOD5emax BOD5emax],'r')
xlabel('time (days)')
ylabel('BOD5 concentration in effluent (mg/l)')
title('Effluent BOD5 and limit value')
hold off

figure(8)
plot(time(1:(end-1)),TSSwasteconc.*Qwasteflow)
xlabel('time (days)')
ylabel('Instantaneous sludge wastage rate (kg SS/d)')

figure(9)
plot(time(1:(end-1)),EQvecinst./1000)
hold on
plot(time(1:(end-1)),EQvecinst_new./1000,'r')
xlabel('time (days)')
ylabel('Instantaneous Effluent Quality index (kg poll.units/d)')
hold off

figure(10)
plot(time(1:(end-1)),pumpenergyvec)
hold on
plot(time(1:(end-1)),pumpenergyvec_new,'r')
xlabel('time (days)')
ylabel('Instantaneous pumping energy (kWh/d)')
hold off

figure(11)
plot(time(1:(end-1)),airenergyvec)
hold on
plot(time(1:(end-1)),airenergyvec_new,'r')
xlabel('time (days)')
ylabel('Instantaneous aeration energy (kWh/d)')
hold off

 figure(12)
 plot(time(1:(end-1))-starttime,carbonmassvec,'b','LineWidth',1.5)
 xlabel('time (days)','FontSize',10,'FontWeight','bold')
 ylabel('Instantaneous carbon source dosage(kg COD/d)','FontSize',10,'FontWeight','bold')
 xlim([0 (stoptime-starttime)])
 set(gca,'LineWidth',1.5,'FontSize',10,'FontWeight','bold')
    
% Plot of the SNH, TN and TSS curves
SNHeffsort = sort(SNHevec2);
TNeffsort = sort(totalNevec2);
TSSeffsort = sort(TSSevec2);
n = size(SNHevec2,1);
xvalues = [1:n].*(100/n);

figure(13)
plot(xvalues,SNHeffsort,'b','LineWidth',1.5)
hold on
plot([0 95],[SNHeffprctile SNHeffprctile],'k--','LineWidth',1.5)
plot([95 95],[0 SNHeffprctile],'k--','LineWidth',1.5)
xlabel('Ordered S_N_H effluent concentrations (%)','FontSize',10,'FontWeight','bold')
ylabel('S_N_H effluent concentrations (g N/m^3)','FontSize',10,'FontWeight','bold')
title('Ordered effluent S_N_H concentrations with 95% percentile','FontSize',10,'FontWeight','bold')
xlim([0 105])
set(gca,'LineWidth',1.5,'FontSize',10,'FontWeight','bold')
hold off

figure(14)
plot(xvalues,TNeffsort,'b','LineWidth',1.5)
hold on
plot([0 95],[TNeffprctile TNeffprctile],'k--','LineWidth',1.5)
plot([95 95],[0 TNeffprctile],'k--','LineWidth',1.5)
xlabel('Ordered TN effluent concentrations (%)','FontSize',10,'FontWeight','bold')
ylabel('TN effluent concentrations (g N/m^3)','FontSize',10,'FontWeight','bold')
title('Ordered effluent TN concentrations with 95% percentile','FontSize',10,'FontWeight','bold')
xlim([0 105])
set(gca,'LineWidth',1.5,'FontSize',10,'FontWeight','bold')
hold off

figure(15)
plot(xvalues,TSSeffsort,'b','LineWidth',1.5)
hold on
plot([0 95],[TSSeffprctile TSSeffprctile],'k--','LineWidth',1.5)
plot([95 95],[0 TSSeffprctile],'k--','LineWidth',1.5)
xlabel('Ordered TSS effluent concentrations (%)','FontSize',10,'FontWeight','bold')
ylabel('TSS effluent concentrations (g SS/m^3)','FontSize',10,'FontWeight','bold')
title('Ordered effluent TSS concentrations with 95% percentile','FontSize',10,'FontWeight','bold')
xlim([0 105])
set(gca,'LineWidth',1.5,'FontSize',10,'FontWeight','bold')
hold off

% Call the 'fuzzified' expert module to detect settling problems
perf_risk

function [outvector] = changeScalarToVector(invariable,outvecsize)
%Vector to modify variables like Kla1in, carb1in etc to vectors from
%scalars
%% Inputs
%invariable - input variable that needs to be changed, if required
%outvecsize  - Size of the output vector
%outvector - output vector

if size(invariable,1)>1
    outvector=invariable;
else
    outvector=ones(outvecsize).*invariable;
end
end
