function [ pos, neg ] = quad( A, B, C )     %A = x^2 coefficient
%Ax^2 + Bx + C = 0, quadratic equation solver    %B = x coefficient
                                                 %C = constant
discriminant = sqrt(B^2 - 4 * A * C);

pos = (-B + discriminant) / (2*A); %calculates the positive root, the + of +/-
neg = (-B - discriminant) / (2*A); %calculates the negative root, using - instead

end

