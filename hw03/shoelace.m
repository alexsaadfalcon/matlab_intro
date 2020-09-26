function [ area ] = shoelace(x , y)
%finds the area of a polygon determined by the x and y coordinate vectors
sum1 = 0;
sum2 = 0;
for i = 1:(length(x)-1);
    sum1 = sum1 + x(i).*y(i+1);
    sum2 = sum2 + y(i).*x(i+1);
end
sum1 = sum1 + x(end)*y(1);
sum2 = sum2 + y(end)*x(1);
area = abs(sum1 - sum2) / 2;
end
