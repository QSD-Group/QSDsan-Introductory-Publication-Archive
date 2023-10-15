[n,m]=size(reac1);
sludge = reac1(n,14)*VOL1 + reac2(n,14)*VOL2 + reac3(n,14)*VOL3 + reac4(n,14)*VOL4 + reac5(n,14)*VOL5;
waste = settler(n,14)*settler(n,16) + settler(n,30)*settler(n,31);
sludge_age = sludge/waste
