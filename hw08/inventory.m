    function [totalCost] = inventory(sales, prices)
         %output cost%sales for a day %prices of items
%calculates cost to restock a store based on two inputs
fhs = fopen(sales,'r');
fhp = fopen(prices,'r');
fgetl(fhs);
fgetl(fhs);
fgetl(fhp);
fgetl(fhp);%go past first two lines of each, which are just Inventory Data: 
           %and Prices: respectively
i = 1;
keepGoing = true;
while keepGoing
    lineS = fgetl(fhs);
    lineP = fgetl(fhp);
    if ischar(lineS)
        [food{i} rest] = strtok(lineS, ' #'); %3 arrays for food type
        [remaining{i} rest] = strtok(rest, ' #'); %food of type remaining
        [full{i} rest] = strtok(rest, ' #'); %and food of type needed for full inventory 
        remaining{i} = str2num(remaining{i});
        full{i} = str2num(full{i});
    end
    if ischar(lineP)
        [foodCost{i} rest] = strtok(lineP, ' $');
        [cost{i} rest] = strtok(rest, ' $');
        cost{i} = str2num(cost{i});
    end
    if ~ischar(lineS) && ~ischar(lineP)
        keepGoing = false;
    end
    i = i + 1;
end
for k = 1:length(full)
    needed{k} = full{k} - remaining{k}; %finds amount of each food needed. corresponds with names in food
end

totalCost = 0;
for j = 1:length(needed)
    totalCost = totalCost + needed{j} * cost{j};
end

end