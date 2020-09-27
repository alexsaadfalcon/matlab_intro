function [ num ] = snoozeTime(sleep, alarm, snooze, class)
%A handy function to help you calculate how many times you can snooze
%without being late to class
%First convert all times to minutes from midnight
sleep = minutesFromMidnight(sleep);
alarm = minutesFromMidnight(alarm);
class = minutesFromMidnight(class);
num = 0;
if alarm - sleep < 480
    current = alarm;
    while current <= class - 20
        current = current + snooze;
        if current <= class - 20
            num = num + 1;
        end
    end
end

end

function [minutes] = minutesFromMidnight(time)
[hours rest] = strtok(time, ':');
[minutes rest] = strtok(rest, ':');
hours = str2num(hours);
minutes = str2num(minutes);
minutes = minutes + 60*hours;
end