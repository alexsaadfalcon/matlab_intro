function [imgOut] = colorSplash(file,color)
img = imread(file);
main = find(color~=0);
other1 = mod(main,3) + 1;
other2 = mod(main+1,3) + 1;
[r c ~] = size(img);
newOthers = zeros(r,c);
imgOut(:,:,other1) = newOthers;
imgOut(:,:,other2) = newOthers;
imgOut(:,:,main) = img(:,:,main);
end