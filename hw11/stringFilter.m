function [concat] = stringFilter(ca)
%Concatenates a cell array of possible cell arrays, doubles, strings, and
%logicals
concat = '';
if length(ca) >= 1
    first = ca{1};
if iscell(first)
    string = stringFilter(first);
    if length(ca) == 1
        concat = [concat string];
    else
        concat = [concat string stringFilter(ca(2:end))];
    end
elseif isnumeric(first) || islogical(first)
    if length(ca) == 1
    else
        concat = [concat stringFilter(ca(2:end))];
    end
elseif ischar(first)
    if length(ca) == 1
        concat = [concat first];
    else
        concat = [concat first stringFilter(ca(2:end))];
    end
end
else
    concat = '';
end
end

