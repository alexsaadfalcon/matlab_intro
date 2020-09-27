function [candies] = sumFib(houses)
%sum of a fibonacci sequence up until term numbered by houses
if houses >= 2
    candies = fib(houses) + sumFib(houses - 1);
elseif houses == 1
    candies = 1;
else
    candies = -1;
end
end


function [fibNum] = fib(term)
if term >= 3
    fibNum = fib(term-1) + fib(term-2);
elseif term == 1 || term == 2
    fibNum = 1;
else
    fibNum = -1
end
end