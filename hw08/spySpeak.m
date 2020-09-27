function [] = spySpeak(trans,hot,male,female)
%captures spies who use hot words a lot in conversation. 
fh1 = fopen(trans,'r');
fh2 = fopen(hot,'r');
fh3 = fopen(male,'r');
fh4 = fopen(female,'r');
keepGoing1 = true;
i = 1;
while keepGoing1
    line = fgetl(fh2);
    if ~(line(1) == '-')
        hotWords{i} = line;
    else
        keepGoing1 = false;
    end
    i = i + 1;
end
maleWord = fgetl(fh2);
femaleWord = fgetl(fh2);
keepGoing2 = true;
i = 1;
maleCondition = [false false];
j = 1;
names = [];
while keepGoing2
    line = fgetl(fh1);
    if i < 3
    if ~isempty(strfind(lower(line),lower(maleWord)));
        names{i} = lower(line(1:5));
        maleCondition(i) = true;
        i = i + 1;
    elseif ~isempty(strfind(lower(line),lower(femaleWord)));   
        names{i} = lower(line(1:5));
        maleCondition(i) = false;
        i = i + 1;
    end
    end
    if ischar(line)
        transcript{j} = line;
    else
        keepGoing2 = false;
    end
    j = j + 1;
end
counter = [0 0];
for k = 1:length(transcript)
    for l = 1:length(hotWords)
        if length(transcript{k}) >= 5
        if lower(transcript{k}(1:5)) == names{1}
            counter(1) = counter(1) + length(strfind(lower(transcript{k}),lower(hotWords{l})));
        elseif lower(transcript{k}(1:5)) == names{2}
            counter(2) = counter(2) + length(strfind(lower(transcript{k}),lower(hotWords{l})));
        end
        end
    end
end
for i = 1:5
    maleSuspects{i} = fgetl(fh3);
    femaleSuspects{i} = fgetl(fh4);
end
index = find(trans == '-') - 1;
name = trans(1:index);
out = fopen([name '-REPORT.txt'], 'w');
suspect = {'Unknown' 'Unknown'};
if counter(1) == 0
    suspect{1} = 'Unknown';
else
    if maleCondition(1)
        suspect{1} = maleSuspects{counter(1)};
    else
        suspect{1} = femaleSuspects{counter(1)};
    end
end
if counter(2) == 0
    suspect{2} = 'Unknown';
else
    if maleCondition(2)
        suspect{2} = maleSuspects{counter(2)};
    else
        suspect{2} = femaleSuspects{counter(2)};
    end
end
fprintf(out,'THREAT LEVEL: %d', counter(1) + counter(2));
fprintf(out,'\n\nSUSPECT 1 IDENTITY: %s\nSUSPECT 2 IDENTITY: %s', suspect{1}, suspect{2});


end

