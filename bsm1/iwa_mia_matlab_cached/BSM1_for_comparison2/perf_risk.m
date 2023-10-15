% RISK MODULE BSM1
% Implementation of Expert rules to detect 
% suitable conditions for settling problems with biological
% origin (filamentous bulking, foaming and rising sludge), last version March 2009
% Copyright: Dr Joaquim Comas, Dr Xavier Flores-Alsina and Dr Ignasi Rodriguez-Roda, LEQUIA, Girona
% University, Spain

cd risk_calculation
% Some limit values according to literature and author's experience
% SRT limit
SRTReasonableLimit=20;

% SsXs limit (to avoid numerical problems)
SsXsratioReasonableLimit = 1.5;

% Settler SNO limit (rising sludge)
SNOHighLimit=8;

% Influent organic matter and nitrogen loading
BOD5invec1 = BOD5in.*inpart(:,15);
CODinvec1 = CODin.*inpart(:,15);
S_sinvec1 = inpart(:,2).*inpart(:,15);
TNin1 = (SNKjin+SNOin);
TNinvec1 =inpart(:,15).*TNin1;

% Influent organic matter(from the chemical addition)
BOD5invec2= CARBONSOURCECONC.*Qcarbonvec;
CODinvec2 = CARBONSOURCECONC.*Qcarbonvec;
S_sinvec2 = CARBONSOURCECONC.*Qcarbonvec;

%total Influent organic matter and nitrogen loading (sewer+ chemical addition)
BOD5invec3=BOD5invec1 + BOD5invec2; %total influent BOD5 (AS + external carbon)
CODinvec3= CODinvec1 + CODinvec2; %total influent COD (AS + external carbon)
S_sinvec3 = S_sinvec1 + S_sinvec2; % total influent Ss (AS+ external carbon)

BOD5in3 = BOD5invec3./(inpart(:,15)+ Qcarbonvec);
CODin3 = CODinvec3./(inpart(:,15)+ Qcarbonvec);
S_sin3 = S_sinvec3./(inpart(:,15)+ Qcarbonvec);

% Effluent organic matter and nitrogen loading
CODevec=settlerpart(:,31).*CODe; % effluent flow rate (changed in BSM2*)

% determining Biomass in activated sludge tanks 
Biomassvec=0.75*(reac1part(:,5)*VOL1+reac1part(:,6)*VOL1+reac2part(:,5)*VOL2+reac2part(:,6)*VOL2+reac3part(:,5)*VOL3+reac3part(:,6)*VOL3+reac4part(:,5)*VOL4+reac4part(:,6)*VOL4+reac5part(:,5)*VOL5+reac5part(:,6)*VOL5); %XBH + XBA in aeration tanks only, in TSS units
TSSvecreactor=reac1part(:,14)*VOL1+reac2part(:,14)*VOL2+reac3part(:,14)*VOL3+reac4part(:,14)*VOL4+reac5part(:,14)*VOL5; %TSS in aeration tanks

% determining FtoM_1 (kg COD removed/kg MLVSSád) Only biomass in activated sludge tanks considered
FtoM_1vec = (CODinvec3 - CODevec)./Biomassvec;

for i=1:length(FtoM_1vec) %To replace FtoM_1vec values >4 for 4
    if FtoM_1vec(i)>4
        FtoM_1vec(i)=4;
     else
        FtoM_1vec(i)=FtoM_1vec(i);     
    end     
end
    
% determining FtoM_2 (kg BOD5/kg MLVSSád)
FtoM_2vec = BOD5invec3./Biomassvec;

for i=1:length(FtoM_2vec) %To replace FtoM_2vec values >1.5 for 1.5
    if FtoM_2vec(i)>1.5
        FtoM_2vec(i)=1.5;
     else
        FtoM_2vec(i)=FtoM_2vec(i);     
    end     
end

% determining SRT
%Waste sludge production
Qwasteflow = settlerpart(:,16);%%changed in BSM2*
TSSwasteconc = settlerpart(:,41);%%(changed in BSM2*)
TSSuvec2 =TSSwasteconc.*Qwasteflow; % changed in BSM2*
TSSevec2=settlerpart(:,30).*settlerpart(:,31); %TSS in the effluent, in g/d (changed in BSM2*)

% SRT for sludge in aeration tanks, settler not considered
SRTvec =TSSvecreactor./(TSSuvec2+TSSevec2); % TSS in reactor / TSS removed from the system
SRTvec = smoothing_data(SRTvec,3)'; % SRTvec filtering using 3 days data

for i=1:length(SRTvec) %To replace SRTvec values >SRTReasonableLimit for SRTReasonableLimit
    if SRTvec(i)>SRTReasonableLimit
       SRTvec(i)=SRTReasonableLimit;
     else
       SRTvec(i)=SRTvec(i);     
    end     
end

%%determining SsXs ratio
SsXsratio = S_sin3./inpart(:,4);
for i=1:length(SsXsratio) %To replace SRTvec values >SRTReasonableLimit for SRTReasonableLimit
    if SsXsratio(i)>SsXsratioReasonableLimit
       SsXsratio(i)=SsXsratioReasonableLimit;
     else
       SsXsratio(i)=SsXsratio(i);     
    end     
end

% Determining possible bulking conditions due to nutrient deficiency
% Check for nitrogen deficiency Bulking (check for BOD5/N ratio)
BOD5toN = BOD5in3./TNin1;
NDefBulking1=zeros(1,length(BOD5toN));
Nfis=readfis('Deficiency'); %to load the N Deficiency fuzzy inference system developed with the Matlab fuzzy toolbox
NDefBulking1=evalfis(Nfis,BOD5toN); %To evaluate the output of the Nfis fuzzy system for a given input

NDefBulking1_smoothed = smoothing_data(NDefBulking1,3)';
NofNDefBulking1 = find (NDefBulking1> 0.8); %To find the values higher than 0.8
NofDif0NDefBulking1 = find (NDefBulking1 > 0.0001); %To find the values higher than 0.0001
        % to find the worst situation: the most dangerous situation during the evaluation period, computed as the largest 
        % time interval that the plant is in uninterrupted severe risk of NDef bulking problem.
LengthNDefBulking=zeros(1,length(NofNDefBulking1)); % all indexes with NDefBulking > 0.8
for i=1:length(NofNDefBulking1)
   j=i;
   k=1;
   if j~=length(NofNDefBulking1)
      while isequal(NofNDefBulking1(j)+1,NofNDefBulking1(j+1))
         k=k+1;
         j=j+1;
         if j==length(NofNDefBulking1) 
             break
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
   disp('The plant has experienced high (>0.8) risk for the development of filamentous bulking due to N deficiency')
   disp(['during ',num2str(min(totalt,length(NofNDefBulking1)*sampletime)),' days, i.e. ', num2str(min(100,length(NofNDefBulking1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['...and risk for the development of filamentous bulking due to N deficiency ', num2str(min(100,length(NofDif0NDefBulking1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['average risk ',num2str(sum(NDefBulking1*sampletime)/totalt),''])
   disp(['The most dangerous situation was between days ', num2str(min(totalt,NofNDefBulking1(MaxLengthNDefBulkingIndex(1))*sampletime)+starttime),' and ', num2str(min(totalt,(NofNDefBulking1(MaxLengthNDefBulkingIndex(1))+MaxLengthNDefBulking)*sampletime)+starttime),])
   disp(' ')
else
   disp('The plant has experienced high (>0.8) risk for the development of filamentous bulking due to N deficiency')
   disp(['during ',num2str(min(totalt,length(NofNDefBulking1)*sampletime)),' days, i.e. ', num2str(min(100,length(NofNDefBulking1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['...and risk for the development of filamentous bulking due to N deficiency ', num2str(min(100,length(NofDif0NDefBulking1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['average risk ',num2str(sum(NDefBulking1*sampletime)/totalt),''])
   disp(' ')
end

% Determining possible aerobic bulking conditions
bulkingfis=readfis('LowDOBulking'); %to load the Low DO Bulking fuzzy inference system developed with the Matlab fuzzy toolbox
LowDOBulking1=evalfis(bulkingfis,[FtoM_1vec reac3part(:,8)]); %To evaluate the output of the bulkingfis fuzzy system for a given input
LowDOBulking1_smoothed = smoothing_data(LowDOBulking1,3)';
NofLowDOBulking1 = find (LowDOBulking1 > 0.8); %To find the values higher than 0.8
NofDif0LowDOBulking1 = find (LowDOBulking1 > 0.0001); %To find the values higher than 0.0001

% to find the worst situation: the most dangerous situation during the evaluation period, computed as the largest 
        % time interval that the plant is in uninterrupted severe risk of Low DO bulking problem.
LengthLowDOBulking=zeros(1,length(NofLowDOBulking1));
for i=1:length(NofLowDOBulking1)
   j=i;
   k=1;
   if j~=length(NofLowDOBulking1)
      while isequal(NofLowDOBulking1(j)+1,NofLowDOBulking1(j+1))
         k=k+1;
         j=j+1;
         if j==length(NofLowDOBulking1) 
             break
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
   disp('The plant has experienced high (>0.8) risk for the development of aerobic (low DO) filamentous bulking')
   disp(['during ',num2str(min(totalt,length(NofLowDOBulking1)*sampletime)),' days, i.e. ',num2str(min(100,length(NofLowDOBulking1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['...and risk for the development of aerobic (low DO) filamentous bulking ', num2str(min(100,length(NofDif0LowDOBulking1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['average risk ',num2str(sum(LowDOBulking1*sampletime)/totalt),''])
   disp(['The most dangerous situation was between days ', num2str(min(totalt,(NofLowDOBulking1(MaxLengthLowDOBulkingIndex(1)))*sampletime)+starttime),' and ', num2str(min(totalt,(NofLowDOBulking1(MaxLengthLowDOBulkingIndex(1))+MaxLengthLowDOBulking)*sampletime)+starttime),])
   disp(' ')
else
   disp('The plant has experienced high (>0.8) risk for the development of aerobic (low DO) filamentous bulking')
   disp(['during ',num2str(min(totalt,length(NofLowDOBulking1)*sampletime)),' days, i.e. ',num2str(min(100,length(NofLowDOBulking1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['...and risk for the development of aerobic (low DO) filamentous bulking ', num2str(min(100,length(NofDif0LowDOBulking1)*sampletime/totalt*100)),'% of the operating time.'])   
   disp(['average risk ',num2str(sum(LowDOBulking1*sampletime)/totalt),''])
   disp(' ')
end

%Determining conditions for Low F/M bulking
bulkingfis=readfis('FtoMBulking_1');%to load the Low F/M Bulking fuzzy inference system developed with the Matlab fuzzy toolbox
%To evaluate the output of the bulkingfis fuzzy system (low F/M bulking) for a given input; inpart (:,2)=influent SS
LowFtoMBulking1=evalfis(bulkingfis,[reac1part(:,2) SRTvec]); %react(:,2)=reactor SS
   
bulkingfis=readfis('FtoMBulking_2');%to load the Low F/M Bulking_2 fuzzy inference system developed with the Matlab fuzzy toolbox
%To evaluate the output of the bulkingfis fuzzy system (low F/M bulking) for a given input; inpart (:,2)=influent SS
LowFtoMBulking2=evalfis(bulkingfis,[FtoM_2vec SRTvec]);%F/M_2 food to microorganisms ratio

[Fil,Col]=size(LowFtoMBulking1);
if Fil==1
LowFtoMBulking1 = LowFtoMBulking1';
end

[Fil,Col]=size(LowFtoMBulking2);
if Fil==1
LowFtoMBulking2 = LowFtoMBulking2';
end

LowFtoMBulking=max(LowFtoMBulking1,LowFtoMBulking2);

LowFtoMBulking_smoothed = smoothing_data(LowFtoMBulking,3)';
NofLowFtoMBulking=find (LowFtoMBulking> 0.8);        
NofDif0LowFtoMBulking = find (LowFtoMBulking > 0.0001);% to find the worst situation: the most dangerous situation during the evaluation period, computed as the largest 
        % time interval that the plant is in uninterrupted severe risk of
        % Low F/M bulking problem
if not(isempty(NofLowFtoMBulking))
      LengthLowFtoMBulking=zeros(1,length(NofLowFtoMBulking));
      for i=1:length(NofLowFtoMBulking)  
         j=i;
         k=1;
         if j~=length(NofLowFtoMBulking)
            while isequal(NofLowFtoMBulking(j)+1,NofLowFtoMBulking(j+1))
               k=k+1;
               j=j+1;
               if j==length(NofLowFtoMBulking) 
                   break
               end
            end
            LengthLowFtoMBulking(i)=k;
         end
         LengthLowFtoMBulking(length(NofLowFtoMBulking))=1;
      end
      MaxLengthLowFtoMBulking=max(LengthLowFtoMBulking);
      MaxLengthLowFtoMBulkingIndex=find(LengthLowFtoMBulking==MaxLengthLowFtoMBulking);  
      
%Display Low F/M Bulking problems    
      disp('The plant has experienced severe (>0.8) risk for the development of low F/M filamentous bulking')
      disp(['during ',num2str(min(totalt,length(NofLowFtoMBulking)*sampletime)),' days, i.e. ',num2str(min(100,length(NofLowFtoMBulking)*sampletime/totalt*100)),'% of the operating time.'])
      disp(['...and risk for the development of low F/M filamentous bulking ', num2str(min(100,length(NofDif0LowFtoMBulking)*sampletime/totalt*100)),'% of the operating time.'])
      disp(['average risk ',num2str(sum(LowFtoMBulking*sampletime)/totalt),''])
      disp(['The most dangerous situation was between days ', num2str(min(totalt,NofLowFtoMBulking(MaxLengthLowFtoMBulkingIndex(1))*sampletime)+starttime),' and ', num2str(min(totalt,(NofLowFtoMBulking(MaxLengthLowFtoMBulkingIndex(1))+MaxLengthLowFtoMBulking)*sampletime)+starttime),])
      disp(' ')
 else % LowFtoMBulking is empty
    disp('The plant has experienced severe (>0.8) risk for the development of low F/M filamentous bulking')
    disp(['during ',num2str(min(totalt,length(NofLowFtoMBulking)*sampletime)),' days, i.e. ',num2str(min(100,length(NofLowFtoMBulking)*sampletime/totalt*100)),'% of the operating time.'])
    disp(['...and risk for the development of low F/M filamentous bulking ', num2str(min(100,length(NofDif0LowFtoMBulking)*sampletime/totalt*100)),'% of the operating time.'])
    disp(['average risk ',num2str(sum(LowFtoMBulking*sampletime)/totalt),''])
    disp(' ')
end

% Determining possible foaming conditions due to limited substrate (lowFtoM Foaming)
foamingfis=readfis('FoamingNocMic'); %to load the Low F/M Foaming fuzzy inference system developed with the Matlab fuzzy toolbox
%To evaluate the output of the foamingfis fuzzy system (low F/M foaming) for a given input 
LowFtoMFoaming2=evalfis(foamingfis,[FtoM_2vec SRTvec]);
    
LowFtoMFoaming2_smoothed = smoothing_data(LowFtoMFoaming2,3)';
NofLowFtoMFoaming2 = find (LowFtoMFoaming2 > 0.8);
NofDif0LowFtoMFoaming2 = find (LowFtoMFoaming2 > 0.0001); %To find the values higher than 0.0001

% to find the worst situation: the most dangerous situation during the evaluation period, computed as the largest 
        % time interval that the plant is in uninterrupted severe risk of 
        % Low F/M Foaming problem.        
if not(isempty(NofLowFtoMFoaming2))
      LengthLowFtoMFoaming=zeros(1,length(NofLowFtoMFoaming2));
      for i=1:length(NofLowFtoMFoaming2)   
         j=i;
         k=1;
         if j~=length(NofLowFtoMFoaming2)
            while isequal(NofLowFtoMFoaming2(j)+1,NofLowFtoMFoaming2(j+1))
               k=k+1;
               j=j+1;
               if j==length(NofLowFtoMFoaming2) 
                   break
               end
            end
            LengthLowFtoMFoaming(i)=k;
         end
         LengthLowFtoMFoaming(length(NofLowFtoMFoaming2))=1;
      end
      MaxLengthLowFtoMFoaming=max(LengthLowFtoMFoaming);
      MaxLengthLowFtoMFoamingIndex=find(LengthLowFtoMFoaming==MaxLengthLowFtoMFoaming);
      
%Display Low F/M Bulking problems     
      disp('The plant has experienced high (>0.8) risk for the development of low F/M foaming')
      disp(['during ',num2str(min(totalt,length(NofLowFtoMFoaming2)*sampletime)),' days, i.e. ',num2str(min(100,length(NofLowFtoMFoaming2)*sampletime/totalt*100)),'% of the operating time.'])
      disp(['...and risk for the development of low F/M foaming ', num2str(min(100,length(NofDif0LowFtoMFoaming2)*sampletime/totalt*100)),'% of the operating time.'])
      disp(['average risk ',num2str(sum(LowFtoMFoaming2*sampletime)/totalt),'']) 
      disp(['The most dangerous situation was between days ', num2str(min(totalt,NofLowFtoMFoaming2(MaxLengthLowFtoMFoamingIndex(1))*sampletime)+starttime),' and ', num2str(min(totalt,(NofLowFtoMFoaming2(MaxLengthLowFtoMFoamingIndex(1))+MaxLengthLowFtoMFoaming)*sampletime)+starttime),])
      disp(' ')
else
      disp('The plant has experienced high (>0.8) risk for the development of low F/M foaming')
      disp(['during ',num2str(min(totalt,length(NofLowFtoMFoaming2)*sampletime)),' days, i.e. ',num2str(min(100,length(NofLowFtoMFoaming2)*sampletime/totalt*100)),'% of the operating time.'])
      disp(['...and risk for the development of low F/M foaming ', num2str(min(100,length(NofDif0LowFtoMFoaming2)*sampletime/totalt*100)),'% of the operating time.'])
      disp(['average risk ',num2str(sum(LowFtoMFoaming2*sampletime)/totalt),''])
      disp(' ')
end

% Determining possible foaming conditions due to high readily biodegradable organic matter fraction
foamingfis=readfis('Foaming1863_1');%to load the high RBOM fraction foaming fuzzy inference system developed with the Matlab fuzzy toolbox
HighRBOMfractionFoaming1=evalfis(foamingfis,[FtoM_2vec SsXsratio]);

HighRBOMfractionFoaming2 = [];
foamingfis=readfis('Foaming1863_2');%to load the high RBOM fraction foaming_2 fuzzy inference system developed with the Matlab fuzzy toolbox
%To evaluate the output of the foamingfis fuzzy system (due to high readily
%biodegradable organic matter fraction) for a given input, in another way
HighRBOMfractionFoaming2=evalfis(foamingfis,[SRTvec SsXsratio]);% SS/XS ratio
   
[Fil,Col]=size(HighRBOMfractionFoaming1);
if Fil==1
   HighRBOMfractionFoaming1=HighRBOMfractionFoaming1';
end
[Fil,Col]=size(HighRBOMfractionFoaming2);
if Fil==1
   HighRBOMfractionFoaming2=HighRBOMfractionFoaming2';
end

HighRBOMfractionFoaming=max(HighRBOMfractionFoaming1,HighRBOMfractionFoaming2);

HighRBOMfractionFoaming_smoothed=smoothing_data(HighRBOMfractionFoaming,3)';
NofHighRBOMfractionFoaming=find(HighRBOMfractionFoaming> 0.8);
NofDif0HighRBOMfractionFoaming = find(HighRBOMfractionFoaming > 0.0001); %To find the values higher than 0.0001

 if not(isempty(NofHighRBOMfractionFoaming))
      LengthHighRBOMfractionFoaming=zeros(1,length(NofHighRBOMfractionFoaming));
      for i=1:length(NofHighRBOMfractionFoaming)   
         j=i;
         k=1;
         if j~=length(NofHighRBOMfractionFoaming)
            while isequal(NofHighRBOMfractionFoaming(j)+1,NofHighRBOMfractionFoaming(j+1))
               k=k+1;
               j=j+1;
               if j==length(NofHighRBOMfractionFoaming) 
                   break
               end
            end
            LengthHighRBOMfractionFoaming(i)=k;
         end
         LengthHighRBOMfractionFoaming(length(NofHighRBOMfractionFoaming))=1;
      end
MaxLengthHighRBOMfractionFoaming=max(LengthHighRBOMfractionFoaming);
MaxLengthHighRBOMfractionFoamingIndex=find(LengthHighRBOMfractionFoaming==MaxLengthHighRBOMfractionFoaming); 

%Display Low SsXs foaming problems      
disp('The plant has experienced high (>0.8) risk for the development of foaming due to high Ss/Xs fraction')
disp(['during ',num2str(min(totalt,length(NofHighRBOMfractionFoaming)*sampletime)),' days, i.e. ',num2str(min(100,length(NofHighRBOMfractionFoaming)*sampletime/totalt*100)),'% of the operating time.'])
disp(['...and risk for the development of foaming due to high Ss/Xs fraction ', num2str(min(100,length(NofDif0HighRBOMfractionFoaming)*sampletime/totalt*100)),'% of the operating time.'])
disp(['average risk ',num2str(sum(HighRBOMfractionFoaming*sampletime)/totalt),''])
disp(['The most dangerous situation was between days ', num2str(min(totalt,NofHighRBOMfractionFoaming(MaxLengthHighRBOMfractionFoamingIndex(1))*sampletime)+starttime),' and ', num2str(min(totalt,(NofHighRBOMfractionFoaming(MaxLengthHighRBOMfractionFoamingIndex(1))+MaxLengthHighRBOMfractionFoaming)*sampletime)+starttime),])
disp(' ')
else % HighRBOMfractionFoaming is empty
disp('The plant has experienced high (>0.8) risk for the development of foaming due to high Ss/Xs fraction')
disp(['during ',num2str(min(totalt,length(NofHighRBOMfractionFoaming)*sampletime)),' days, i.e. ',num2str(min(100,length(NofHighRBOMfractionFoaming)*sampletime/totalt*100)),'% of the operating time.'])
disp(['...and risk for the development of foaming due to high Ss/Xs fraction ', num2str(min(100,length(NofDif0HighRBOMfractionFoaming)*sampletime/totalt*100)),'% of the operating time.'])
disp(['average risk ',num2str(sum(HighRBOMfractionFoaming*sampletime)/totalt),''])
disp(' ')
 end

 %Determining possible suitable conditions for Rising sludge
i=0;
SsOutReac5=reac5part(:,2);
SNOOutReac5=reac5part(:,9);
SoOutReac5=reac5part(:,8);
Rising1=zeros(1,length(SNOOutReac5));
XBHOutReac5= reac5part(:,5);
XBHOutBottomClarifier= settlerpart(:,5);

SludgeVolumeInClarifier=(settlerpart(:,32).*600+settlerpart(:,33).*600+settlerpart(:,34).*600+settlerpart(:,35).*600+settlerpart(:,36).*600+settlerpart(:,37).*600+settlerpart(:,38).*600+settlerpart(:,39).*600+settlerpart(:,40).*600+settlerpart(:,41).*600)./settlerpart(:,41);%%changed in BSM2*

nitrifiers_fraction=1;
Rdn2=((1-Y_H)./(2.86.*Y_H)).*(mu_H*(SsOutReac5./(K_S+SsOutReac5))).*(SNOOutReac5./(K_NO+SNOOutReac5)).*XBHOutBottomClarifier.*ny_g;%considering DO=0 mgO2/L, %%changed in BSM2*
t_delay=(SoOutReac5./(2.86*Rdn2/nitrifiers_fraction));%%changed in BSM2*

Limit1=SludgeVolumeInClarifier./(Qrflow+1);
Limit2=(SludgeVolumeInClarifier./(Qrflow+1))+0.01;
Limit3=(SludgeVolumeInClarifier./(Qrflow+1))+0.02;

for i=1:length(SNOOutReac5)      
%Risingfis = newfis('Rising');
 Risingfis = mamfis('Name','Rising');
%%%definition of the inputs
Risingfis = addInput(Risingfis,[0 40],'Name','Sno');
Risingfis = addMF(Risingfis,'Sno','trapmf',[-1.429 -1.429 2 5],'Name','L');
Risingfis = addMF(Risingfis,'Sno','trimf',[2 5 8],'Name','N');
Risingfis = addMF(Risingfis,'Sno','trapmf',[5 8 40.27 41.87],'Name','H');
Risingfis = addInput(Risingfis,[0 2.2],'Name','ratiodn');
Risingfis = addMF(Risingfis,'ratiodn','trapmf',[Limit2(i) Limit3(i) 2.205 2.272],'Name','H');
Risingfis = addMF(Risingfis,'ratiodn','trapmf',[-0.135 -0.0437 Limit1(i) Limit2(i)],'Name','L');
Risingfis = addMF(Risingfis,'ratiodn','trimf',[Limit1(i) Limit2(i) Limit3(i)],'Name','N');
%%%definition of the outputs
Risingfis = addOutput(Risingfis,[-0.2 1.2], 'Name','Rising');
Risingfis = addMF(Risingfis,'Rising','trimf',[-0.2 0 0.2],'Name','Low');
Risingfis = addMF(Risingfis,'Rising','trimf',[0.2 0.5 0.8],'Name','Medium');
Risingfis = addMF(Risingfis,'Rising','trimf',[0.8 1 1.2],'Name','High');
%%%definition of the rules
rulelist =[
3 1 1 1 1
2 1 1 1 1
2 3 1 1 1
2 2 2 1 1
1 1 1 1 1
1 2 1 1 1
1 3 1 1 1
3 3 2 1 1
3 2 3 1 1
];
Risingfis = addRule(Risingfis, rulelist);
%writefis(Risingfis,'Risingfis');
Rising1(i)=evalfis(Risingfis,[SNOOutReac5(i) ((SNOHighLimit./Rdn2(i))+t_delay(i))]);
end

NofRising1 = find (Rising1 > 0.8);%To find the values higher than 0.8 
NofDif0Rising1 = find (Rising1 > 0.0001); %To find the values higher than 0.0001
Rising1_smoothed=smoothing_data(Rising1,0.0833)'; % filtratge del risk amb 2 hores de time constant pel rising; in BSM1 only to be used for plotting purposes
        % to find the worst situation and display results: the most dangerous situation during the evaluation period, 
        % computed as the largest time interval that the plant is in uninterrupted severe risk of Rising problem. 
LengthNofRising=zeros(1,length(NofRising1));
for i=1:length(NofRising1)  
   j=i;
   k=1;
   if j~=length(NofRising1)
      while isequal(NofRising1(j)+1,NofRising1(j+1))
         k=k+1;
         j=j+1;
         if j==length(NofRising1) 
             break
         end
      end
      LengthNofRising(i)=k;
   end
   LengthNofRising(length(NofRising1))=1;
end
MaxLengthRising=max(LengthNofRising);
MaxLengthRisingIndex=find(LengthNofRising==MaxLengthRising);   

if not(isempty(NofRising1))
   disp('The plant has experienced high (>0.8) risk for the development of rising sludge')
   disp(['during ',num2str(min(totalt,length(NofRising1)*sampletime)),' days, i.e. ',num2str(min(100,length(NofRising1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['...and risk for the development of rising sludge ', num2str(min(100,length(NofDif0Rising1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['average risk ',num2str(sum(Rising1*sampletime)/totalt),''])
   disp(['The most dangerous situation was between days ', num2str(min(totalt,NofRising1(MaxLengthRisingIndex(1))*sampletime)+starttime),' and ', num2str(min(totalt,(NofRising1(MaxLengthRisingIndex(1))+MaxLengthRising)*sampletime)+starttime),])
   disp(' ')
else
   disp('The plant has experienced high (>0.8) risk for the development of rising sludge')
   disp(['during ',num2str(min(totalt,length(NofRising1)*sampletime)),' days, i.e. ',num2str(min(100,length(NofRising1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['...and risk for the development of rising sludge ', num2str(min(100,length(NofDif0Rising1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['average risk ',num2str(sum(Rising1*sampletime)/totalt),''])
end


% Calculating the overall risk (taking the max at every time step)
disp('Overall risk')
disp('------------')
[Fil,Col]=size(NDefBulking1);
if Fil==1
NDefBulking1 = NDefBulking1';
end

[Fil,Col]=size(LowDOBulking1);
if Fil==1
LowDOBulking1 = LowDOBulking1';
end

[Fil,Col]=size(LowFtoMBulking);
if Fil==1
LowFtoMBulking = LowFtoMBulking1';
end

%%selects the maximum bulking period between NDef Bulking and LowDO bulking
Bulking1=max(NDefBulking1, LowDOBulking1);
%%selects the maximum bulking period between the previous Bulking and LowFM bulking
Bulking=max(Bulking1, LowFtoMBulking);

NofBulking = find (Bulking > 0.8);%To find the values higher than 0.8
NofDif0Bulking = find (Bulking > 0.0001); %To find the values higher than 0.0001
   disp('The plant has experienced severe (>0.8) risk for (integrated) BULKING')
   disp(['during ',num2str(min(totalt,length(NofBulking)*sampletime)),' days, i.e. ',num2str(min(100,length(NofBulking)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['...and risk for the development of (integrated) Bulking ', num2str(min(100,length(NofDif0Bulking)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['average risk ',num2str(sum(Bulking*sampletime)/totalt),''])
% time interval that the plant is in uninterrupted severe risk of (integrated) Bulking problem.
LengthBulking=zeros(1,length(NofBulking));
for i=1:length(NofBulking)
   j=i;
   k=1;
   if j~=length(NofBulking)
      while isequal(NofBulking(j)+1,NofBulking(j+1))
         k=k+1;
         j=j+1;
         if j==length(NofBulking) 
             break
         end
      end
      LengthBulking(i)=k;
   end
   LengthBulking(length(NofBulking))=1;
end
MaxLengthBulking=max(LengthBulking);
MaxLengthBulkingIndex=find(LengthBulking==MaxLengthBulking);
if not(isempty(NofBulking))
    disp(['The most dangerous situation was between days ', num2str(min(totalt,NofBulking(MaxLengthBulkingIndex(1))*sampletime)+starttime),' and ', num2str(min(totalt,(NofBulking(MaxLengthBulkingIndex(1))+MaxLengthBulking)*sampletime)+starttime),])
end
disp(' ')

[Fil,Col]=size(LowFtoMFoaming2);
if Fil==1
LowFtoMFoaming2 = LowFtoMFoaming2';
end

[Fil,Col]=size(HighRBOMfractionFoaming);
if Fil==1
HighRBOMfractionFoaming = HighRBOMfractionFoaming';
end

%%selects the maximum foaming period between SsXs and Low FM foaming
Foaming=max(LowFtoMFoaming2,HighRBOMfractionFoaming);

NofFoaming=find (Foaming > 0.8);%To find the values higher than 0.8
NofDif0Foaming = find (Foaming > 0.0001); %To find the values higher than 0.0001
   disp('The plant has experienced severe (>0.8) risk for (integrated) FOAMING')
   disp(['during ',num2str(min(totalt,length(NofFoaming)*sampletime)),' days, i.e. ',num2str(min(100,length(NofFoaming)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['...and risk for the development of (integrated) Foaming ', num2str(min(100,length(NofDif0Foaming)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['average risk ',num2str(sum(Foaming*sampletime)/totalt),''])
   disp(' ')
% time interval that the plant is in uninterrupted severe risk of (integrated) Foaming problem.
LengthFoaming=zeros(1,length(NofFoaming));
for i=1:length(NofFoaming)
   j=i;
   k=1;
   if j~=length(NofFoaming)
      while isequal(NofFoaming(j)+1,NofFoaming(j+1))
         k=k+1;
         j=j+1;
         if j==length(NofFoaming) 
             break
         end
      end
      LengthFoaming(i)=k;
   end
   LengthFoaming(length(NofFoaming))=1;
end
MaxLengthFoaming=max(LengthFoaming);
MaxLengthFoamingIndex=find(LengthFoaming==MaxLengthFoaming);
if not(isempty(NofFoaming))
   disp(['The most dangerous situation was between days ', num2str(min(totalt,NofFoaming(MaxLengthFoamingIndex(1))*sampletime)+starttime),' and ', num2str(min(totalt,(NofFoaming(MaxLengthFoamingIndex(1))+MaxLengthFoaming)*sampletime)+starttime),])
end

[Fil,Col]=size(Rising1);
if Fil==1
Rising1 = Rising1';
end

%%%%selects the maximum period between bulking and foaming
OR1 = max(Bulking,Foaming);
%%%%selects the maximum period between bulking,foaming and rising
OR = max(OR1,Rising1);

if not(isempty(NofRising1))
   disp('The plant has experienced high (>0.8) risk for the development of RISING SLUDGE')
   disp(['during ',num2str(min(totalt,length(NofRising1)*sampletime)),' days, i.e. ',num2str(min(100,length(NofRising1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['...and risk for the development of rising sludge ', num2str(min(100,length(NofDif0Rising1)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['average risk ',num2str(sum(Rising1*sampletime)/totalt),''])
   disp(['The most dangerous situation was between days ', num2str(min(totalt,NofRising1(MaxLengthRisingIndex(1))*sampletime)+starttime),' and ', num2str(min(totalt,(NofRising1(MaxLengthRisingIndex(1))+MaxLengthRising)*sampletime)+starttime),])
   disp(' ')
end

NofOR = find (OR > 0.8);%To find the values higher than 0.8
NofDif0OR = find (OR > 0.0001); %To find the values higher than 0.0001
   disp('The plant has experienced OVERALL severe (>0.8) risk for OVERALL SETTLING PROBLEMS')
   disp(['during ',num2str(min(totalt,length(NofOR)*sampletime)),' days, i.e. ',num2str(min(100,length(NofOR)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['...and risk for the development of OVERALL SETTLING PROBLEMS ', num2str(min(100,length(NofDif0OR)*sampletime/totalt*100)),'% of the operating time.'])
   disp(['average risk ',num2str(sum(OR*sampletime)/totalt),''])
% time interval that the plant is in uninterrupted OVERALL severe risk of SETTLING PROBLEMS.
LengthOR=zeros(1,length(NofOR));
for i=1:length(NofOR)
   j=i;
   k=1;
   if j~=length(NofOR)
      while isequal(NofOR(j)+1,NofOR(j+1))
         k=k+1;
         j=j+1;
         if j==length(NofOR) 
             break
         end
      end
      LengthOR(i)=k;
   end
   LengthOR(length(NofOR))=1;
end
MaxLengthOR=max(LengthOR);
MaxLengthORindex=find(LengthOR==MaxLengthOR);
disp(['The most dangerous situation was between days ', num2str(min(totalt,NofOR(MaxLengthOR(1))*sampletime)+starttime),' and ', num2str(min(totalt,(NofOR(MaxLengthORindex(1))+MaxLengthOR)*sampletime)+starttime),])
disp(' ')

% plotting Fuzzy Settling problems conditions
   figure(16)
   plot (time(1:(end-1)),LowDOBulking1,'g')
   hold on
   plot (time(1:(end-1)),LowDOBulking1_smoothed,'b')
   xlabel ('time (days)')
   ylim([0 1])
   title('Risk of Aerobic Filamentous Bulking');
   hold off

   figure(17)
   plot (time(1:(end-1)),NDefBulking1, 'g')
   hold on
   plot (time(1:(end-1)),NDefBulking1_smoothed,'b')
   xlabel ('time (days)')
   ylim([0 1])
   title('Risk of Nutrient Deficient Filamentous Bulking');
   hold off
 
   figure(18)
   plot (time(1:(end-1)),LowFtoMBulking,'g')
   hold on
   plot (time(1:(end-1)),LowFtoMBulking_smoothed,'b')
   xlabel ('time (days)')
   ylim([0 1])
   title('Risk of Low F/M Filamentous Bulking');
   hold off

   figure(19)
   plot (time(1:(end-1)),LowFtoMFoaming2,'g')
   hold on
   plot (time(1:(end-1)),LowFtoMFoaming2_smoothed,'b')
   xlabel ('time (days)')
   ylim([0 1])
   title('Risk of Foaming due to Low FtoM');
   hold off

   figure(20)
   plot (time(1:(end-1)),HighRBOMfractionFoaming,'g')
   hold on
   plot (time(1:(end-1)),HighRBOMfractionFoaming_smoothed,'b')
   xlabel ('time (days)')
   ylim([0 1])
   title('Risk of Foaming due to high Ss/Xs fraction'); 
   hold off
   
if not(isempty(NofRising1))
   figure(21)
   plot (time(1:(end-1)),Rising1,'g')
   hold on
   plot (time(1:(end-1)),Rising1_smoothed,'b')
   xlabel ('time (days)')
   ylim([0 1])
   title('Risk of Rising');
   hold off
end

cd ..

