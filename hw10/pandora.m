function [ next ] = pandora(now, possible)
%freaking pandora in MATLAB. I'm doing this at 2am and I'm going to be up
%the rest of the night basically. Why the heck am I doing extra credit for
%one, and for two, WHY AM I WRITING THIS IF I'M WASTING TIME

genre = now.Genre.Genre;
key = now.Key;
vocals = now.Vocals;
instr = now.DrivingInstrument.Instrument;
[rows cols] = size(possible);
len = rows*cols;
maxPercent = -1;
for i = 1:len
    percentMatch = 0;
    if strcmpi(possible(i).Key, key)
        percentMatch = percentMatch + 10;
    end
    if strcmpi(possible(i).Vocals,vocals)
        percentMatch = percentMatch + 20;
    end
    if strcmpi(possible(i).DrivingInstrument.Instrument,instr)
        percentMatch = percentMatch + 30;
    else
        for j = 1:length(possible(i).DrivingInstrument.RelatedInstruments)
            if strcmpi(possible(i).DrivingInstrument.RelatedInstruments{j}, instr)
                percentMatch = percentMatch + 15;
            end
        end
    end
    if strcmpi(possible(i).Genre.Genre,genre)
        percentMatch = percentMatch + 40;
    else
        for j = 1:length(possible(i).Genre.RelatedGenres)
            if strcmpi(possible(i).Genre.RelatedGenres{j},genre)
                percentMatch = percentMatch + 20;
            end
        end
    end
    if percentMatch > maxPercent
        next = possible(i).Title;
        maxPercent = percentMatch;
    end
end

end

