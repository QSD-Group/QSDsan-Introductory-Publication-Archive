tic
% RISK MODULE BSM1
% Implementation of Expert rules to detect 
% suitable conditions for settling problems with biological
% origin (filamentous bulking, foaming and rising sludge), last version Oct 2008

% Some limit values according to literature and author's experience
% SRT limit
SRTReasonableLimit=30;

% Settler SNO limit (rising sludge)
SNOHighLimit=8;

% Influent organic matter and nitrogen loading
BOD5invec=inpart(:,15).*BOD5in; %inpart(:,15) is the influent flow rate. BOD: kg/d units
CODinvec=inpart(:,15).*CODin;
TNin = SNKjin+SNOin;
TNinvec =inpart(:,15).*TNin;

% Effluent organic matter and nitrogen loading
CODevec=settlerpart(:,31).*CODe; % settlerpart(:,31) effluent flow rate

% determining Biomass in activated sludge tanks 
Biomassvec=0.75*(reac1part(:,5)*VOL1+reac1part(:,6)*VOL1+reac2part(:,5)*VOL2+reac2part(:,6)*VOL2+reac3part(:,5)*VOL3+reac3part(:,6)*VOL3+reac4part(:,5)*VOL4+reac4part(:,6)*VOL4+reac5part(:,5)*VOL5+reac5part(:,6)*VOL5); %XBH + XBA in aeration tanks only, in TSS units
TSSvecreactor=reac1part(:,14)*VOL1+reac2part(:,14)*VOL2+reac3part(:,14)*VOL3+reac4part(:,14)*VOL4+reac5part(:,14)*VOL5; %TSS in aeration tanks

% determining FtoM_1 (kg COD removed/kg MLVSS·d) Only biomass in activated sludge tanks considered
FtoM_1vec = (CODinvec - CODevec)./Biomassvec;

for i=1:length(FtoM_1vec) %To replace FtoM_1vec values >4 for 4
    if FtoM_1vec(i)>4
        FtoM_1vec(i)=4;
     else
        FtoM_1vec(i)=FtoM_1vec(i);     
    end     
end
    
% determining FtoM_2 (kg BOD5/kg MLVSS·d)
FtoM_2vec = BOD5invec./Biomassvec;

for i=1:length(FtoM_2vec) %To replace FtoM_2vec values >1.5 for 1.5
    if FtoM_2vec(i)>1.5
        FtoM_2vec(i)=1.5;
     else
        FtoM_2vec(i)=FtoM_2vec(i);     
    end     
end

Nload= TNinvec./Biomassvec;

% determining SRT
%Waste sludge production
TSSuvec2 =TSSwasteconc.*Qwasteflow.*1000; % TSS in WAS, in gr/d 
TSSevec2=settlerpart(:,30).*settlerpart(:,31); %TSS in the effluent, in gr/d

% SRT for sludge in aeration tanks, settler not considered
SRTvec =TSSvecreactor./(TSSuvec2+TSSevec2); % TSS in reactor / TSS removed from the system
SRTvec = smoothing_data(SRTvec,3)'; % SRTvec filtering using 3 days data

% Determining possible bulking conditions due to nutrient deficiency
% Check for nitrogen deficiency Bulking (check for BOD5/N ratio)
BOD5toN = BOD5in./TNin;
NDefBulking1=zeros(1,length(BOD5toN));
Nfis=readfis('Deficiency'); %to load the N Deficiency fuzzy inference system developed with the Matlab fuzzy toolbox
NDefBulking1=evalfis([BOD5toN], Nfis); %To evaluate the output of the Nfis fuzzy system for a given input
NofNDefBulking1 = find (NDefBulking1> 0.8); %To find the values higher than 0.8
NofDif0NDefBulking1 = find (NDefBulking1 > 0.0001); %To find the values higher than 0.0001
        % to find the worst situation: the most dangerous situation during the final 7 days, computed as the largest 
        % time interval that the plant is in uninterrupted severe risk of NDef bulking problem.
LengthNDefBulking=zeros(1,length(NofNDefBulking1)); % all indexes with NDefBulking > 0.8
for i=1:length(NofNDefBulking1)
   j=i;
   k=1;
   if j~=length(NofNDefBulking1)
      while isequal(NofNDefBulking1(j)+1,NofNDefBulking1(j+1))
         k=k+1;
         j=j+1;
         if j==length(NofNDefBulking1) break
         end
      end
      LengthNDefBulking(i)=k;
   end
   LengthNDefBulking(length(NofNDefBulking1))=1;
end
MaxLengthNDefBulking=max(LengthNDefBulking);
MaxLengthNDefBulkingIndex=find(LengthNDefBulking==MaxLengthNDefBulking);

%Display N deficiency Bulking problems
disp('Qualitative criteria for settling problems')
disp('------------------------------------------')

if not(isempty(NofNDefBulking1))
   disp(' ')
   disp('The plant has experienced high (>0.8) risk for the development of filamentous bulking due to N deficiency')
   disp(['during ',num2str(min(totalt,length(NofNDefBulking1)*sampletime)),' days, i.e. ',num2str(min(100,length(NofNDefBulking1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['...and risk for the development of filamentous bulking due to N deficiency ', num2str(min(100,length(NofDif0NDefBulking1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['average  risk ',num2str(sum(NDefBulking1*sampletime)/totalt),''])
   disp(['The most dangerous situation was between days ', num2str(min(totalt,NofNDefBulking1(MaxLengthNDefBulkingIndex(1))*sampletime)+7),' and ', num2str(min(totalt,(NofNDefBulking1(MaxLengthNDefBulkingIndex(1))+MaxLengthNDefBulking)*sampletime)+7),])
else
   disp(' ')
   disp('The plant has experienced high (>0.8) risk for the development of filamentous bulking due to N deficiency')
   disp(['during ',num2str(min(totalt,length(NofNDefBulking1)*sampletime)),' days, i.e. ',num2str(min(100,length(NofNDefBulking1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['...and risk for the development of filamentous bulking due to N deficiency', num2str(min(100,length(NofDif0NDefBulking1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['average  risk ',num2str(sum(NDefBulking1*sampletime)/totalt),''])
end

% Determining possible aerobic bulking conditions
bulkingfis=readfis('LowDOBulking'); %to load the Low DO Bulking fuzzy inference system developed with the Matlab fuzzy toolbox
LowDOBulking1=evalfis([FtoM_1vec reac3part(:,8)], bulkingfis); %To evaluate the output of the bulkingfis fuzzy system for a given input
NofLowDOBulking1 = find (LowDOBulking1 > 0.8); %To find the values higher than 0.8
NofDif0LowDOBulking1 = find (LowDOBulking1 > 0.0001); %To find the values higher than 0.0001

% to find the worst situation: the most dangerous situation during the final 7 days, computed as the largest 
        % time interval that the plant is in uninterrupted severe risk of Low DO bulking problem.
LengthLowDOBulking=zeros(1,length(NofLowDOBulking1));
for i=1:length(NofLowDOBulking1)
   j=i;
   k=1;
   if j~=length(NofLowDOBulking1)
      while isequal(NofLowDOBulking1(j)+1,NofLowDOBulking1(j+1))
         k=k+1;
         j=j+1;
         if j==length(NofLowDOBulking1) break
         end
      end
      LengthLowDOBulking(i)=k;
   end
   LengthLowDOBulking(length(NofLowDOBulking1))=1;
end
MaxLengthLowDOBulking=max(LengthLowDOBulking);
MaxLengthLowDOBulkingIndex=find(LengthLowDOBulking==MaxLengthLowDOBulking);

%Display Low DO Bulking problems
if not(isempty(NofLowDOBulking1))
   disp(' ')
   disp('The plant has experienced high (>0.8) risk for the development of aerobic (low DO) filamentous bulking')
   disp(['during ',num2str(min(totalt,length(NofLowDOBulking1)*sampletime)),' days, i.e. ',num2str(min(100,length(NofLowDOBulking1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['...and risk for the development of aerobic (low DO) filamentous bulking ', num2str(min(100,length(NofDif0LowDOBulking1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['average  risk ',num2str(sum(LowDOBulking1*sampletime)/totalt),''])
   disp(['The most dangerous situation was between days ', num2str(min(totalt,(NofLowDOBulking1(MaxLengthLowDOBulkingIndex(1)))*sampletime)+7),' and ', num2str(min(totalt,(NofLowDOBulking1(MaxLengthLowDOBulkingIndex(1))+MaxLengthLowDOBulking)*sampletime)+7),])
else
   disp(' ')
   disp('The plant has experienced high (>0.8) risk for the development of aerobic (low DO) filamentous bulking')
   disp(['during ',num2str(min(totalt,length(NofLowDOBulking1)*sampletime)),' days, i.e. ',num2str(min(100,length(NofLowDOBulking1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['...and risk for the development of aerobic (low DO) filamentous bulking ', num2str(min(100,length(NofDif0LowDOBulking1)*sampletime/totalt*100)),'% of the operating time.'])   
   disp(['average  risk ',num2str(sum(LowDOBulking1*sampletime)/totalt),''])
end

% Determining possible bulking conditions due to limited substrate (low FtoM Bulking and/or Foaming)
foamingfis=readfis('FoamingNocMic'); %to load the Low F/M Foaming fuzzy inference system developed with the Matlab fuzzy toolbox
for i=1:length(FtoM_2vec) %To evaluate the output of the foamingfis fuzzy system (low F/M foaming) for a given input 
    if SRTvec(i)<=SRTReasonableLimit
        LowFtoMFoaming2(i)=evalfis([FtoM_2vec(i) SRTvec(i)], foamingfis);
     else
        LowFtoMFoaming2(i)=NaN;     
    end     
end
NofLowFtoMFoaming2 = find (LowFtoMFoaming2 > 0.8);  %To find the values higher than 0.8  
NofDif0LowFtoMFoaming2 = find (LowFtoMFoaming2 > 0.0001); %To find the values higher than 0.0001
        % to find the worst situation: the most dangerous situation during the final 7 days, computed as the largest 
        % time interval that the plant is in uninterrupted severe risk of Low F/M Foaming problem.        
if not(isempty(NofLowFtoMFoaming2))
      LengthLowFtoMFoaming=zeros(1,length(NofLowFtoMFoaming2));
      for i=1:length(NofLowFtoMFoaming2)   
         j=i;
         k=1;
         if j~=length(NofLowFtoMFoaming2)
            while isequal(NofLowFtoMFoaming2(j)+1,NofLowFtoMFoaming2(j+1))
               k=k+1;
               j=j+1;
               if j==length(NofLowFtoMFoaming2) break
               end
            end
            LengthLowFtoMFoaming(i)=k;
         end
         LengthLowFtoMFoaming(length(NofLowFtoMFoaming2))=1;
      end
      MaxLengthLowFtoMFoaming=max(LengthLowFtoMFoaming);
      MaxLengthLowFtoMFoamingIndex=find(LengthLowFtoMFoaming==MaxLengthLowFtoMFoaming);
      disp(' ')     
      disp('The plant has experienced high (>0.8) risk for the development of low F/M foaming')
      disp(['during ',num2str(min(totalt,length(NofLowFtoMFoaming2)*sampletime)),' days, i.e. ',num2str(min(100,length(NofLowFtoMFoaming2)*sampletime/totalt*100)),'% of the operating time.'])
      disp(['...and risk for the development of low F/M foaming ', num2str(min(100,length(NofDif0LowFtoMFoaming2)*sampletime/totalt*100)),'% of the operating time.'])
      disp(['average  risk ',num2str(sum(LowFtoMFoaming2*sampletime)/totalt),'']) 
      disp(['The most dangerous situation was between days ', num2str(min(totalt,NofLowFtoMFoaming2(MaxLengthLowFtoMFoamingIndex(1))*sampletime)+7),' and ', num2str(min(totalt,(NofLowFtoMFoaming2(MaxLengthLowFtoMFoamingIndex(1))+MaxLengthLowFtoMFoaming)*sampletime)+7),])
else
      disp(' ')     
      disp('The plant has experienced high (>0.8) risk for the development of low F/M foaming')
      disp(['during ',num2str(min(totalt,length(NofLowFtoMFoaming2)*sampletime)),' days, i.e. ',num2str(min(100,length(NofLowFtoMFoaming2)*sampletime/totalt*100)),'% of the operating time.'])
      disp(['...and risk for the development of low F/M foaming ', num2str(min(100,length(NofDif0LowFtoMFoaming2)*sampletime/totalt*100)),'% of the operating time.'])
      disp(['average  risk ',num2str(sum(LowFtoMFoaming2*sampletime)/totalt),''])
end

%Determining conditions for Low F/M bulking
bulkingfis=readfis('FtoMBulking_1');%to load the Low F/M Bulking fuzzy inference system developed with the Matlab fuzzy toolbox
for i=1:length(inpart(:,2)) %To evaluate the output of the bulkingfis fuzzy system (low F/M bulking) for a given input; inpart (:,2)=influent SS
   if SRTvec(i)<=SRTReasonableLimit
      LowFtoMBulking1(i)=evalfis([reac1part(i,2) SRTvec(i)], bulkingfis); %react(:,2)=reactor SS
   else
      LowFtoMBulking1(i)=NaN;
   end
end     
NofLowFtoMBulking1 = find (LowFtoMBulking1> 0.8);   %To find the values higher than 0.8  

bulkingfis=readfis('FtoMBulking_2');%to load the Low F/M Bulking_2 fuzzy inference system developed with the Matlab fuzzy toolbox
for i=1:length(FtoM_2vec)%To evaluate the output of the bulkingfis fuzzy system (low F/M bulking) for a given input, in another way
   if SRTvec(i)<=SRTReasonableLimit
      LowFtoMBulking2(i)=evalfis([FtoM_2vec(i) SRTvec(i)], bulkingfis);
   else
      LowFtoMBulking2(i)=NaN;
   end
end
NofLowFtoMBulking2 = find (LowFtoMBulking2> 0.8);%To find the values higher than 0.8 
NofDif0LowFtoMBulking2 = find (LowFtoMBulking2 > 0.0001); %To find the values higher than 0.0001
        % to find the worst situation and display results among the two possible Bulking situations due to 
        % low F/M -LowFtoMBulking1 and LowFtoMBulking2-: the most dangerous situation during the final 7 days, 
        % computed as the largest time interval that the plant is in uninterrupted severe risk of Low F/M Bulking problem. 
        
LowFtoMBulking=max(LowFtoMBulking1,LowFtoMBulking2);
NofLowFtoMBulking=find (LowFtoMBulking> 0.8);       

if not(isempty(NofLowFtoMBulking))
      LengthLowFtoMBulking=zeros(1,length(NofLowFtoMBulking));
      for i=1:length(NofLowFtoMBulking)  
         j=i;
         k=1;
         if j~=length(NofLowFtoMBulking)
            while isequal(NofLowFtoMBulking(j)+1,NofLowFtoMBulking(j+1))
               k=k+1;
               j=j+1;
               if j==length(NofLowFtoMBulking) break
               end
            end
            LengthLowFtoMBulking(i)=k;
         end
         LengthLowFtoMBulking(length(NofLowFtoMBulking))=1;
      end
      MaxLengthLowFtoMBulking=max(LengthLowFtoMBulking);
      MaxLengthLowFtoMBulkingIndex=find(LengthLowFtoMBulking==MaxLengthLowFtoMBulking);       
      disp(' ')
      disp('The plant has experienced severe (>0.8) risk for the development of low F/M filamentous bulking')
      disp(['during ',num2str(min(totalt,length(NofLowFtoMBulking)*sampletime)),' days, i.e. ',num2str(min(100,length(NofLowFtoMBulking)*sampletime/totalt*100)),'% of the operating time.'])
      disp(['...and risk for the development of low F/M filamentous bulking ', num2str(min(100,length(NofDif0LowFtoMBulking2)*sampletime/totalt*100)),'% of the operating time.'])
      disp(['average  risk ',num2str(sum(LowFtoMBulking*sampletime)/totalt),''])
      disp(['The most dangerous situation was between days ', num2str(min(totalt,NofLowFtoMBulking(MaxLengthLowFtoMBulkingIndex(1))*sampletime)+7),' and ', num2str(min(totalt,(NofLowFtoMBulking(MaxLengthLowFtoMBulkingIndex(1))+MaxLengthLowFtoMBulking)*sampletime)+7),])
      NofLowFtoMBulkingtoplot=NofLowFtoMBulking;
      LowFtoMBulkingtoplot=LowFtoMBulking;   
 else % LowFtoMBulking is empty
    NofLowFtoMBulkingtoplot=NofLowFtoMBulking; 
    LowFtoMBulkingtoplot=LowFtoMBulking;
    disp(' ')
    disp('The plant has experienced severe (>0.8) risk for the development of low F/M filamentous bulking')
    disp(['during ',num2str(min(totalt,length(NofLowFtoMBulking)*sampletime)),' days, i.e. ',num2str(min(100,length(NofLowFtoMBulking)*sampletime/totalt*100)),'% of the operating time.'])
    disp(['...and risk for the development of low F/M filamentous bulking ', num2str(min(100,length(NofDif0LowFtoMBulking2)*sampletime/totalt*100)),'% of the operating time.'])
    disp(['average  risk ',num2str(sum(LowFtoMBulking*sampletime)/totalt),''])
end

% Determining possible foaming conditions due to high readily biodegradable organic matter fraction
foamingfis=readfis('Foaming1863_1');%to load the high RBOM fraction foaming fuzzy inference system developed with the Matlab fuzzy toolbox
HighRBOMfractionFoaming1=evalfis([FtoM_2vec (inpart(:,2)./inpart(:,4))], foamingfis);
NofHighRBOMfractionFoaming1 = find (HighRBOMfractionFoaming1 > 0.8);%To find the values higher than 0.8 

foamingfis=readfis('Foaming1863_2');%to load the high RBOM fraction foaming_2 fuzzy inference system developed with the Matlab fuzzy toolbox
for i=1:length(SRTvec)%To evaluate the output of the foamingfis fuzzy system (due to high readily biodegradable organic matter fraction) for a given input, in another way
   if SRTvec(i)<=SRTReasonableLimit
      HighRBOMfractionFoaming2(i)=evalfis([SRTvec(i) (inpart(i,2)./inpart(i,4))], foamingfis);% SS/XS ratio
   else 
      HighRBOMfractionFoaming2(i)=NaN;
   end
end     
NofHighRBOMfractionFoaming2 = find (HighRBOMfractionFoaming2 > 0.8);%To find the values higher than 0.8 
        % to find the worst situation and display results among the two possible Foaming situations due high RBOM 
        % fraction -HighRBOMfractionFoaming1 and HighRBOMfractionFoaming2- : the most dangerous situation during the 
        % final 7 days, computed as the largest time interval that the plant is in uninterrupted severe risk of high RBOM fraction Foaming problem. 
        
[Fil,Col]=size(HighRBOMfractionFoaming1);
if Fil==1
   HighRBOMfractionFoaming=max(HighRBOMfractionFoaming1, HighRBOMfractionFoaming2);
else 
   HighRBOMfractionFoaming=max(HighRBOMfractionFoaming1', HighRBOMfractionFoaming2);
end 

NofHighRBOMfractionFoaming=find (HighRBOMfractionFoaming> 0.8);
NofDif0HighRBOMfractionFoaming = find (HighRBOMfractionFoaming > 0.0001); %To find the values higher than 0.0001

 if not(isempty(NofHighRBOMfractionFoaming))
      LengthHighRBOMfractionFoaming=zeros(1,length(NofHighRBOMfractionFoaming));
      for i=1:length(NofHighRBOMfractionFoaming)   
         j=i;
         k=1;
         if j~=length(NofHighRBOMfractionFoaming)
            while isequal(NofHighRBOMfractionFoaming(j)+1,NofHighRBOMfractionFoaming(j+1))
               k=k+1;
               j=j+1;
               if j==length(NofHighRBOMfractionFoaming) break
               end
            end
            LengthHighRBOMfractionFoaming(i)=k;
         end
         LengthHighRBOMfractionFoaming(length(NofHighRBOMfractionFoaming))=1;
      end
      MaxLengthHighRBOMfractionFoaming=max(LengthHighRBOMfractionFoaming);
      MaxLengthHighRBOMfractionFoamingIndex=find(LengthHighRBOMfractionFoaming==MaxLengthHighRBOMfractionFoaming); 
		disp(' ')
      disp('The plant has experienced high (>0.8) risk for the development of foaming due to high Ss/Xs fraction')
      disp(['during ',num2str(min(totalt,length(NofHighRBOMfractionFoaming)*sampletime)),' days, i.e. ',num2str(min(100,length(NofHighRBOMfractionFoaming)*sampletime/totalt*100)),'% of the operating time.'])
      disp(['...and risk for the development of foaming due to high Ss/Xs fraction ', num2str(min(100,length(NofDif0HighRBOMfractionFoaming)*sampletime/totalt*100)),'% of the operating time.'])
      disp(['average  risk ',num2str(sum(HighRBOMfractionFoaming*sampletime)/totalt),''])
      disp(['The most dangerous situation was between days ', num2str(min(totalt,NofHighRBOMfractionFoaming(MaxLengthHighRBOMfractionFoamingIndex(1))*sampletime)+7),' and ', num2str(min(totalt,(NofHighRBOMfractionFoaming(MaxLengthHighRBOMfractionFoamingIndex(1))+MaxLengthHighRBOMfractionFoaming)*sampletime)+7),])
      NofHighRBOMfractionFoamingtoplot=NofHighRBOMfractionFoaming;
      HighRBOMfractionFoamingtoplot=HighRBOMfractionFoaming;
else % HighRBOMfractionFoaming is empty
    NofHighRBOMfractionFoamingtoplot=NofHighRBOMfractionFoaming; 
    HighRBOMfractionFoamingtoplot=HighRBOMfractionFoaming;
    disp(' ')
    disp('The plant has experienced high (>0.8) risk for the development of foaming due to high Ss/Xs fraction')
    disp(['during ',num2str(min(totalt,length(NofHighRBOMfractionFoaming)*sampletime)),' days, i.e. ',num2str(min(100,length(NofHighRBOMfractionFoaming)*sampletime/totalt*100)),'% of the operating time.'])
    disp(['...and risk for the development of foaming due to high Ss/Xs fraction ', num2str(min(100,length(NofDif0HighRBOMfractionFoaming)*sampletime/totalt*100)),'% of the operating time.'])
    disp(['average  risk ',num2str(sum(HighRBOMfractionFoaming*sampletime)/totalt),''])
end

%Determining possible suitable conditions for Rising sludge
i=0;
SsOutReac5=reac5part(:,2);
SNOOutReac5=reac5part(:,9);
SoOutReac5=reac5part(:,8);
Rising1=zeros(1,length(SNOOutReac5));
XBHOutReac5= reac5part(:,5);
XBHOutBottomClarifier= settlerpart(:,5);

SludgeVolumeInClarifier=(settlerpart(:,32).*600+settlerpart(:,33).*600+settlerpart(:,34).*600+settlerpart(:,35).*600+settlerpart(:,36).*600+settlerpart(:,37).*600+settlerpart(:,38).*600+settlerpart(:,39).*600+settlerpart(:,40).*600+settlerpart(:,41).*600)./settlerpart(:,41);

risingfis=readfis('Rising');%to load the rising fuzzy inference system developed with the Matlab fuzzy toolbox
nitrifiers_fraction=1;
Rdn2=((1-Y_H)./(2.86.*Y_H)).*(mu_H*(SsOutReac5./(K_S+SsOutReac5))).*(SNOOutReac5./(K_NO+SNOOutReac5)).*XBHOutBottomClarifier.*ny_g;%considering DO=0 mgO2/L
t_delay=(SoOutReac5./(2.86*Rdn2/nitrifiers_fraction));

Limit1=SludgeVolumeInClarifier./(Qrflow+1);
Limit2=(SludgeVolumeInClarifier./(Qrflow+1))+0.01;
Limit3=(SludgeVolumeInClarifier./(Qrflow+1))+0.02;
         
for i=1:length(SNOOutReac5) %To evaluate the output of the risingfis fuzzy system for a given input
         risingfis.input(2).mf(1).type='trapmf';
         risingfis.input(2).mf(2).type='trimf';
         risingfis.input(2).mf(3).type='trapmf';       
         risingfis.input(2).mf(1).params=[-0.1292 -0.03783 Limit1(i) Limit2(i)];
         risingfis.input(2).mf(2).params=[Limit1(i) Limit2(i) Limit3(i)];
         risingfis.input(2).mf(3).params=[Limit2(i) Limit3(i) 2.205 2.272];
         risingfis=readfis('Rising');
         Rising1(i)=evalfis([SNOOutReac5(i) ((SNOHighLimit./Rdn2(i))+t_delay(i))], risingfis);
end

NofRising1 = find (Rising1 > 0.8);%To find the values higher than 0.8 
NofDif0Rising1 = find (Rising1 > 0.0001); %To find the values higher than 0.0001
        % to find the worst situation and display results: the most dangerous situation during the final 7 days, 
        % computed as the largest time interval that the plant is in uninterrupted severe risk of Rising problem. 
LengthNofRising=zeros(1,length(NofRising1));
for i=1:length(NofRising1)  
   j=i;
   k=1;
   if j~=length(NofRising1)
      while isequal(NofRising1(j)+1,NofRising1(j+1))
         k=k+1;
         j=j+1;
         if j==length(NofRising1) break
         end
      end
      LengthNofRising(i)=k;
   end
   LengthNofRising(length(NofRising1))=1;
end
MaxLengthRising=max(LengthNofRising);
MaxLengthRisingIndex=find(LengthNofRising==MaxLengthRising);   

if not(isempty(NofRising1))
   disp(' ')
   disp('The plant has experienced high (>0.8) risk for the development of rising sludge')
   disp(['during ',num2str(min(totalt,length(NofRising1)*sampletime)),' days, i.e. ',num2str(min(100,length(NofRising1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['...and risk for the development of rising sludge ', num2str(min(100,length(NofDif0Rising1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['average  risk ',num2str(sum(Rising1*sampletime)/totalt),''])
   disp(['The most dangerous situation was between days ', num2str(min(totalt,NofRising1(MaxLengthRisingIndex(1))*sampletime)+7),' and ', num2str(min(totalt,(NofRising1(MaxLengthRisingIndex(1))+MaxLengthRising)*sampletime)+7),])
end

% Calculating the overall risk (taking the max at every time step)
disp(' ')
disp('Overall risk')
disp('------------')
[Fil,Col]=size(NDefBulking1);
if Fil==1
Bulking1=max(NDefBulking1', LowDOBulking1);
else 
Bulking1=max(NDefBulking1, LowDOBulking1);
end

[Fil,Col]=size(Bulking1);
if Fil==1
   Bulking=max(Bulking1, LowFtoMBulking);
else 
   Bulking=max(Bulking1', LowFtoMBulking);
end    
NofBulking = find (Bulking > 0.8);%To find the values higher than 0.8
NofDif0Bulking = find (Bulking > 0.0001); %To find the values higher than 0.0001
   disp(' ')
   disp('The plant has experienced severe (>0.8) risk for (integrated) Bulking')
   disp(['during ',num2str(min(totalt,length(NofBulking)*sampletime)),' days, i.e. ',num2str(min(100,length(NofBulking)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['...and risk for the development of (integrated) Bulking ', num2str(min(100,length(NofDif0Bulking)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['average  risk ',num2str(sum(Bulking*sampletime)/totalt),''])
% time interval that the plant is in uninterrupted severe risk of (integrated) Bulking problem.
LengthBulking=zeros(1,length(NofBulking));
for i=1:length(NofBulking)
   j=i;
   k=1;
   if j~=length(NofBulking)
      while isequal(NofBulking(j)+1,NofBulking(j+1))
         k=k+1;
         j=j+1;
         if j==length(NofBulking) break
         end
      end
      LengthBulking(i)=k;
   end
   LengthBulking(length(NofBulking))=1;
end
MaxLengthBulking=max(LengthBulking);
MaxLengthBulkingIndex=find(LengthBulking==MaxLengthBulking);
if not(isempty(NofBulking))
    disp(['The most dangerous situation was between days ', num2str(min(totalt,NofBulking(MaxLengthBulkingIndex(1))*sampletime)+7),' and ', num2str(min(totalt,(NofBulking(MaxLengthBulkingIndex(1))+MaxLengthBulking)*sampletime)+7),])
end

Foaming=max(LowFtoMFoaming2,HighRBOMfractionFoaming);
NofFoaming=find (Foaming > 0.8);%To find the values higher than 0.8
NofDif0Foaming = find (Foaming > 0.0001); %To find the values higher than 0.0001
   disp(' ')
   disp('The plant has experienced severe (>0.8) risk for (integrated) Foaming')
   disp(['during ',num2str(min(totalt,length(NofFoaming)*sampletime)),' days, i.e. ',num2str(min(100,length(NofFoaming)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['...and risk for the development of (integrated) Foaming ', num2str(min(100,length(NofDif0Foaming)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['average  risk ',num2str(sum(Foaming*sampletime)/totalt),''])
% time interval that the plant is in uninterrupted severe risk of (integrated) Foaming problem.
LengthFoaming=zeros(1,length(NofFoaming));
for i=1:length(NofFoaming)
   j=i;
   k=1;
   if j~=length(NofFoaming)
      while isequal(NofFoaming(j)+1,NofFoaming(j+1))
         k=k+1;
         j=j+1;
         if j==length(NofFoaming) break
         end
      end
      LengthFoaming(i)=k;
   end
   LengthFoaming(length(NofFoaming))=1;
end
MaxLengthFoaming=max(LengthFoaming);
MaxLengthFoamingIndex=find(LengthFoaming==MaxLengthFoaming);
if not(isempty(NofFoaming))
disp(['The most dangerous situation was between days ', num2str(min(totalt,NofFoaming(MaxLengthFoamingIndex(1))*sampletime)+7),' and ', num2str(min(totalt,(NofFoaming(MaxLengthFoamingIndex(1))+MaxLengthFoaming)*sampletime)+7),])
end

[Fil,Col]=size(Foaming);
if Fil==1
OR1 = max(Bulking,Foaming);
else
OR1 = max(Bulking,Foaming');
end

[Fil,Col]=size(OR1);
if Fil==1
OR = max(OR1,Rising1);
else
OR = max(OR1,Rising1');
end

NofOR = find (OR > 0.8);%To find the values higher than 0.8
NofDif0OR = find (OR > 0.0001); %To find the values higher than 0.0001
   disp(' ')
   disp('The plant has experienced OVERALL severe (>0.8) risk for SETTLING PROBLEMS')
   disp(['during ',num2str(min(totalt,length(NofOR)*sampletime)),' days, i.e. ',num2str(min(100,length(NofOR)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['...and risk for the development of SETTLING PROBLEMS ', num2str(min(100,length(NofDif0OR)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['average  risk ',num2str(sum(OR*sampletime)/totalt),''])
% time interval that the plant is in uninterrupted OVERALL severe risk of SETTLING PROBLEMS.
LengthOR=zeros(1,length(NofOR));
for i=1:length(NofOR)
   j=i;
   k=1;
   if j~=length(NofOR)
      while isequal(NofOR(j)+1,NofOR(j+1))
         k=k+1;
         j=j+1;
         if j==length(NofOR) break
         end
      end
      LengthOR(i)=k;
   end
   LengthOR(length(NofOR))=1;
end
MaxLengthOR=max(LengthOR);
MaxLengthORindex=find(LengthOR==MaxLengthOR);
disp(['The most dangerous situation was between days ', num2str(min(totalt,NofOR(MaxLengthOR(1))*sampletime)+7),' and ', num2str(min(totalt,(NofOR(MaxLengthORindex(1))+MaxLengthOR)*sampletime)+7),])

% plotting Fuzzy Settling problems conditions
   figure(16)
   LowDOBulkingsmoothed=smoothing_data(LowDOBulking1,3)'; % filtratge del risk amb 3 d de time constant pel bulking
   plot (time(1:(end-1)),LowDOBulking1,'g')
   hold on
   plot (time(1:(end-1)),LowDOBulkingsmoothed,'b')
   xlabel ('time (days)')
   ylim([0 1])
   title('Risk of Aerobic Filamentous Bulking');

   figure(17)
   plot (time(1:(end-1)),NDefBulking1, 'r')
   xlabel ('time (days)')
   ylim([0 1])
   title('Risk of Nutrient Deficient Filamentous Bulking');

   figure(18)
   LowFMBulkingsmoothed=smoothing_data(LowFtoMBulkingtoplot,3)'; % filtratge del risk amb 3 d de time constant pel bulking
   plot (time(1:(end-1)),LowFtoMBulkingtoplot,'g')
   hold on
   plot (time(1:(end-1)),LowFMBulkingsmoothed,'b')
   xlabel ('time (days)')
   ylim([0 1])
   title('Risk of Low F/M Filamentous Bulking');

   figure(19)
   LowFMFoamingsmoothed=smoothing_data(LowFtoMFoaming2,3)'; % filtratge del risk amb 3 d de time constant pel bulking
   plot (time(1:(end-1)),LowFtoMFoaming2,'g')
   hold on
   plot (time(1:(end-1)),LowFMFoamingsmoothed,'b')
   xlabel ('time (days)')
   ylim([0 1])
   title('Risk of Foaming due to Low FtoM');

   figure(20)
   plot (time(1:(end-1)),HighRBOMfractionFoamingtoplot)
   xlabel ('time (days)')
   ylim([0 1])
   title('Risk of Foaming due to high Ss/Xs fraction'); 
   
if not(isempty(NofRising1))
   figure(21)
   Rising1_smoothed=smoothing_data(Rising1,0.0833)'; % filtratge del risk amb 2 hores de time constant pel rising
   plot (time(1:(end-1)),Rising1,'g')
   hold on
   plot (time(1:(end-1)),Rising1_smoothed,'b')
   xlabel ('time (days)')
   ylim([0 1])
   title('Risk of Rising');
end

toc