function [ final ] = erosion( initial, rock, factor )
%Calculates erosion based on inital soil levels, bedrock, and an erosion
%factor
final = initial - factor; %subtracts erosion factor from each element of initial
final(final<rock) = rock(final<rock); %wherever erosion goes past the rock,
                                      %it raises output to the rock
end

