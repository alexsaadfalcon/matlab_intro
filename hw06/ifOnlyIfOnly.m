function [ out1, out2 ] = ifOnlyIfOnly(in1, in2)
%Some weird function that does ambiguous things
if isnumeric(in1);
    out1 = in1 / sum(sum(in2));
    out2 = in2.*in1;
elseif islogical(in1);
    out1 = ~in1;
    if isnumeric(in2);
        out2 = mod(in2,2) == 0;
    else
        if mod(str2num(in2),2) == 0;
            out2 = 'True';
        else
            out2 = 'False';
        end
    end
elseif ischar(in1);
   if length(in1) > length(in2);
       in1 = in1(1:length(in2));
       out2 = false;
       out1 = [in1 ' ' in2];
   elseif length(in2) > length(in1);
       in2 = in2(1:length(in1));
       out2 = false;
       out1 = [in1 ' ' in2];
   else
       out2 = true;
       out1 = [in1 ' ' in2];
   end
end
end

