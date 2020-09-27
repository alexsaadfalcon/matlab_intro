function valid = isValidDate(date)
%returns a logical valid if date is a valid date of the calendar year,
%including leap years
[month, rest] = strtok(date, ', ');
[day, rest] = strtok(rest, ', ');
[year, rest] = strtok(rest, ', ');
day = str2num(day);
year = str2num(year);
t1 = year >= 0 & mod(year,1) == 0;
t2 = false;
t3 = false;
switch month
    case {'January', 'March', 'May', 'July', 'August', 'October', 'December'}%Months with 31 days
        t2 = true;
        t3 = day >= 1 & day <= 31 & mod(day,1) == 0;
    case {'April', 'June', 'September', 'November'}
        t2 = true;
        t3 = day >= 1 & day <= 30 & mod(day,1) == 0;
    case {'February'}
        t2 = true;
        if (mod(year,400) == 0) | (mod(year,4) == 0 & mod(year,100) ~= 0);
            t3 = day >= 1 & day <= 29 & mod(day,1) == 0;
        else
            t3 = day >= 1 & day <= 28 & mod(day,1) == 0;
        end
end
valid = t1 & t2 & t3;
end

