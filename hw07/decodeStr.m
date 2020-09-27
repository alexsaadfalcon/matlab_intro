function [ decoded ] = decodeStr(code, num)
%Decodes a string by pulling out every num-th word from the string code
%Or, if there are no spaces, pulls out the num-th character of the string
decoded = '';
counter = 1;
if any(code == ' ')
    rest = code;
    while length(rest) > 0;
        [word, rest] = strtok(rest, ' ,.?!');
        if mod(counter, num) == 0
            decoded = [decoded word ' '];
        end
        counter = counter + 1;
    end
    decoded(end) = '';
else
    decoded = code(num:num:end);
end
end

