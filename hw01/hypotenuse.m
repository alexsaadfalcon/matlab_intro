function [ hypotenuse ] = hypotenuse( side1, side2 )
%takes 2 inputs, the two shorter sides of an assumed right triangle, and
%gives 1 output, the length of the hypotenuse of that triangle
%a^2 + b^2 = c^2

hypotenuse = sqrt(side1^2 + side2^2); %uses pythagorean theorem to evaluate
                                      %the length of the hypotenuse

end

