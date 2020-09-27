function [] = image2ascii(imgn,str)
%my first idea for an HP final project actually
img = imread(imgn);
x = (img(:,:,1) + img(:,:,2) + img(:,:,3)) / 3;
img(:,:,1) = x;
img(:,:,2) = x;
img(:,:,3) = x;
[r c] = size(x);
out = '';
for i = 1:8:r
    for j = 1:4:c
        avg = mean(mean(img(i:i+7,j:j+3)));
        if avg<0
        elseif avg <= 31
            out = [out str(1)];
        elseif avg <= 63
            out = [out str(2)];
        elseif avg <= 95
            out = [out str(3)];
        elseif avg <= 127
            out = [out str(4)];
        elseif avg <= 159
            out = [out str(5)];
        elseif avg <= 191
            out = [out str(6)];
        elseif avg <= 223
            out = [out str(7)];
        elseif avg <= 255
            out = [out str(8)];
        end
    end
    out = [out '\n'];
end
fprintf(out,[imgn(1:end-4) '.txt']);
end