function [] = uniqueFit(x,y)
degree = length(x) - 1;
rows = ceil((degree)/2);
for i = 1:degree
    subplot(rows,2,i);
    title(sprintf('Order %d Fit',i));
    hold on;
    coeff = polyfit(x,y,i);
    lin = linspace(min(x),max(x),100);
    val = polyval(coeff,lin);
    plot(lin,val,'k');
    plot(x,y,'rx');
    axis square;
end
end

