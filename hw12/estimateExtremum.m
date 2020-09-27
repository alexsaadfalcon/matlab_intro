function [ext] = estimateExtremum(x,y)
yder = diff(y)./diff(x);
xder = x(1:end - 1) + diff(x)/2;
xZero = interp1(yder,xder,0);
yZero = interp1(x,y,xZero);
ext = [xZero yZero];
end