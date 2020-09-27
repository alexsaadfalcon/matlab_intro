function [ ] = findOutliers(file)
[num txt raw] = xlsread(file);
raw{1,3} = 'Outliers';
high = prctile(num(1:end,2),75);
low = prctile(num(1:end,2),25);
diff = 1.5 * iqr(num(1:end,2));
[rows cols] = size(raw);
for r = 2:rows
    if raw{r,2} > high + diff || raw{r,2} < low - diff
        raw{r,3} = raw{r,2};
    end
end
for r = 2:rows
    if isempty(raw{r,3})
        raw{r,3} = nan;
    end
end
name = [file(1:end-4) 'Outliers.xls'];
xlswrite(name,raw);
end

