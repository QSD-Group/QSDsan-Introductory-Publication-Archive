% Method2: using time from the data files and first-order hold for data (also 
% flow)

disp(' ');
disp('Method2: using time from the data files and first-order hold')
disp('for data (including flow)!')
disp(' ')

load dryinfluent
load raininfluent
load storminfluent
a=DRYINFLUENT;

%special to only investigate load during the evaluation week
b=min(find(a(:,1)>=7));
a=a(b:end,:);
[m,n]=size(a);

time=a(:,1);
time=[time; 14];
timespan = time(end)-time(1);
timevector = time(2:(m+1))-time(1:m);
%timevector = timevector.*0+(1/96);

Qinextra = [(a(2:(end),16)-a(1:(end-1),16))/2; 0];
Siextra = [(a(2:(end),2)-a(1:(end-1),2))/2; 0];
Ssextra = [(a(2:(end),3)-a(1:(end-1),3))/2; 0];
Xiextra = [(a(2:(end),4)-a(1:(end-1),4))/2; 0];
Xsextra = [(a(2:(end),5)-a(1:(end-1),5))/2; 0];
Xbhextra = [(a(2:(end),6)-a(1:(end-1),6))/2; 0];
Xbaextra = [(a(2:(end),7)-a(1:(end-1),7))/2; 0];
Xpextra = [(a(2:(end),8)-a(1:(end-1),8))/2; 0];
Soextra = [(a(2:(end),9)-a(1:(end-1),9))/2; 0];
Snoextra = [(a(2:(end),10)-a(1:(end-1),10))/2; 0];
Snhextra = [(a(2:(end),11)-a(1:(end-1),11))/2; 0];
Sndextra = [(a(2:(end),12)-a(1:(end-1),12))/2; 0];
Xndextra = [(a(2:(end),13)-a(1:(end-1),13))/2; 0];
Salkextra = [(a(2:(end),14)-a(1:(end-1),14))/2; 0];

Qin = (a(:,16)+Qinextra).*timevector;
Si=(a(:,2)+Siextra).*Qin;
Ss=(a(:,3)+Ssextra).*Qin;
Xi=(a(:,4)+Xiextra).*Qin;
Xs=(a(:,5)+Xsextra).*Qin;
Xbh=(a(:,6)+Xbhextra).*Qin;
Xba=(a(:,7)+Xbaextra).*Qin;
Xp=(a(:,8)+Xpextra).*Qin;
So=(a(:,9)+Soextra).*Qin;
Sno=(a(:,10)+Snoextra).*Qin;
Snh=(a(:,11)+Snhextra).*Qin;
Snd=(a(:,12)+Sndextra).*Qin;
Xnd=(a(:,13)+Xndextra).*Qin;
Salk=(a(:,14)+Salkextra).*Qin;

Qintot = sum(Qin);
Qinav = Qintot/timespan;

Siload = sum(Si);
Ssload = sum(Ss);
Xiload = sum(Xi);
Xsload = sum(Xs);
Xbhload = sum(Xbh);
Xbaload = sum(Xba);
Xpload = sum(Xp);
Soload = sum(So);
Snoload = sum(Sno);
Snhload = sum(Snh);
Sndload = sum(Snd);
Xndload = sum(Xnd);
Salkload = sum(Salk);

Siav = Siload/Qintot;
Ssav = Ssload/Qintot;
Xiav = Xiload/Qintot;
Xsav = Xsload/Qintot;
Xbhav = Xbhload/Qintot;
Xbaav = Xbaload/Qintot;
Xpav = Xpload/Qintot;
Soav = Soload/Qintot;
Snoav = Snoload/Qintot;
Snhav = Snhload/Qintot;
Sndav = Sndload/Qintot;
Xndav = Xndload/Qintot;
Salkav = Salkload/Qintot;

disp('Average values based on load for DRYWEATHER data')
disp('************************************************')
disp(['   SI =  ', num2str(Siav), ' mg COD/l']);
disp(['   SS =  ', num2str(Ssav), ' mg COD/l']);
disp(['   XI =  ', num2str(Xiav), ' mg COD/l']);
disp(['   XS =  ', num2str(Xsav), ' mg COD/l']);
disp(['   XBH = ', num2str(Xbhav), ' mg COD/l']);
disp(['   XBA = ', num2str(Xbaav), ' mg COD/l']);
disp(['   XP =  ', num2str(Xpav), ' mg COD/l']);
disp(['   SO =  ', num2str(Soav), ' mg -COD/l']);
disp(['   SNO = ', num2str(Snoav), ' mg N/l']);
disp(['   SNH = ', num2str(Snhav), ' mg N/l']);
disp(['   SND = ', num2str(Sndav), ' mg N/l']);
disp(['   XND = ', num2str(Xndav), ' mg N/l']);
disp(['   SALK = ', num2str(Salkav), ' mol HCO3/m3']);
disp(['   Qin = ', num2str(Qinav), ' m3/d']);
disp(' ')
disp('Loads for DRYWEATHER data')
disp('*************************')
disp(['   SI =  ', num2str(Siload/(1000*timespan)), ' kg/d']);
disp(['   SS =  ', num2str(Ssload/(1000*timespan)), ' kg/d']);
disp(['   XI =  ', num2str(Xiload/(1000*timespan)), ' kg/d']);
disp(['   XS =  ', num2str(Xsload/(1000*timespan)), ' kg/d']);
disp(['   XBH = ', num2str(Xbhload/(1000*timespan)), ' kg/d']);
disp(['   XBA = ', num2str(Xbaload/(1000*timespan)), ' kg/d']);
disp(['   XP =  ', num2str(Xpload/(1000*timespan)), ' kg/d']);
disp(['   SO =  ', num2str(Soload/(1000*timespan)), ' kg/d']);
disp(['   SNO = ', num2str(Snoload/(1000*timespan)), ' kg/d']);
disp(['   SNH = ', num2str(Snhload/(1000*timespan)), ' kg/d']);
disp(['   SND = ', num2str(Sndload/(1000*timespan)), ' kg/d']);
disp(['   XND = ', num2str(Xndload/(1000*timespan)), ' kg/d']);
disp(['   SALK = ', num2str(Salkload/(1000*timespan)), ' kmol HCO3/d']);



a=RAININFLUENT;
%special to only investiagte load during the evaluation week
b=min(find(a(:,1)>=7));
a=a(b:end,:);

[m,n]=size(a);

time=a(:,1);
time=[time; 14];
timespan = time(end)-time(1);
timevector = time(2:(m+1))-time(1:m);

Qinextra = [(a(2:(end),16)-a(1:(end-1),16))/2; 0];
Siextra = [(a(2:(end),2)-a(1:(end-1),2))/2; 0];
Ssextra = [(a(2:(end),3)-a(1:(end-1),3))/2; 0];
Xiextra = [(a(2:(end),4)-a(1:(end-1),4))/2; 0];
Xsextra = [(a(2:(end),5)-a(1:(end-1),5))/2; 0];
Xbhextra = [(a(2:(end),6)-a(1:(end-1),6))/2; 0];
Xbaextra = [(a(2:(end),7)-a(1:(end-1),7))/2; 0];
Xpextra = [(a(2:(end),8)-a(1:(end-1),8))/2; 0];
Soextra = [(a(2:(end),9)-a(1:(end-1),9))/2; 0];
Snoextra = [(a(2:(end),10)-a(1:(end-1),10))/2; 0];
Snhextra = [(a(2:(end),11)-a(1:(end-1),11))/2; 0];
Sndextra = [(a(2:(end),12)-a(1:(end-1),12))/2; 0];
Xndextra = [(a(2:(end),13)-a(1:(end-1),13))/2; 0];
Salkextra = [(a(2:(end),14)-a(1:(end-1),14))/2; 0];

Qin = (a(:,16)+Qinextra).*timevector;
Si=(a(:,2)+Siextra).*Qin;
Ss=(a(:,3)+Ssextra).*Qin;
Xi=(a(:,4)+Xiextra).*Qin;
Xs=(a(:,5)+Xsextra).*Qin;
Xbh=(a(:,6)+Xbhextra).*Qin;
Xba=(a(:,7)+Xbaextra).*Qin;
Xp=(a(:,8)+Xpextra).*Qin;
So=(a(:,9)+Soextra).*Qin;
Sno=(a(:,10)+Snoextra).*Qin;
Snh=(a(:,11)+Snhextra).*Qin;
Snd=(a(:,12)+Sndextra).*Qin;
Xnd=(a(:,13)+Xndextra).*Qin;
Salk=(a(:,14)+Salkextra).*Qin;

Qintot = sum(Qin);
Qinav = Qintot/timespan;

Siload = sum(Si);
Ssload = sum(Ss);
Xiload = sum(Xi);
Xsload = sum(Xs);
Xbhload = sum(Xbh);
Xbaload = sum(Xba);
Xpload = sum(Xp);
Soload = sum(So);
Snoload = sum(Sno);
Snhload = sum(Snh);
Sndload = sum(Snd);
Xndload = sum(Xnd);
Salkload = sum(Salk);

Siav = Siload/Qintot;
Ssav = Ssload/Qintot;
Xiav = Xiload/Qintot;
Xsav = Xsload/Qintot;
Xbhav = Xbhload/Qintot;
Xbaav = Xbaload/Qintot;
Xpav = Xpload/Qintot;
Soav = Soload/Qintot;
Snoav = Snoload/Qintot;
Snhav = Snhload/Qintot;
Sndav = Sndload/Qintot;
Xndav = Xndload/Qintot;
Salkav = Salkload/Qintot;

disp(' ')
disp('Average values based on load for RAINWEATHER data')
disp('*************************************************')
disp(['   SI =  ', num2str(Siav), ' mg COD/l']);
disp(['   SS =  ', num2str(Ssav), ' mg COD/l']);
disp(['   XI =  ', num2str(Xiav), ' mg COD/l']);
disp(['   XS =  ', num2str(Xsav), ' mg COD/l']);
disp(['   XBH = ', num2str(Xbhav), ' mg COD/l']);
disp(['   XBA = ', num2str(Xbaav), ' mg COD/l']);
disp(['   XP =  ', num2str(Xpav), ' mg COD/l']);
disp(['   SO =  ', num2str(Soav), ' mg -COD/l']);
disp(['   SNO = ', num2str(Snoav), ' mg N/l']);
disp(['   SNH = ', num2str(Snhav), ' mg N/l']);
disp(['   SND = ', num2str(Sndav), ' mg N/l']);
disp(['   XND = ', num2str(Xndav), ' mg N/l']);
disp(['   SALK = ', num2str(Salkav), ' mol HCO3/m3']);
disp(['   Qin = ', num2str(Qinav), ' m3/d']);
disp(' ')
disp('Loads for RAINWEATHER data')
disp('**************************')
disp(['   SI =  ', num2str(Siload/(1000*timespan)), ' kg/d']);
disp(['   SS =  ', num2str(Ssload/(1000*timespan)), ' kg/d']);
disp(['   XI =  ', num2str(Xiload/(1000*timespan)), ' kg/d']);
disp(['   XS =  ', num2str(Xsload/(1000*timespan)), ' kg/d']);
disp(['   XBH = ', num2str(Xbhload/(1000*timespan)), ' kg/d']);
disp(['   XBA = ', num2str(Xbaload/(1000*timespan)), ' kg/d']);
disp(['   XP =  ', num2str(Xpload/(1000*timespan)), ' kg/d']);
disp(['   SO =  ', num2str(Soload/(1000*timespan)), ' kg/d']);
disp(['   SNO = ', num2str(Snoload/(1000*timespan)), ' kg/d']);
disp(['   SNH = ', num2str(Snhload/(1000*timespan)), ' kg/d']);
disp(['   SND = ', num2str(Sndload/(1000*timespan)), ' kg/d']);
disp(['   XND = ', num2str(Xndload/(1000*timespan)), ' kg/d']);
disp(['   SALK = ', num2str(Salkload/(1000*timespan)), ' kmol HCO3/d']);



a=STORMINFLUENT;
%special to only investiagte load during the evaluation week
b=min(find(a(:,1)>=7));
a=a(b:end,:);

[m,n]=size(a);

time=a(:,1);
time=[time; 14];
timespan = time(end)-time(1);
timevector = time(2:(m+1))-time(1:m);

Qinextra = [(a(2:(end),16)-a(1:(end-1),16))/2; 0];
Siextra = [(a(2:(end),2)-a(1:(end-1),2))/2; 0];
Ssextra = [(a(2:(end),3)-a(1:(end-1),3))/2; 0];
Xiextra = [(a(2:(end),4)-a(1:(end-1),4))/2; 0];
Xsextra = [(a(2:(end),5)-a(1:(end-1),5))/2; 0];
Xbhextra = [(a(2:(end),6)-a(1:(end-1),6))/2; 0];
Xbaextra = [(a(2:(end),7)-a(1:(end-1),7))/2; 0];
Xpextra = [(a(2:(end),8)-a(1:(end-1),8))/2; 0];
Soextra = [(a(2:(end),9)-a(1:(end-1),9))/2; 0];
Snoextra = [(a(2:(end),10)-a(1:(end-1),10))/2; 0];
Snhextra = [(a(2:(end),11)-a(1:(end-1),11))/2; 0];
Sndextra = [(a(2:(end),12)-a(1:(end-1),12))/2; 0];
Xndextra = [(a(2:(end),13)-a(1:(end-1),13))/2; 0];
Salkextra = [(a(2:(end),14)-a(1:(end-1),14))/2; 0];

Qin = (a(:,16)+Qinextra).*timevector;
Si=(a(:,2)+Siextra).*Qin;
Ss=(a(:,3)+Ssextra).*Qin;
Xi=(a(:,4)+Xiextra).*Qin;
Xs=(a(:,5)+Xsextra).*Qin;
Xbh=(a(:,6)+Xbhextra).*Qin;
Xba=(a(:,7)+Xbaextra).*Qin;
Xp=(a(:,8)+Xpextra).*Qin;
So=(a(:,9)+Soextra).*Qin;
Sno=(a(:,10)+Snoextra).*Qin;
Snh=(a(:,11)+Snhextra).*Qin;
Snd=(a(:,12)+Sndextra).*Qin;
Xnd=(a(:,13)+Xndextra).*Qin;
Salk=(a(:,14)+Salkextra).*Qin;

Qintot = sum(Qin);
Qinav = Qintot/timespan;

Siload = sum(Si);
Ssload = sum(Ss);
Xiload = sum(Xi);
Xsload = sum(Xs);
Xbhload = sum(Xbh);
Xbaload = sum(Xba);
Xpload = sum(Xp);
Soload = sum(So);
Snoload = sum(Sno);
Snhload = sum(Snh);
Sndload = sum(Snd);
Xndload = sum(Xnd);
Salkload = sum(Salk);

Siav = Siload/Qintot;
Ssav = Ssload/Qintot;
Xiav = Xiload/Qintot;
Xsav = Xsload/Qintot;
Xbhav = Xbhload/Qintot;
Xbaav = Xbaload/Qintot;
Xpav = Xpload/Qintot;
Soav = Soload/Qintot;
Snoav = Snoload/Qintot;
Snhav = Snhload/Qintot;
Sndav = Sndload/Qintot;
Xndav = Xndload/Qintot;
Salkav = Salkload/Qintot;

disp(' ')
disp('Average values based on load for STORMWEATHER data')
disp('**************************************************')
disp(['   SI =  ', num2str(Siav), ' mg COD/l']);
disp(['   SS =  ', num2str(Ssav), ' mg COD/l']);
disp(['   XI =  ', num2str(Xiav), ' mg COD/l']);
disp(['   XS =  ', num2str(Xsav), ' mg COD/l']);
disp(['   XBH = ', num2str(Xbhav), ' mg COD/l']);
disp(['   XBA = ', num2str(Xbaav), ' mg COD/l']);
disp(['   XP =  ', num2str(Xpav), ' mg COD/l']);
disp(['   SO =  ', num2str(Soav), ' mg -COD/l']);
disp(['   SNO = ', num2str(Snoav), ' mg N/l']);
disp(['   SNH = ', num2str(Snhav), ' mg N/l']);
disp(['   SND = ', num2str(Sndav), ' mg N/l']);
disp(['   XND = ', num2str(Xndav), ' mg N/l']);
disp(['   SALK = ', num2str(Salkav), ' mol HCO3/m3']);
disp(['   Qin = ', num2str(Qinav), ' m3/d']);
disp(' ')
disp('Loads for STORMWEATHER data')
disp('***************************')
disp(['   SI =  ', num2str(Siload/(1000*timespan)), ' kg/d']);
disp(['   SS =  ', num2str(Ssload/(1000*timespan)), ' kg/d']);
disp(['   XI =  ', num2str(Xiload/(1000*timespan)), ' kg/d']);
disp(['   XS =  ', num2str(Xsload/(1000*timespan)), ' kg/d']);
disp(['   XBH = ', num2str(Xbhload/(1000*timespan)), ' kg/d']);
disp(['   XBA = ', num2str(Xbaload/(1000*timespan)), ' kg/d']);
disp(['   XP =  ', num2str(Xpload/(1000*timespan)), ' kg/d']);
disp(['   SO =  ', num2str(Soload/(1000*timespan)), ' kg/d']);
disp(['   SNO = ', num2str(Snoload/(1000*timespan)), ' kg/d']);
disp(['   SNH = ', num2str(Snhload/(1000*timespan)), ' kg/d']);
disp(['   SND = ', num2str(Sndload/(1000*timespan)), ' kg/d']);
disp(['   XND = ', num2str(Xndload/(1000*timespan)), ' kg/d']);
disp(['   SALK = ', num2str(Salkload/(1000*timespan)), ' kmol HCO3/d']);

