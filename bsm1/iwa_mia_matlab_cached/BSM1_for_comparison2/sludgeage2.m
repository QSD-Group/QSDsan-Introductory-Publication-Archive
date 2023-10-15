[n,m]=size(reac1);
settlervol = DIM(1)*DIM(2);

sludge2 = (reac1(m,5)+reac1(m,6))*VOL1 + (reac2(m,5)+reac2(m,6))*VOL2 + (reac3(m,5)+reac3(m,6))*VOL3 + (reac4(m,5)+reac4(m,6))*VOL4 + (reac5(m,5)+reac5(m,6))*VOL5 + sum(((reac5(m,5)+reac5(m,6)).*(settler(m,32:41)./reac5(m,14))).*(settlervol/nooflayers));
waste2 = sum(settler(m,5:6).*settler(m,16)) + sum(settler(m,21:22).*settler(m,31));
sludge_age2 = sludge2/waste2
