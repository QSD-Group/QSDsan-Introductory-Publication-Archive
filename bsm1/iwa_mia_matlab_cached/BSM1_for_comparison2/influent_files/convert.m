load constinfluent.ascii
a=constinfluent;

CONSTINFLUENT=a;

load dryinfluent.ascii
a=dryinfluent;
[m,n]=size(a);

DRYINFLUENT=[a(:,1) a(:,7) a(:,2) a(:,5) a(:,4) a(:,3) ones(m,4)*0 a(:,6) a(:,8) a(:,9) ones(m,1)*7 (a(:,3)+a(:,4)+a(:,5))*0.75 a(:,10)];

load storminfluent.ascii
a=storminfluent;
[m,n]=size(a);

STORMINFLUENT=[a(:,1) a(:,7) a(:,2) a(:,5) a(:,4) a(:,3) ones(m,4)*0 a(:,6) a(:,8) a(:,9) ones(m,1)*7 (a(:,3)+a(:,4)+a(:,5))*0.75 a(:,10)];

load raininfluent.ascii
a=raininfluent;
[m,n]=size(a);

RAININFLUENT=[a(:,1) a(:,7) a(:,2) a(:,5) a(:,4) a(:,3) ones(m,4)*0 a(:,6) a(:,8) a(:,9) ones(m,1)*7 (a(:,3)+a(:,4)+a(:,5))*0.75 a(:,10)];

load sensornoise.ascii
a=sensornoise;
SENSORNOISE=a;

cd ..

save constinfluent CONSTINFLUENT
save dryinfluent DRYINFLUENT
save storminfluent STORMINFLUENT
save raininfluent RAININFLUENT
save sensornoise SENSORNOISE
