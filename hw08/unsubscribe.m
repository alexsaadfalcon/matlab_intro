function [] = unsubscribe(list, unsus)
                        %list of emails, list to unsubscribe
%unsubscribes people from unsus from the email list list
%creates the names of the files first
index = strfind(list, 'Mailing List');
name = list(1:index-2);
fh1 = fopen(list, 'r');
fh2 = fopen(unsus, 'r');
filew1 = fopen([name ' Mailing List_updated.txt'], 'w'); %file to write updated list to
filew2 = fopen(['Unsubscribe from ' name '_messages.txt'], 'w'); %file to write unsubscribe messages to
%next turns list into a cell array
keepGoing1 = true;
keepGoing2 = true;
i = 1; %counter
while keepGoing1 || keepGoing2
    line1 = fgetl(fh1);
    line2 = fgetl(fh2);
    if ischar(line1) && ~isempty(line1)
        line1(line1 == ';') = '';
        line1(line1 == ',') = '';
        line1 = strtrim(line1);
        emails{i} = lower(line1); %cell array of emails in list before unsubscription
    else
        keepGoing1 = false;
    end
    if ischar(line2) && ~isempty(line2)
        line2(line2 == ';') = '';
        line2(line2 == ',') = '';
        line2 = strtrim(line2);
        unsubscribers{i} = lower(line2); %cell array of unsubscribers
    else
        keepGoing2 = false;
    end
    i = i + 1;
end
for j = 1:length(unsubscribers)
    index = find(unsubscribers{j} == ' ') + 1; %first letter of last name
    unsuscheck{j} = [unsubscribers{j}(1) unsubscribers{j}(index:end)]; %first letter of first name and last name
end
for k = 1:length(unsuscheck)
    for l = 1:length(emails)
        if l <= length(emails)
        if length(emails{l}) >= length(unsuscheck{k})
            if strcmpi(unsuscheck{k},emails{l}(1:length(unsuscheck{k}))) %checks if the person to unsubscribe is at index of emails l
                emails(l) = [];
            end
        end
        end
    end
end
for m = 1:length(emails)
    x = fprintf(filew1, '%s', [emails{m} '\n']);
end
for n = 1:length(unsubscribers)
    index = find(unsubscribers{n} == ' '); %last index of first name
    lineEnter = unsubscribers{n}(1:index);
    lineEnter(1) = upper(lineEnter(1));
    lineEnter = [lineEnter ', you have been unsubscribed from the ' name ' mailing list.'];
    x = fprintf(filew2, '%s', [lineEnter '\n']);
end
fclose(fh1);
fclose(fh2);
fclose(filew1);
fclose(filew2);
end

