function [ mass ] = molarMass(formula, periodic)
rest = formula;
i = 1;
while ~isempty(rest)
    [elements{i} rest] = strtok(rest, ', ');
    if length(elements{i}) > 1
        if elements{i}(2) >= '1' && elements{i}(2) <= '9'
            type{i} = elements{i}(1);
            num(i) = str2num(elements{i}(2:end));
        else
            if length(elements{i}) > 2
                type{i} = elements{i}(1:2);
                num(i) = str2num(elements{i}(3:end));
            else
                type{i} = elements{i}(1:2);
                num(i) = 1;
            end
        end
    else
        type{i} = elements{i}(1);
        num(i) = 1;
    end
    i = i + 1;
end
mass = 0;
[rows cols] = size(periodic);
len = rows*cols;
for j = 1:length(type)
    for k = 1:len
        if strcmpi(type{j},periodic(k).Symbol)
            mass = mass + periodic(k).AtomicWeight * num(j);
        end
    end
end


end

