function [ caesar ] = caesarWrapCase( str, int )
%encodes a string into caesar wrap case (???)
mask = isstrprop(str, 'alpha');
int = mod(int,52);
for i = 1:length(str);
    if mask(i);
        for j = 1:int;
            if str(i) == 'z';
                str(i) = 'A';
            elseif str(i) == 'Z';
                str(i) = 'a';
            else
                str(i) = char(str(i)+1);
            end
        end
    end
end
caesar = str;

end

