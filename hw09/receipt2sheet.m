function [ca ] = receipt2sheet(txt)
%this function does... gosh commenting gets annoying
keepGoing = true;
fh = fopen(txt,'r');
ca = {'Item' 'Quantity' 'Unit Price' 'Total Price'};
i = 2;
while keepGoing
    line = fgetl(fh);
    if ischar(line);
        if sum(line == '-') == 2
        [item rest] = strtok(line,'-');
        item = strtrim(item);
        [quantity rest] = strtok(rest,' -');
        [qType rest] = strtok(rest, ' -');
        [total rest] = strtok(rest,' -');
        total(1) = ''; %remove dollar sign
        total(total == ',') = '';
        unit = str2num(total) / str2num(quantity);
        unit = ['$' num2str(unit)];
        ca{i,1} = item;
        ca{i,2} = [quantity ' ' qType];
        ca{i,3} = unit;
        ca{i,4} = ['$' total];
        else
        [item rest] = strtok(line,' ');
        item = strtrim(item);
        [quantity rest] = strtok(rest,' -');
        [qType rest] = strtok(rest, ' -');
        [total rest] = strtok(rest,' -');
        total(1) = ''; %remove dollar sign
        total(total == ',') = '';
        unit = str2num(total) / str2num(quantity);
        unit = ['$' num2str(unit)];
        ca{i,1} = item;
        ca{i,2} = [quantity ' ' qType];
        ca{i,3} = unit;
        ca{i,4} = ['$' total]; 
        end
    else
        keepGoing = false;
    end
    i = i + 1;
end
name = [txt(1:end-4) 'Sheet.xls']
xlswrite(name,ca);
end

