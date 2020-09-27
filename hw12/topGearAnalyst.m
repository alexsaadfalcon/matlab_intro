function [ pos vel acc ] = topGearAnalyst(vCoeff,t)
%Some calculus CS coding thing where we find values of
%derivatives/integrals at certain points
for i = 1:length(vCoeff)-1
    aCoeff(i) = (length(vCoeff)-i)*vCoeff(i);
    pCoeff(i) = vCoeff(i)/(length(vCoeff)-i+1);
end
pCoeff(length(vCoeff)) = vCoeff(end);
pCoeff(length(vCoeff)+1) = 0;
pos = polyval(pCoeff,t);
vel = polyval(vCoeff,t);
acc = polyval(aCoeff,t);
end

