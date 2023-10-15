startindex=max(find(t <= starttime));
stopindex=min(find(t >= stoptime));

time=t(startindex:stopindex);
reac2x=reac2(startindex:stopindex,:);
reac5x=reac5(startindex:stopindex,:);
Qintrregx=Qintrreg(startindex:stopindex,:);
SOregx=SOreg(startindex:stopindex,:);


figure(20);
subplot(3,3,1);
plot(time,reac5x(:,8));
grid on;
title('SO5, reactor 5');
subplot(3,3,2);
plot(time,SOregx(:,2));
grid on;
title('KLa, unlimited');
subplot(3,3,3);
plot(time,SOregx(:,3));
grid on;
title('KLa, limited');
subplot(3,3,4);
plot(time,SOregx(:,1));
grid on;
title('SO5 error');


subplot(3,3,5);
plot(time,reac2x(:,9));
grid on;
title('SNO2, reactor 2');
subplot(3,3,6);
plot(time,Qintrreg(:,2));
grid on;
title('Qintr, unlimited');
subplot(3,3,7);
plot(time,Qintrreg(:,3));
grid on;
title('Qintr, limited');
subplot(3,3,8);
plot(time,Qintrreg(:,1));
grid on;
title('SNO2 error');
