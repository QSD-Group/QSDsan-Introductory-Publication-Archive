% Method1: using time from the data files and zero-order hold for data (also 
% flow)

disp(' ');
disp('Method1: using time from the data files and zero-order hold')
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

Qin = a(:,16).*timevector;
Si=a(:,2).*Qin;
Ss=a(:,3).*Qin;
Xi=a(:,4).*Qin;
Xs=a(:,5).*Qin;
Xbh=a(:,6).*Qin;
Xba=a(:,7).*Qin;
Xp=a(:,8).*Qin;
So=a(:,9).*Qin;
Sno=a(:,10).*Qin;
Snh=a(:,11).*Qin;
Snd=a(:,12).*Qin;
Xnd=a(:,13).*Qin;
Salk=a(:,14).*Qin;

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

Qin = a(:,16).*timevector;
Si=a(:,2).*Qin;
Ss=a(:,3).*Qin;
Xi=a(:,4).*Qin;
Xs=a(:,5).*Qin;
Xbh=a(:,6).*Qin;
Xba=a(:,7).*Qin;
Xp=a(:,8).*Qin;
So=a(:,9).*Qin;
Sno=a(:,10).*Qin;
Snh=a(:,11).*Qin;
Snd=a(:,12).*Qin;
Xnd=a(:,13).*Qin;
Salk=a(:,14).*Qin;

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

Qin = a(:,16).*timevector;
Si=a(:,2).*Qin;
Ss=a(:,3).*Qin;
Xi=a(:,4).*Qin;
Xs=a(:,5).*Qin;
Xbh=a(:,6).*Qin;
Xba=a(:,7).*Qin;
Xp=a(:,8).*Qin;
So=a(:,9).*Qin;
Sno=a(:,10).*Qin;
Snh=a(:,11).*Qin;
Snd=a(:,12).*Qin;
Xnd=a(:,13).*Qin;
Salk=a(:,14).*Qin;

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

