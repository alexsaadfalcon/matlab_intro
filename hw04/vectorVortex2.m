
function [ vortex ] = vectorVortex2( row, col, vec )

vortex = zeros(row,col);
vortex(1,1:col) = vec(1:col);
vortex(2:row, col) = vec(col + 1:col + row - 1);
vortex(row, col - 1:-1:1) = vec(col + row:2*col + row - 2);
vortex(row - 1:-1:2, 1) = vec(2*col + row - 1:2*col + 2*row - 4);
vortex(3,3:col - 2) = vec(2*col + 2*row - 3 : 3*col + 2*row - 8);
vortex(3:row - 2, col - 2) = vec(3*col + 2*row - 7:3*col + 3*row - 12);
vortex(row - 2, col - 2:-1:3) = vec(3*col + 3*row - 12:4*col + 3*row - 17);
vortex(row - 2:-1:3, 3) = 
end