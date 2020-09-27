function [winner] = blackjack( card, strat )
            %string of winner  %rand int that is card seed for dealer.p
                                     %strategy array variable from file
%A simulation function for the card game blackjack. Easy enough
[dealerCard(1) player] = dealer('start',card);
if sum(player) == 21
    winner = 'Blackjack!';
elseif sum(player) >= 17
    [dealerCard empty] = dealer('stay',card); %empty is a dummy variable
    if sum(dealerCard) > 21 || sum(dealerCard) < sum(player)
        winner = 'The player wins!';
    else
        winner = 'The dealer wins :(';
    end
elseif sum(player) >= 13
    if strat(2,dealerCard(1)) == 1
        while sum(player) < 17 
            [empty newCard] = dealer('hit',card); %empty is a dummy variable
            player = [player newCard];
        end
        if sum(player) > 21
            winner = 'The dealer wins :(';
        elseif sum(dealerCard) > 21 || sum(dealerCard) < sum(player)
        winner = 'The player wins!';
        else
        winner = 'The dealer wins :(';
        end
    elseif strat(2,dealerCard(1)) == 0
        [dealerCard empty] = dealer('stay',card); %empty is a dummy variable
        if sum(dealerCard) > 21 || sum(dealerCard) < sum(player)
            winner = 'The player wins!';
        else
            winner = 'The dealer wins :(';
        end
    end
elseif sum(player) == 12
    if strat(3,dealerCard(1)) == 1
        while sum(player) < 17 && strat(2,dealerCard) == 1
            [empty newCard] = dealer('hit',card); %empty is a dummy variable
            player = [player newCard]; 
        end
        if sum(player) > 21
            winner = 'The dealer wins :(';
        elseif sum(dealerCard) > 21 || sum(dealerCard) < sum(player)
        winner = 'The player wins!';
        else
        winner = 'The dealer wins :(';
        end
    elseif strat(3,dealerCard(1)) == 0
        [dealerCard empty] = dealer('stay',card); %empty is a dummy variable
        if sum(dealerCard) > 21 || sum(dealerCard) < sum(player)
            winner = 'The player wins!';
        else
            winner = 'The dealer wins :(';
        end
    end
elseif sum(player) >= 0 
    trueCondition = true;
    while sum(player) < 17 && trueCondition
        [empty newCard] = dealer('hit',card); %empty is a dummy variable
         player = [player newCard]; 
         if sum(player) == 12
             trueCondition = strat(3,dealerCard(1)) == 1
         elseif sum(player) <= 16 && sum(player) >= 13
             trueCondition = strat(2,dealerCard(1)) == 1
         end
    end
    if sum(player) > 21
        winner = 'The dealer wins :(';
    elseif sum(dealerCard) > 21 || sum(dealerCard) < sum(player)
        winner = 'The player wins!';
    else
        winner = 'The dealer wins :(';
    end
end
    
end

