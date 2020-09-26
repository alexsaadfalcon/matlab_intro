function [ pos, neg ] = findZeroVelocity( A, B, C, D)
%Finds the zero's of velocity for a component traveling with equation:
%position = At^3 + Bt^2 + Ct + D

[pos, neg] = quad(3*A, 2*B, C);  %#ok<DQUAD> cancels some error with a different quad function
%Plugs the derivative of position (a quadratic function) into quad.m to get its zeroes

end

