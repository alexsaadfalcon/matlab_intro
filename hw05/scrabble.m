function [ score ] = scrabble( word, points )
%finds point value of a word in scrabble, including multipliers
word = upper(word);
poundMask = strfind(word, '#');
word(poundMask) = word(poundMask - 1);
multiplier = 2^(sum(word == '!'));
word(word == '!') = '';
letterNumbers = word-64; %moves ASCII values for letters to 1-26
score = sum(points(1,letterNumbers))*multiplier;

end

