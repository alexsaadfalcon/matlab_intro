function [ ] = extrapCalc( x,y,col,bound )
%plots the things, gets the points
l = length(x);
for s = 1:3
    subplot(3,1,s);
    hold on;
    axis(bound);
    xlabel('x values');
    ylabel('y values');
    if s == 1
        title('Interp1: Linear');
    elseif s == 2
        title('Interp1: Cubic');
    elseif s == 3
        title('Spline');
    end
    for i = 1:5
        color = col(i);
        xs = x(1:i*l/5);
        ys = y(1:i*l/5);
        if s == 1
            yy = interp1(xs, ys, x, 'linear', 'extrap');
            plot(x,yy,color);
        elseif s == 2
            yy = interp1(xs, ys, x, 'cubic', 'extrap');
            plot(x,yy,color);
        elseif s == 3
            yy = spline(xs,ys,x);
            plot(x,yy,color);
        end
    end
end
end

