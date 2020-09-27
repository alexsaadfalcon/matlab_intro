function [area num] = areaBtnCurves(pol1, pol2, actual, domain)
%area between curves. MORE calulus
while length(pol1) < length(pol2)
    pol1 = [0 pol1];
end
while length(pol1) > length(pol2)
    pol2 = [0 pol2];
end
coeff = pol1 - pol2;
keepGoing = true;
num = 2;
numPoints = [];
percentErrors = [];
while keepGoing
    x = linspace(domain(1),domain(2),num);
    y = polyval(coeff,x);
    area = trapz(x,y);
    percentError = 100*(abs((area - actual)/actual));
    numPoints = [numPoints num];
    percentErrors = [percentErrors percentError];
    if  percentError < 2
        keepGoing = false;
    else
        num = num + 1;
    end
end
plot(numPoints,percentErrors);
xlabel('Number of Samples');
ylabel('Percent Error');
title('Accuracy vs. Samples');
end