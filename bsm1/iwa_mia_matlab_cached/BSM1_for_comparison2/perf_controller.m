% Controller performance module for the benchmarking
% 990316 UJ

% cut away first and last samples, i.e. t=smaller than starttime and 
% t = larger than stoptime
% 2007-12-07 file updated, UJ
starttime = 7;
stoptime = 14;
startindex=max(find(t <= starttime));
stopindex=min(find(t >= stoptime));

time=t(startindex:stopindex);

sampletime = time(2)-time(1);
totalt=time(end)-time(1);

n=length(time);

%cut out the parts of the files to be used
reac2part=reac2(startindex:(stopindex-1),:);
reac5part=reac5(startindex:(stopindex-1),:);
Qintrregpart=Qintrreg(startindex:(stopindex),:);
SO5regpart=SO5reg(startindex:(stopindex),:);
SNO2sensorpart=SNO2sensor(startindex:(stopindex),:);
SO5sensorpart=SO5sensor(startindex:(stopindex),:);
kla5inpart=kla5in(startindex:(stopindex),:);

SNO2refvec=ones(n-1,1)*SNO2ref;
SO5refvec=ones(n-1,1)*SO5ref;

% Controller performance

SNO2error=SNO2refvec-reac2part(:,9);
SO5error=SO5refvec-reac5part(:,8);
SNO2errorsquare=SNO2error.*SNO2error;
SO5errorsquare=SO5error.*SO5error;
deltauvec_SNO2=abs(Qintrregpart(2:end,3)-Qintrregpart(1:(end-1),3));
deltauvec_SO5=abs(SO5regpart(2:end,3)-SO5regpart(1:(end-1),3));

timevector = time(2:end)-time(1:(end-1));

SNO2mean = mean(abs(SNO2error));
SO5mean = mean(abs(SO5error));
SNO2vec = SNO2error.*timevector;
SO5vec = SO5error.*timevector;
IAE_SNO2vec=abs(SNO2error).*timevector;
IAE_SO5vec=abs(SO5error).*timevector;
ISE_SNO2vec=SNO2errorsquare.*timevector;
ISE_SO5vec=SO5errorsquare.*timevector;

deltauvecsquare_SNO2=deltauvec_SNO2.*deltauvec_SNO2;
deltauvecsquare_SO5=deltauvec_SO5.*deltauvec_SO5;

deltauvec2_SNO2=deltauvec_SNO2.*timevector;
deltauvec2_SO5=deltauvec_SO5.*timevector;
ISE_SNO2deltauvec=deltauvecsquare_SNO2.*timevector;
ISE_SO5deltauvec=deltauvecsquare_SO5.*timevector;

IAE_SNO2 = sum(IAE_SNO2vec);
IAE_SO5 = sum(IAE_SO5vec);
ISE_SNO2 = sum(ISE_SNO2vec);
ISE_SO5 = sum(ISE_SO5vec);
maxDEV_SNO2 = max(abs(SNO2error));
maxDEV_SO5 = max(abs(SO5error));
maxDEV_SNO2u = max(Qintrregpart(:,3))-min(Qintrregpart(:,3));
maxDEV_SO5u = max(SO5regpart(:,3))-min(SO5regpart(:,3));

SNO2errormean = sum(SNO2vec)/totalt;
SO5errormean = sum(SO5vec)/totalt;
SNO2errormeansquare = ISE_SNO2/totalt;
SO5errormeansquare = ISE_SO5/totalt;
SNO2_deltau_errormean = sum(deltauvec2_SNO2)/totalt;
SO5_deltau_errormean = sum(deltauvec2_SO5)/totalt;
SNO2_deltau_errormeansquare = sum(ISE_SNO2deltauvec)/totalt;
SO5_deltau_errormeansquare = sum(ISE_SO5deltauvec)/totalt;

errorvar_SNO2 = SNO2errormeansquare - (SNO2errormean.*SNO2errormean);
errorvar_SO5 = SO5errormeansquare - (SO5errormean.*SO5errormean);
errorvar_deltau_SNO2 = SNO2_deltau_errormeansquare - (SNO2_deltau_errormean.*SNO2_deltau_errormean);
errorvar_deltau_SO5 = SO5_deltau_errormeansquare - (SO5_deltau_errormean.*SO5_deltau_errormean);

disp(' ')
disp(['Performance of active controllers during time ',num2str(time(1)),' to ',num2str(time(end)),' days'])
disp('************************************************************')
disp(' ')
disp('Nitrate controller for second anoxic reactor')
disp('============================================')
disp(' ')
disp(['PI controller with anti-windup: K = ',num2str(KQintr),' m3/d/(g N/m3)'])
disp(['                                Ti = ',num2str(TiQintr),' days'])
disp(['                                Tt = ',num2str(TtQintr),' days'])
disp(' ')
disp(['Controlled variable - SNO (tank 2), setpoint = ',num2str(SNO2ref),' mg N/l'])
disp('-------------------------------------------------------')
disp(['Average value of error (mean(e)) = ',num2str(mean(SNO2error)),' (mg N/l)'])
disp(['Average value of absolute error (mean(|e|)) = ',num2str(SNO2mean),' (mg N/l)'])
disp(['Integral of absolute error (IAE) = ',num2str(IAE_SNO2),' (mg N/l)*d'])
disp(['Integral of square error (ISE) = ',num2str(ISE_SNO2),' (mg N/l)^2*d'])
disp(['Maximum absolute deviation from nitrate setpoint (max(e)) = ',num2str(maxDEV_SNO2),' mg N/l'])
disp(['Standard deviation of error (std(e)) = ',num2str(sqrt(errorvar_SNO2)),' mg N/l'])
disp(['Variance of error (var(e)) = ',num2str(errorvar_SNO2),' (mg N/l)^2'])
disp(' ')
disp('Manipulated variable (MV), Qintr')
disp('--------------------------------')
disp(['Maximum absolute variation of MV (max-min) = ',num2str(maxDEV_SNO2u),' m3/d'])
disp(['Maximum absolute variation of MV in one sample (max delta) = ',num2str(max(diff(Qintrregpart(:,3)))),' m3/d'])
disp(['Average value of MV (mean(Qintr)) = ',num2str(mean(Qintrregpart(:,3))),' m3/d'])
disp(['Standard deviation of MV (std(delta(Qintr))) = ',num2str(sqrt(errorvar_deltau_SNO2)),' m3/d'])
disp(['Variance of MV (var(delta(Qintr))) = ',num2str(errorvar_deltau_SNO2),' (m3/d)^2'])
disp(' ')
disp(' ')
disp('Oxygen controller for last aerobic reactor')
disp('==========================================')
disp(' ')
disp(['PI controller with anti-windup: K = ',num2str(KSO5),' 1/d/(g (-COD)/m3)'])
disp(['                                Ti = ',num2str(TiSO5),' days'])
disp(['                                Tt = ',num2str(TtSO5),' days'])
disp(' ')
disp(['Controlled variable - SO (tank 5), setpoint = ',num2str(SO5ref),' mg (-COD)/l'])
disp('-----------------------------------------------------------')
disp(' ')
disp(['Average value of error (mean(e)) = ',num2str(mean(SO5error)),' (mg (-COD)/l)'])
disp(['Average value of absolute error (mean(|e|)) = ',num2str(SO5mean),' (mg (-COD)/l)'])
disp(['Integral of absolute error (IAE) = ',num2str(IAE_SO5),' (mg (-COD)/l)*d'])
disp(['Integral of square error (ISE) = ',num2str(ISE_SO5),' (mg (-COD)/l)^2*d'])
disp(['Maximum absolute deviation from oxygen setpoint (max(e)) = ',num2str(maxDEV_SO5),' mg (-COD)/l'])
disp(['Standard deviation of error (std(e)) = ',num2str(sqrt(errorvar_SO5)),' mg (-COD)/l'])
disp(['Variance of error (var(e)) = ',num2str(errorvar_SO5),' (mg (-COD)/l)^2'])
disp(' ')
disp('Manipulated variable (MV), KLa (tank 5)')
disp('---------------------------------------')
disp('Based on KLa controller output prior to KLa actuator model')
disp(['Maximum absolute variation of MV (max-min) = ',num2str(maxDEV_SO5u),' 1/d'])
disp(['Maximum absolute variation of MV in one sample (max delta) = ',num2str(max(diff(SO5regpart(:,3)))),' 1/d'])
disp(['Average value of MV (mean(KLa5)) = ',num2str(mean(SO5regpart(:,3))),' 1/d'])
disp(['Standard deviation of MV (std(delta(KLa5))) = ',num2str(sqrt(errorvar_deltau_SO5)),' 1/d'])
disp(['Variance of MV (var(delta(KLa5))) = ',num2str(errorvar_deltau_SO5),' (1/d)^2'])
disp(' ')

figure(22)
plot(time(1:(end-1)),SNO2error)
xlabel('time (days)')
ylabel('error in SNO2 control (mg N/l)')
title('SNO2ref - SNO2truevalue')

figure(23)
plot(time(1:(end-1)),reac2part(:,9))
hold on
plot(time(1:(end-1)),SNO2refvec(:),'r--')
plot(time,SNO2sensorpart(:,6),'g')
xlabel('time (days)')
ylabel('SNO2 control (mg N/l)')
title('SNO2ref (red), SNO2truevalue (blue), SNO2sensorvalue (green)')
hold off

figure(24)
plot(time,Qintrregpart(:,3))
xlabel('time (days)')
ylabel('Internal recycle flow rate (m3/d)')
title('Internal recycle flow rate')

figure(25)
plot(time(1:(end-1)),SO5error)
xlabel('time (days)')
ylabel('error in SO5 control (mg (-COD)/l)')
title('SO5ref - SO5truevalue')

figure(26)
plot(time(1:(end-1)),reac5part(:,8))
hold on
plot(time(1:(end-1)),SO5refvec(:),'r--')
plot(time,SO5sensorpart(:,6),'g')
xlabel('time (days)')
ylabel('SO5 control (mg (-COD)/l)')
title('SO5ref (red), SO5truevalue (blue), SO5sensorvalue (green)')
hold off

figure(27)
plot(time,SO5regpart(:,3), 'r')
hold on 
plot(time,kla5inpart, 'b')
xlabel('time (days)')
ylabel('KLa5 output (1/d)')
title('KLa5controlleroutput (red), KLa5actuatoroutput (blue)')
hold off
