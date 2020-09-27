function [ high low ] = avgTemp( ca )
highSum = 0;
lowSum = 0;
highC = 0;
lowC = 0;
for i = 1:length(ca)
    if strcmp(ca{i,1},'High')
        highSum = highSum + ca{i,2};
        highC = highC + 1;
    elseif strcmp(ca{i,1},'Low')
        lowSum = lowSum + ca{i,2};
        lowC = lowC + 1;
    end
end
high = round(highSum / highC);
low = round(lowSum / lowC);
end

