function [ out ] = abbreviatingCamelCase( str )
%abbreviates a string str into camelcase while also removing vowels
%unless the vowel is the first letter of the word
spaceMask = str == ' ';
uppercase = str;
uppercase([spaceMask(end) spaceMask(1:end-1)]) = upper(str([spaceMask(end) spaceMask(1:end-1)]));
out = '';
uppercase(1) = upper(uppercase(1));
while ~strcmp(uppercase, '');
    [first uppercase] = strtok(uppercase, [' aeiou']);
    out = [out first];
end
out(1) = lower(out(1));
end

