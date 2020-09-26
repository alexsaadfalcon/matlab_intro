function [ out ] = evenOrOddlyLengthed( vec )
%Returns odd indices if vec is odd lengthed
%Returns even indices if vec is even lengthed
if mod(length(vec),2) == 0;
    out = vec(2:2:end);
end
if mod(length(vec),2) == 1;
    out = vec(1:2:end);
end
end

