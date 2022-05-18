clc,clear

% Load current directory
datastruct = dir;

% Convert to table
datatable = struct2table(datastruct);



for i = 3:107

curdatname = datatable(i,1); % Current data name

a(i-2) = table2cell(curdatname); % Convert to cell

curfilename = char(a(i-2));     % Convert to string

data(i-2) = importdata(curfilename); % import data



end


data(4).name = []  % Name column


% Insert file name in name column
for i = 3:107

curdatname = datatable(i,1); % Data name

a(i-2) = table2cell(curdatname); % Convert to cell


    data(i-2).name = a(i-2) % Insert into data struct
    
end
clearvars curfilename curdatname



% for i = 1:105
    
% Data =   struct2table(data)

% end



% Save data
save('expdata.mat','data')





