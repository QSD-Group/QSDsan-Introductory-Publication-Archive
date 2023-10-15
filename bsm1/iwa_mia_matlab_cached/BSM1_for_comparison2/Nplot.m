startindex=max(find(t <= starttime));
stopindex=min(find(t >= stoptime));

time=t(startindex:stopindex);
ASinputx=ASinput(startindex:stopindex,:);
reac1x=reac1(startindex:stopindex,:);
reac2x=reac2(startindex:stopindex,:);
reac3x=reac3(startindex:stopindex,:);
reac4x=reac4(startindex:stopindex,:);
reac5x=reac5(startindex:stopindex,:);
settlerx=settler(startindex:stopindex,:);
inx=in(startindex:stopindex,:);

figure(18); 
subplot(3,3,1);
plot(time,reac1x(:,9)+reac1x(:,10)+reac1x(:,11)+reac1x(:,12)+i_XB*(reac1x(:,5)+reac1x(:,6))+i_XP*(reac1x(:,3)+reac1x(:,7)));
grid on;
title('N-total, reactor 1');
subplot(3,3,2);
plot(time,reac2x(:,9)+reac2x(:,10)+reac2x(:,11)+reac2x(:,12)+i_XB*(reac2x(:,5)+reac2x(:,6))+i_XP*(reac2x(:,3)+reac2x(:,7)));
grid on;
title('N-total, reactor 2');
subplot(3,3,3);
plot(time,reac3x(:,9)+reac3x(:,10)+reac3x(:,11)+reac3x(:,12)+i_XB*(reac3x(:,5)+reac3x(:,6))+i_XP*(reac3x(:,3)+reac3x(:,7)));
grid on;
title('N-total, reactor 3');
subplot(3,3,4);
plot(time,reac4x(:,9)+reac4x(:,10)+reac4x(:,11)+reac4x(:,12)+i_XB*(reac4x(:,5)+reac4x(:,6))+i_XP*(reac4x(:,3)+reac4x(:,7)));
grid on;
title('N-total, reactor 4');
subplot(3,3,5);
plot(time,reac5x(:,9)+reac5x(:,10)+reac5x(:,11)+reac5x(:,12)+i_XB*(reac5x(:,5)+reac5x(:,6))+i_XP*(reac5x(:,3)+reac5x(:,7)));
grid on;
title('N-total, reactor 5');

subplot(3,3,6);
plot(time,(ASinputx(:,9)+ASinputx(:,10)+ASinputx(:,11)+ASinputx(:,12)+i_XB*(ASinputx(:,5)+ASinputx(:,6))+i_XP*(ASinputx(:,3)+ASinputx(:,7)))./ASinputx(:,15));
grid on;
title('N-total, input to AS');

subplot(3,3,7);
plot(time,settlerx(:,9)+settlerx(:,10)+settlerx(:,11)+settlerx(:,12)+i_XB*(settlerx(:,5)+settlerx(:,6))+i_XP*(settlerx(:,3)+settlerx(:,7)));
grid on;
title('N-total, underflow');
subplot(3,3,8);
plot(time,settlerx(:,25)+settlerx(:,26)+settlerx(:,27)+settlerx(:,28)+i_XB*(settlerx(:,21)+settlerx(:,22))+i_XP*(settlerx(:,19)+settlerx(:,23)));
grid on;
title('N-total, effluent');
xlabel('NOTE! ALL VALUES INCLUDE PARTICULATE NITROGEN')
subplot(3,3,9);
plot(time,inx(:,9)+inx(:,10)+inx(:,11)+inx(:,12)+i_XB*(inx(:,5)+inx(:,6))+i_XP*(inx(:,3)+inx(:,7)));
grid on;
title('N-total, influent to WWTP');
