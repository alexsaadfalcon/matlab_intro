img = imread('green_apple.png');
mask = img(:,:,2) == 255 && img(:,:,1) ~= 255  && img(:,:,3) == 255;
img1 = img(:,:,1);
img2 = img(:,:,2);
img1(mask) = 255;
img2(mask) = 0;
img(:,:,1) = img1;
img(:,:,2) = img2;