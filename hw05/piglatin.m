function [ pig ] = piglatin( words )
%Converts an english sentence to pig latin. Simple enough
[word1, word2] = strtok(words, ' ');
word1 = lower(word1);
word2 = lower(word2);
[word12 word11] = strtok(word1, 'aeiou'); %splits word by first vowel
[word22 word21] = strtok(word2, 'aeiou');
if word22(1) == ' ';
    word22 = word22(2:end);
end
pig = ['My most favorite thing in the world is ' word11 '-' word12 'ay, but I hate ' word21 '-' word22 'ay!'];

end

