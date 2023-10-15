startindex=max(find(t <= starttime));
stopindex=min(find(t >= stoptime));

time=t(startindex:stopindex);
feedx=feed(startindex:stopindex,:);
recx=rec(startindex:stopindex,:);
settlerx=settler(startindex:stopindex,:);
inx=in(startindex:stopindex,:);
ASinputx=ASinput(startindex:stopindex,:);

figure(15);
subplot(3,3,1);
plot(time,inx(:,15));
grid on;
title('Q in');

subplot(3,3,2);
plot(time,recx(:,15));
grid on;
title('Qintr');

subplot(3,3,3);
plot(time,settlerx(:,15));
grid on;
title('Qr');

subplot(3,3,4);
plot(time,ASinputx(:,15));
grid on;
title('Q in to AS');

subplot(3,3,5);
plot(time,settlerx(:,16));
grid on;
title('Qw');

subplot(3,3,6);
plot(time,settlerx(:,31));
grid on;
title('Qe');

subplot(3,3,7);
plot(time,feedx(:,15));
grid on;
title('Qfeed');
