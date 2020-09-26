function [ admission ] = GTadmissions( scores, valsal, fam )
%The function GT admissions will use for the Fall 2015 freshman class
meetsScores(1) = scores(1)>=3.85;
meetsScores(2) = scores(2)>=2000;
meetsScores(3) = scores(3)>=29;
admission = valsal;
if admission == false;
    admission = (sum(meetsScores) == 3) || ((sum(meetsScores) >= 2) && fam);
end
end

