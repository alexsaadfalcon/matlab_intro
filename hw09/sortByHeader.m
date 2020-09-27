function [ ca ] = sortByHeader(file,header)
[num txt raw] = xlsread(file);
headIndex = strcmp(raw,header); %find array of where header is in raw
indices = headIndex == 1
[row,col] = find(indices); %find indices of header in raw
firstRow = raw(1,:); 
raw(1,:) = []; 
rest = sortrows(raw,col); %sorts rows by the values in column col
ca = [firstRow; rest];

end

