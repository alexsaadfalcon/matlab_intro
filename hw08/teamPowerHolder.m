function [leader] = teamPowerHolder(email)
%reveals who the leader of a group is - a fairly useful program actually
%"When I die I want my project team members to lower my casket into the grave"
%"So they can let me down one last time."
fh = fopen(email, 'r');
keepGoing = true;
i = 1;
current = '';
while keepGoing
    line{i} = fgetl(fh);
    if any(ismember(line{i},':'))
        current = strtok(line{i},':');
    end
    if ~isempty(strfind(lower(line{i}),'do you want'))
        leader = current;   
        keepGoing = false;
    end
end
end

