function [ shifted ] = barrelShiftArray( arr,num )
%Shifts an array arr a number of times forward num and outputs shifted
shifted = reshape([arr(end-num+1:end) arr(1:end-num)],size(arr));
%reshapes an array of the shifted values to an array the size of arr
%the first part of the array inserted is the entries from the end
%shifted to the front. The second part is the entries from the front
%to the start of the end entries that were already shifted up


end

