function [ indices ] = myFind( mask )
%returns vector of indices where mask is true
indices = [];
[A B] = size(mask);
for i = 1:A*B; %goes through mask
    if mask(i); %if mask is true
        indices = [indices i]; %adds index of true to indices
    end
end
end

