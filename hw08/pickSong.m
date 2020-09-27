function [ songToPlay ] = pickSong(file, time)
%picks an appropriate song to play depending on the length of time left to
%play a song
[minutes,rest] = strtok(time, ':');
[seconds,rest] = strtok(rest, ':');
timeLength = 60 * str2num(minutes) + str2num(seconds);
f1 = fopen(file,'r');
keepGoing = true;
i = 1; %index to count place in cell array 
minLength = 99999999;
songToPlay = '';
while keepGoing
    line{i} = fgetl(f1);
    keepGoing = ischar(line{i});
    if keepGoing
    line{i} = line{i}(4:end); % removes number, '.' and ' ' from beginning
    hyphenIndex = strfind(line{i},'-');
    lastHyphen = hyphenIndex(end);
    song = line{i}(1:lastHyphen - 2);
    time = strtrim(line{i}(lastHyphen + 2:end));
    [minutes,rest] = strtok(time, ':');
    [seconds,rest] = strtok(rest, ':');
    length = 60 * str2num(minutes) + str2num(seconds);
    if abs(length - timeLength) < abs(minLength - timeLength)
        songToPlay = song;
        minLength = length;
    end
    end
    i = i + 1;
end
songToPlay = strtrim(songToPlay);
fclose(f1);
end

