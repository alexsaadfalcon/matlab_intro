function [cand time] = CFRecruiter(names, GPA, talk)
%takes in students' names, GPAs, and whether they stay to talk and outputs
%possible
rest = names;
cand = '';
time = 0;
for i = 1:length(GPA)
    [name rest] = strtok(rest, ',');
    if talk(i) && GPA(i)>2.5
        if ~isstrprop(name(1),'alpha')
            name(1) = '';
        end
        if ~isstrprop(name(end),'alpha')
            name(end) = '';
        end
        if time == 0
            cand = [cand name];
        else
            cand = [cand ', ' name];
        end
        time = time + (GPA(i)-2.5) * 4;
    end
end

end

