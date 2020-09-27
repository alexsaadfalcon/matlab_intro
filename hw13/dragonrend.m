function [] = dragonrend(imgn)
%SKYRIM
img = imread(imgn);
blue = img(2,2,:);
dragon = img(:,:,1) == 200 & img(:,:,2) == 200 & img(:,:,3) == 200;
[r c ~] = size(dragon);
for i = 1:r
    for j = 1:c
        if dragon(i,j)
            img(i,j,:) = blue;
        end
    end
end
imwrite(img,[imgn(1:end-4) '_dragonrended.png']);
end