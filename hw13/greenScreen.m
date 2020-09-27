function [] = greenScreen(img1n,img2n,col)
%lol greenscreen
img1 = imread(img1n);
img2 = imread(img2n);
[r c ~] = size(img1);
mask = img1(:,:,1) == col(1) & img1(:,:,2) == col(2) & img1(:,:,3) == col(3);
for i = 1:r
    for j = 1:c
        if mask(i,j)
            img1(i,j,:) = img2(i,j,:);
        end
    end
end
imwrite(img1,[img1n(1:end-4) '_new.png']);
end