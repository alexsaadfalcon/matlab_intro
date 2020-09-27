function [ stretch ] = textStretch(message, word, letter, factor)
%adds white girl emphasis on a text message
index = strfind(message, word);
index = index - 1 + strfind(word, letter);
stretch = message(1:index - 1);
for i = 1:factor;
    stretch = [stretch letter];
end
stretch = [stretch message(index + 1:end)];

end

