function [ piecesForYou ] = birthdaycake( totalPieces, numberOfPeople )
%Distributes a cake with totalPieces slices between numberOfPeople people.
%The cake will get evenly distributed between everyone (everyone gets the 
%same number of pieces), so the output piecesForYou is how many pieces are
%left over for the host to eat

partyPieces = floor(totalPieces/numberOfPeople); %the pieces you get at the party, same as the other guests
leftovers = mod(totalPieces, numberOfPeople); %the number of pieces left over from the party
piecesForYou = partyPieces + leftovers;

end

