disp(' ')
disp(' ')
disp('This script will provide the final values of all state variables')
disp('of the last openloop run, i.e. (quasi) steady state results.')
disp(' ')
[m n]=size(reac1);

disp('Influent characteristics')
disp('************************')
disp(['   SI =  ', num2str(in(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(in(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(in(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(in(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(in(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(in(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(in(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(in(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(in(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(in(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(in(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(in(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(in(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(in(m,14)), ' mg SS/l']);

disp(' ')
disp('Flow conditions')
disp('***************')
disp(['   Influent flow to WWTP = ', num2str(in(m,15)), ' m3/d']);
disp(['   Influent flow to AS = ', num2str(ASinput(m,15)), ' m3/d']);
disp(['   Internal recirculation = ', num2str(rec(m,15)), ' m3/d']);
disp(['   Settler feed flow = ', num2str(feed(m,15)), ' m3/d']);
disp(['   Returned sludge flow = ', num2str(settler(m,15)), ' m3/d']);
disp(['   Wastage sludge flow = ', num2str(settler(m,16)), ' m3/d']);
disp(['   Effluent flow = ', num2str(settler(m,31)), ' m3/d']);

disp(' ')
disp('Input to AS')
disp('***********')
disp(['   SI =  ', num2str(ASinput(m,1)/ASinput(m,15)), ' mg COD/l']);
disp(['   SS =  ', num2str(ASinput(m,2)/ASinput(m,15)), ' mg COD/l']);
disp(['   XI =  ', num2str(ASinput(m,3)/ASinput(m,15)), ' mg COD/l']);
disp(['   XS =  ', num2str(ASinput(m,4)/ASinput(m,15)), ' mg COD/l']);
disp(['   XBH = ', num2str(ASinput(m,5)/ASinput(m,15)), ' mg COD/l']);
disp(['   XBA = ', num2str(ASinput(m,6)/ASinput(m,15)), ' mg COD/l']);
disp(['   XP =  ', num2str(ASinput(m,7)/ASinput(m,15)), ' mg COD/l']);
disp(['   SO =  ', num2str(ASinput(m,8)/ASinput(m,15)), ' mg -COD/l']);
disp(['   SNO = ', num2str(ASinput(m,9)/ASinput(m,15)), ' mg N/l']);
disp(['   SNH = ', num2str(ASinput(m,10)/ASinput(m,15)), ' mg N/l']);
disp(['   SND = ', num2str(ASinput(m,11)/ASinput(m,15)), ' mg N/l']);
disp(['   XND = ', num2str(ASinput(m,12)/ASinput(m,15)), ' mg N/l']);
disp(['   SALK = ', num2str(ASinput(m,13)/ASinput(m,15)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(ASinput(m,14)/ASinput(m,15)), ' mg SS/l']);

disp(' ')
disp('Reactor 1')
disp('*********')
disp(['   SI =  ', num2str(reac1(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(reac1(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(reac1(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(reac1(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(reac1(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(reac1(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(reac1(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(reac1(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(reac1(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(reac1(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(reac1(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(reac1(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(reac1(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(reac1(m,14)), ' mg SS/l']);

disp(' ')
disp('Reactor 2')
disp('*********')
disp(['   SI =  ', num2str(reac2(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(reac2(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(reac2(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(reac2(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(reac2(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(reac2(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(reac2(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(reac2(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(reac2(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(reac2(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(reac2(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(reac2(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(reac2(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(reac2(m,14)), ' mg SS/l']);

disp(' ')
disp('Reactor 3')
disp('*********')
disp(['   SI =  ', num2str(reac3(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(reac3(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(reac3(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(reac3(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(reac3(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(reac3(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(reac3(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(reac3(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(reac3(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(reac3(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(reac3(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(reac3(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(reac3(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(reac3(m,14)), ' mg SS/l']);

disp(' ')
disp('Reactor 4')
disp('*********')
disp(['   SI =  ', num2str(reac4(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(reac4(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(reac4(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(reac4(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(reac4(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(reac4(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(reac4(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(reac4(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(reac4(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(reac4(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(reac4(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(reac4(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(reac4(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(reac4(m,14)), ' mg SS/l']);

disp(' ')
disp('Reactor 5')
disp('*********')
disp(['   SI =  ', num2str(reac5(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(reac5(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(reac5(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(reac5(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(reac5(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(reac5(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(reac5(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(reac5(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(reac5(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(reac5(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(reac5(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(reac5(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(reac5(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(reac5(m,14)), ' mg SS/l']);

disp(' ')
disp('Settler underflow')
disp('*****************')
disp(['   SI =  ', num2str(settler(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(settler(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(settler(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(settler(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(settler(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(settler(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(settler(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(settler(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(settler(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(settler(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(settler(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(settler(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(settler(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(settler(m,14)), ' mg SS/l']);

disp(' ')
disp('Settler effluent')
disp('****************')
disp(['   SI =  ', num2str(settler(m,17)), ' mg COD/l']);
disp(['   SS =  ', num2str(settler(m,18)), ' mg COD/l']);
disp(['   XI =  ', num2str(settler(m,19)), ' mg COD/l']);
disp(['   XS =  ', num2str(settler(m,20)), ' mg COD/l']);
disp(['   XBH = ', num2str(settler(m,21)), ' mg COD/l']);
disp(['   XBA = ', num2str(settler(m,22)), ' mg COD/l']);
disp(['   XP =  ', num2str(settler(m,23)), ' mg COD/l']);
disp(['   SO =  ', num2str(settler(m,24)), ' mg -COD/l']);
disp(['   SNO = ', num2str(settler(m,25)), ' mg N/l']);
disp(['   SNH = ', num2str(settler(m,26)), ' mg N/l']);
disp(['   SND = ', num2str(settler(m,27)), ' mg N/l']);
disp(['   XND = ', num2str(settler(m,28)), ' mg N/l']);
disp(['   SALK = ', num2str(settler(m,29)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(settler(m,30)), ' mg SS/l']);

disp(' ')
disp('Settler internal (1 is top layer)')
disp('*********************************')
disp(['   TSS1 = ', num2str(settler(m,32)), ' mg SS/l']);
disp(['   TSS2 = ', num2str(settler(m,33)), ' mg SS/l']);
disp(['   TSS3 = ', num2str(settler(m,34)), ' mg SS/l']);
disp(['   TSS4 = ', num2str(settler(m,35)), ' mg SS/l']);
disp(['   TSS5 = ', num2str(settler(m,36)), ' mg SS/l']);
disp(['   TSS6 = ', num2str(settler(m,37)), ' mg SS/l']);
disp(['   TSS7 = ', num2str(settler(m,38)), ' mg SS/l']);
disp(['   TSS8 = ', num2str(settler(m,39)), ' mg SS/l']);
disp(['   TSS9 = ', num2str(settler(m,40)), ' mg SS/l']);
disp(['   TSS10 = ', num2str(settler(m,41)), ' mg SS/l']);

reactorvol = VOL1+VOL2+VOL3+VOL4+VOL5;
settlervol = DIM(1)*DIM(2);
totalvol = reactorvol+settlervol;

sludge = reac1(m,14)*VOL1 + reac2(m,14)*VOL2 + reac3(m,14)*VOL3 + reac4(m,14)*VOL4 + reac5(m,14)*VOL5;
sludge2 = (reac1(m,5)+reac1(m,6))*VOL1 + (reac2(m,5)+reac2(m,6))*VOL2 + (reac3(m,5)+reac3(m,6))*VOL3 + (reac4(m,5)+reac4(m,6))*VOL4 + (reac5(m,5)+reac5(m,6))*VOL5 + sum(((reac5(m,5)+reac5(m,6)).*(settler(m,32:41)./reac5(m,14))).*(settlervol/nooflayers));
waste = settler(m,14)*settler(m,16) + settler(m,30)*settler(m,31);
waste2 = sum(settler(m,5:6).*settler(m,16)) + sum(settler(m,21:22).*settler(m,31));
sludge_age = sludge/waste;
sludge_age2 = sludge2/waste2;

disp(' ')
disp('Other variables')
disp('***************')
disp(['   Trad. sludge age (XS + XP + XI + XBH + XBA in reactors) = ', num2str(sludge_age), ' days']);
disp(['   Spec. sludge age (XBH + XBA in reactors and settler) = ', num2str(sludge_age2), ' days']);
disp(['   Total hydraulic retention time = ', num2str(totalvol/(in(m,15))*24), ' hours']);
disp(['   Reactor hydraulic retention time = ', num2str(reactorvol/(in(m,15))*24), ' hours']);
disp(['   Thickening factor at bottom of settler (TSSu/TSSfeed) = ', num2str(settler(m,42))]);
disp(['   Thinning factor at top of settler (TSSeff/TSSfeed) = ', num2str(settler(m,43))]);

disp(' ')
disp('Dimensions')
disp('**********')
if reac1(m,8)<0.2
disp('   Reactor 1 is anoxic')
else
disp('   Reactor 1 is aerobic')
end
disp(['   Volume reactor 1 = ', num2str(VOL1), ' m3']);
if reac2(m,8)<0.2
disp('   Reactor 2 is anoxic')
else
disp('   Reactor 2 is aerobic')
end
disp(['   Volume reactor 2 = ', num2str(VOL2), ' m3']);
if reac3(m,8)<0.2
disp('   Reactor 3 is anoxic')
else
disp('   Reactor 3 is aerobic')
end
disp(['   Volume reactor 3 = ', num2str(VOL3), ' m3']);
if reac4(m,8)<0.2
disp('   Reactor 4 is anoxic')
else
disp('   Reactor 4 is aerobic')
end
disp(['   Volume reactor 4 = ', num2str(VOL4), ' m3']);
if reac5(m,8)<0.2
disp('   Reactor 5 is anoxic')
else
disp('   Reactor 5 is aerobic')
end
disp(['   Volume reactor 5 = ', num2str(VOL5), ' m3']);
disp(['   Settler height = ', num2str(DIM(2)), ' m']);
disp(['   Settler area = ', num2str(DIM(1)), ' m2']);
disp(['   Settler volume = ', num2str(settlervol), ' m3']);

