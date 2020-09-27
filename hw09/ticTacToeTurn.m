function [ out ] = ticTacToeTurn(board,turn)
%describes all possible moves for the next move in tic-tac-toe and the 
%outcome ove each move
rows = [];
cols = [];
for c = 1:3
    for r = 1:3
        if board{r,c} == ' ';
            rows = [rows r];
            cols = [cols c];
        end
    end
end
for i = 1:length(rows)
    temp = board;
    temp{rows(i),cols(i)} = turn;
    for r = 1:3
        for c = 1:3
            input(r,c) = temp{r,c};
        end
    end
    out{1,i} = temp;
    out{2,i} = moveEvaluator(input,turn);
end


end

