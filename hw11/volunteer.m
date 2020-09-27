function [ tribute ] = volunteer(names)
%Hunger games. I think I should just always return 'Katniss Everdeen'
if length(names) == 1
    tribute = names{1};
elseif names{1}(1) < names{2}(1)
    tribute = volunteer(names(2:end));
elseif names{1}(1) >= names{2}(1)
    if length(names) >= 3
        tribute = volunteer([names(1) names(3:end)]);
    else
        tribute = names{1};
    end          
end

end