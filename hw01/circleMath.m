function [ area, perimeter ] = circleMath( diameter )
%takes 1 input, the diamater of a circle, and
%gives 2 outputs, the area and the perimeter of that circle

radius = diameter / 2; %calculates the radius to use more commonly known formulas
perimeter = 2 * pi * radius; %P = 2pi(r)
area = pi * radius^2; %A = pi(r)^2


end

