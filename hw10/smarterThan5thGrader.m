function [ report ] = smarterThan5thGrader(Qs, player, fifths)
%Just like the game "Are you smarter than a 5th grader?"
winCondition = true;
fifthGradersUsed = {};
correct = 0;
forgives = 0;
winnings = 0;
report.Name = player.Name;
report.Gender = player.Gender;
report.Education = player.Education;
for i = 1:10
    if strcmpi(player.Answers{i},'Ask a 5th Grader')
        if length(fifthGradersUsed) < 2
            if strcmpi(fifths(i).Answer,Qs(i).Answer)
                winnings = winnings + Qs(i).Value;
                correct = correct + 1;
                if length(fifthGradersUsed) == 0
                    fifthGradersUsed = {fifths(i).Name};
                else
                    fifthGradersUsed = {fifthGradersUsed{1} fifths(i).Name};
                end
            elseif ~strcmpi(fifths(i).Answer,Qs(i).Answer) && forgives == 0
                forgives = forgives + 1;
                winnings = winnings + Qs(i).Value;
                correct = correct + 1;
                if length(fifthGradersUsed) == 0
                    fifthGradersUsed = {fifths(i).Name};
                else
                    fifthGradersUsed = {fifthGradersUsed{1} fifths(i).Name};
                end
            elseif ~strcmpi(fifths(i).Answer,Qs(i).Answer) && forgives > 0
                winCondition = false;                
                fifthGradersUsed = {fifthGradersUsed{1} fifths(i).Name};
                break;
            end
        else
            winCondition = false;
            break;
        end
    elseif strcmpi(player.Answers{i},Qs(i).Answer)
        winnings = winnings + Qs(i).Value;
        correct = correct + 1;
    else
        winCondition = false;
        break;
    end
end
if strcmpi(player.Answers{11},Qs(11).Answer)
    winnings = winnings + Qs(11).Value;
    correct = correct + 1;
else
    winCondition = false;
end
report.NumberQuestionsAnswered = correct;
report.Winnings = winnings;
report.FifthGradersUsed = fifthGradersUsed;
end

