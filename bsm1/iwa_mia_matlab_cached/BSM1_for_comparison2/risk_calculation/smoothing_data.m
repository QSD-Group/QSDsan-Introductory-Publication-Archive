function [smoothed_data]=smoothing_data(dataset,timeconstant)

T=timeconstant; %time constant, days
samplingtime=15;
alpha=1-1/(T*(1440/samplingtime));
% if T is in days, then alpha=1-(1/96)/3 = 0.9965;
smoothed_data(1)=dataset(1);

for i=2:length(dataset)
smoothed_data(i)=alpha*smoothed_data(i-1)+(1-alpha)*dataset(i);
end 
