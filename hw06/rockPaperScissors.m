function [ winner ] = rockPaperScissors( move1, move2 )
%A simple game of rock paper scissors. returns the winner
move1 = lower(move1);
move2 = lower(move2);
first = '';
second = '';
rest1 = move1;
rest2 = move2;
win = [0 0 0];
for i = 1:3 
    [first, rest1] = strtok(rest1, ', ');
    [second, rest2] = strtok(rest2, ', ');
    switch first
        case 'scissors'
            if strcmp(second, 'rock')
                win(i) = 0; 
            elseif strcmp(second, 'paper')
                win(i) = 1;
            else
                win(i) = .5;
            end
        case 'rock'
            if strcmp(second, 'paper')
                win(i) = 0; 
            elseif strcmp(second, 'scissors')
                win(i) = 1;
            else
                win(i) = .5;
            end
        case 'paper'
            if strcmp(second, 'scissors')
                win(i) = 0; 
            elseif strcmp(second, 'rock')
                win(i) = 1;
            else
                win(i) = .5;
            end
    end
end
if sum(win) > 1.5
    winner = 'Player 1 wins!';
elseif sum(win) < 1.5
    winner = 'Player 2 wins!';
else
    winner = 'Keep Playing!';
end
end

