function [ totalCost ] = balloons( volume, radius, pricePer12Pack )
%Calculates the cost of filling a room of volume volume with balloons of
%radius and price per 12 balloons pricePer12Pack

numberOfBalloons = volume / ((4/3)*pi*radius^3); %finds the number of balloons needed
numberOfPacks = ceil(numberOfBalloons / 12); %finds number of packs of 12 balloons needed, rounded up
totalCost = numberOfPacks * pricePer12Pack * 1.08; %includes 8% sales tax

end

