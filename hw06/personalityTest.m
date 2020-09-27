function [ dom, rec, wing ] = personalityTest(your,types,sub)
%I'm not gonna be sure what this does till I write it, and I'm probably not
%gonna come back and change this after I finish it. This code will do
%something with personalities
recessive = false;
if lower(your(1)) == your(1)
   recessive = true; 
end
str = types;
rest = types;
yourType = 0;
typesCol = [];
for i = 1:10
    [type rest] = strtok(rest,' ');
    if strcmpi(your, type);
        yourType = i;
    end
    typesCol(i,1:length(type)) = type;
end
if recessive
    yourType = mod(yourType + 4, 10) + 1;
end
dom = typesCol(yourType,:);
lWing = mod(yourType,10) + 1;
rWing = mod(yourType - 2, 10) + 1;
recNum = mod(yourType + 4, 10) + 1;
rec = typesCol(recNum, :);
lWing = typesCol(lWing, :);
rWing = typesCol(rWing, :);
dom = char(dom);
rec = char(rec);
lWing = char(lWing);
rWing = char(rWing);
dom(~isstrprop(dom,'alpha')) = '';
lWing(~isstrprop(lWing,'alpha')) = '';
rWing(~isstrprop(rWing,'alpha')) = '';
rec(~isstrprop(rec,'alpha')) = '';
wing = [lWing, ' ', rWing];
dom = [dom '_' lower(sub(1))];
end

