function [ str ] = myStruct(ca)
%creates a structure str from cell array ca
str = [];
for i = 1:2:length(ca);
    if length(ca{i+1}) > 1       
        for j = 1:length(ca{i+1})
            str(j).(ca{i}) = ca{i+1}{j};
        end
    elseif length(ca{i+1}) == 1
        for j = 1:length(str)
            str(j).(ca{i}) = ca{i+1}{1};
        end
    end
end

end

