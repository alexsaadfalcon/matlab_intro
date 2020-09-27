function [out] = checkImage(img1n,img2n)
%so images. such checking. wow.

img1 = imread(img1n);
img2 = imread(img2n);
if size(size(img1)) == size(size(img2))
    if size(img1) == size(img2)
        if img1 == img2
            out = 'The images are the same.';
        else
            outim = img1(:,:,1) == img2(:,:,1) & img1(:,:,2) == img2(:,:,2) & img1(:,:,3) == img2(:,:,3);
            imwrite(outim,[img1n(1:end-4) '_vs_' img2n(1:end-4) '.png']);
            out = sprintf('The RGB values are different: see %s.', [img1n(1:end-4) '_vs_' img2n(1:end-4) '.png']);
        end
    else
        out = 'The images have different dimensions.';
    end
else
    out = 'The images have different dimensions.';
end
end