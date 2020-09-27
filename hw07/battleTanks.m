function [winner, hits, destroyed] = battleTanks(p1, p2, battle)
%A complicated game involving tanks. Kind of like battleship, but totally
%predetermined
field(1:8,1:8,1) = p1;%two layers of array for players one and two
field(1:8,1:8,2) = p2;
hits1 = [];
hits2 = [];
destroyed = [];
hits = [];
winCondition = false;
rest = battle;
drawCondition = true;
counter = 1; 
while ~isempty(rest) %turns battle into a Nx2 Array of moves
    [move rest] = strtok(rest); 
    moves(counter, 1:2) = hitConversion(move);
    counter = counter + 1;
end
counter1 = 1; %player 1's moves counter, will stay on odd integers
counter2 = 2; %player 2's moves counter, will stay on even integers
while ~winCondition
    if counter1 <= length(moves);
        move1 = [moves(counter1,2) moves(counter1,1)];
        if field(move1(1), move1(2), 2) > 0 %checks move1 on player 2's side
            field(move1(1), move1(2), 2) = 0;
            hits1 = [hits1 p2(move1(1),move1(2))];
        end
    else
        winCondition = true;
    end
    if counter2 <= length(moves); 
        move2 = [moves(counter2,2) moves(counter2,1)];
        if field(move2(1), move2(2), 1) > 0 %checks move2 on player 1's side
            field(move2(1), move2(2), 1) = 0; 
            hits2 = [hits2 p2(move1(1),move1(2))];
        end
    else
        winCondition = true;
    end
    if sum(sum(field(:,:,1))) == 0
        winner = field(:,:,2);
        hits = hits2;
        hitLast = hits2(end:-1:1);
        while hitLast ~= []
            last = hitLast(1);
            destroyed = [last destroyed];
            hitLast(hitLast == last) = [];
        end
        winCondition = true;
        drawCondition = false;
    elseif sum(sum(field(:,:,2))) == 0
        winner = field(:,:,1);
        hits = hits1;
        hitLast = hits1(end:-1:1);
        while ~isempty(hitLast);
            last = hitLast(1);
            destroyed = [last destroyed];
            hitLast(hitLast == last) = [];
        end
        winCondition = true;
        drawCondition = false;
    end
    counter1 = counter1 + 2;
    counter2 = counter2 + 2;
end
if drawCondition && length(hits2) > length(hits1)
    winner = field(:,:,2);
    hits = hits2;
    hitLast = hits2(end:-1:1);
    while hitLast ~= []
        last = hitLast(1);
        destroyed = [last destroyed];
        hitLast(last) = [];
    end
elseif drawCondition && length(hits1) > length(hits2)
    winner = field(:,:,1);
    hits = hits1;
    hitLast = hits1(end:-1:1);
    while hitLast ~= []
        last = hitLast(1);
        destroyed = [last destroyed];
        hitLast(last) = [];
    end
elseif drawCondition
    winner = field(:,:,1);
    hits = field(:,:,2);
    destroyed = 'Cease fire!';
end
    

end

function [hit] = hitConversion(str)
letter = str(1);
hit(1) = upper(letter) - 'A' + 1;
hit(2) = str2num(str(2));
end