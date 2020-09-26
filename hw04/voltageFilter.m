function [ filtered, fix ] = voltageFilter( v1, v2, v3 )
%Uses pressure based sensors to find flaws in some system that takes strain
fix = zeros(size(v1)); %makes sure fix is the same size as v1 through v3
fix(v1 == v2 & v2 == v3) = 2; %sets defective sensors to 2
v1(v1<1) = 0; %filters out noise
v2(v1<1) = 0;
v3(v1<1) = 0;
[row, col] = size(v1);
num = row*col; %finds number of entries to determine average
a1 = sum(sum(v1))/num; %finds average of v1,
a2 = sum(sum(v2))/num; %v2, and
a3 = sum(sum(v3))/num; %v3
spikes1 = v1 > (3.*a1); %sets random spikes' indices to spikes 1-3
spikes2 = v2 > (3.*a2);
spikes3 = v3 > (3.*a3);
v1(spikes1) = 0; %sets values of random spikes to zero
v2(spikes2) = 0;
v3(spikes3) = 0;
filtered = (v1 + v2 + v3)/3; %sets filtered to average of 3 cases after they are filtered
average = sum(sum(filtered(filtered~=0)))./sum(sum(filtered ~= 0)); %finds total average
fix(spikes1 | spikes2 | spikes3) = 1; %puts in spikes to fix
filtered(fix == 1 | fix == 2) = average; %fixes values in filtered by setting them to the mean
end

