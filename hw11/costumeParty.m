function [bought leftover] = costumeParty(items, budget) 
%comment
keepGoing = true;
bought = [];
while keepGoing
    item = cheapest(items);
    if item{2} <= budget
        budget = budget - item{2};
        bought = [bought ; item(1)];
        [rows cols] = size(items);
        for i = 1:rows
            if strcmp(item{1},items{i,1})
                items(i,:) = [];
                break;
            end
        end
    else
        keepGoing = false;
    end
end
leftover = budget;   
end

function [cheapestItem] = cheapest(items)
[rows cols] = size(items);
if rows == 1
    cheapestItem = items(1,:);
elseif items{1,2} >= items{2,2}  
    cheapestItem = cheapest(items(2:rows,:));
elseif items{1,2} < items{2,2}
    if rows >= 3
       cheapestItem = cheapest([items(1,:) ; items(3:rows,:)]);
    else
       cheapestItem = items(1,:);
    end          
end
end