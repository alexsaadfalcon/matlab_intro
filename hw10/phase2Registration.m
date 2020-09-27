function [ new ] = phase2Registration(current, classes, regis)
add = classes{2,1};
drop = classes{2,2};
CRNs = [regis.CRN];
for i = 1:length(add)
    index = find(CRNs == add(i));
    current = [current regis(index)];
end
for i = 1:length(drop)
    currentCRNs = [current.CRN];
    index = find(currentCRNs == drop(i));
    current(index) = [];
end
new = current;

end

