function [ x ] = encoded( vec, num )
%Takes 2 inputs and checks to see if the second input, a number,
%is encoded into the first input, a vector.
x(1) = any(vec==num); %test 1
test = true; %default value for test, may become false if test 2 is false
for i = 1:length(vec)-1; %test 2
    if vec(i+1) - vec(i) ~= num;
        test = false;
    end
end
x(2) = test;
x(3) = sum(vec) == num; %test 3
x(4) = sum(mod(vec,num) == 0); %test 4

end

