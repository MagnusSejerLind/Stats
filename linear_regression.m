clc,clear

% Load current directory
datastruct = dir;

% Convert to table
datatable = struct2table(datastruct);



for i = 3:107

curdatname = datatable(i,1); % Data name

a(i-2) = table2cell(curdatname); % Convert to cell

curfilename = char(a(i-2));     % Convert to string

data(i-2) = importdata(curfilename); % import data


end


data(4).name = [];  % Name column


% Insert file name in name column
for i = 3:107

curdatname = datatable(i,1); % Data name

a(i-2) = table2cell(curdatname); % Convert to cell


    data(i-2).name = a(i-2); % Insert into data struct
    
end
clearvars curfilename curdatname

% Save data
save('expdata.mat','data')


% Divide data up into test restricted by pillar width
test_3d = data(:,1:15);
test_d1 = data(:,16:60);
test_d2 = data(:,61:105);


%plot(test_3d(14).data(:,3),test_3d(14).data(:,1))

extension_vec = linspace(0,1,100000);

%% 3d linear regression comparison
for i = 1:5
    load = test_3d(i).data(:,1);
    extension = test_3d(i).data(:,3);

    [M,I] = max(load);

    y = load(1:I-20);
    x = extension(1:I-20);
    

    % Store linear regression coefficients
    alpha_test1(i,[1 2]) = polyfit(x,y,1);

end

mean_linereg1a = mean(alpha_test1(:,1));
mean_linereg1b = mean(alpha_test1(:,2));


for i = 6:10
    load = test_3d(i).data(:,1);
    extension = test_3d(i).data(:,3);

    [M,I] = max(load);

    y = load(1:I-20);
    x = extension(1:I-20);
    

    % Store linear regression coefficients
    alpha_test1(i-5,[1 2]) = polyfit(x,y,1);

end

mean_linereg2a = mean(alpha_test1(:,1));
mean_linereg2b = mean(alpha_test1(:,2));

for i = 11:15
    load = test_3d(i).data(:,1);
    extension = test_3d(i).data(:,3);

    [M,I] = max(load);

    y = load(1:I-20);
    x = extension(1:I-20);
    

    % Store linear regression coefficients
    alpha_test1(i-10,[1 2]) = polyfit(x,y,1);

end

mean_linereg3a = mean(alpha_test1(:,1));
mean_linereg3b = mean(alpha_test1(:,2));


plot(extension_vec,mean_linereg1a*extension_vec+mean_linereg1b)
hold on
plot(extension_vec,mean_linereg2a*extension_vec+mean_linereg2b)
plot(extension_vec,mean_linereg3a*extension_vec+mean_linereg3b)
hold off
grid on
legend('t = 1','t = 2','t = 4',Location='best')

%% Test d1 linear regression comparison - Varying height
for i = 1:5
    load = test_d1(i).data(:,1);
    extension = test_d1(i).data(:,3);

    [M,I] = max(load);

    y = load(1:I-20);
    x = extension(1:I-20);
    

    % Store linear regression coefficients
    alpha_test1(i,[1 2]) = polyfit(x,y,1);

end

mean_linereg1a = mean(alpha_test1(:,1));
mean_linereg1b = mean(alpha_test1(:,2));

for i = 6:10
    load = test_d1(i).data(:,1);
    extension = test_d1(i).data(:,3);

    [M,I] = max(load);

    y = load(1:I-20);
    x = extension(1:I-20);
    

    % Store linear regression coefficients
    alpha_test1(i-5,[1 2]) = polyfit(x,y,1);

end

mean_linereg2a = mean(alpha_test1(:,1));
mean_linereg2b = mean(alpha_test1(:,2));

for i = 11:15
    load = test_d1(i).data(:,1);
    extension = test_d1(i).data(:,3);

    [M,I] = max(load);

    y = load(1:I-20);
    x = extension(1:I-20);
    

    % Store linear regression coefficients
    alpha_test1(i-10,[1 2]) = polyfit(x,y,1);

end

mean_linereg3a = mean(alpha_test1(:,1));
mean_linereg3b = mean(alpha_test1(:,2));

plot(extension_vec,mean_linereg1a*extension_vec+mean_linereg1b)
hold on
plot(extension_vec,mean_linereg2a*extension_vec+mean_linereg2b)
plot(extension_vec,mean_linereg3a*extension_vec+mean_linereg3b)
hold off
grid on
legend('t = 1','t = 2','t = 4',Location='best')
