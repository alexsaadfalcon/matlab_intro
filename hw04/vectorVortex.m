function [ vortex ] = vectorVortex( row, col, vec )
%Creates a vortex consisting of two layers running clockwise in an
%arrsy, one on the outside and one on the inside, with a row of zeroes in
%between
counter = 1;
vortex = zeros(row, col);
%outer loop
for i = 1:col; % top of array
    vortex(1,i) = vec(counter); %increments counter each time it is used
    counter = counter + 1; %to go through vec sequentially
end
for i = 2:row; % right side of array
    vortex(i,col) = vec(counter);
    counter = counter + 1;
end
for i = col-1:-1:1; % bottom of array
    vortex(row,i) = vec(counter);
    counter = counter + 1;
end
for i = row-1:-1:2; % left side of array
    vortex(i,1) = vec(counter);
    counter = counter + 1;
end

%inner loop
for i = 3:col-2; % top of inner loop
    vortex(3,i) = vec(counter); %increments counter each time it is used
    counter = counter + 1; %to go through vec sequentially
end
for i = 4:row-2; % right side of inner loop
    vortex(i,col-2) = vec(counter);
    counter = counter + 1;
end
for i = col-3:-1:3; % bottom of inner loop
    vortex(row-2,i) = vec(counter);
    counter = counter + 1;
end
for i = row-3:-1:4; % left side of inner loop
    vortex(i,3) = vec(counter);
    counter = counter + 1;
end

end








