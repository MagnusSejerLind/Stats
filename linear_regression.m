clc, clear variables, close all;

load("cordata.mat");

% Divide data up into test restricted by pillar width
test_3d = exp(:,1:15);
test_d1 = exp(:,16:60);
test_d2 = exp(:,61:105);


%plot(test_3d(14).data(:,3),test_3d(14).data(:,1))%

extension_vec = linspace(0,1,100000);
 
%Normalization of paramaters

b = 15; % Specimen depth
w = 45; % Specimen width
a = 22; % Crack length at onset
L = w-a; %length of the materials

%% Variation in t
t = [1 2 4];
s = 1;
d = 1;

t_max = max(t);

unit = s + d;
n_unit = L/unit;

M_area_t = t_max*L-floor(n_unit)*s*t;

t_2v = M_area_t(1)/M_area_t(2);
t_4v = M_area_t(1)/M_area_t(3);


%% Variation in s
s = [1 2 4];
t = 1;
d = 1;

s_max = max(s);

unit = s + d;
n_unit = L./unit;

M_area_s = t*L-floor(n_unit).*s.*t;

s_2v = M_area_s(1)/M_area_s(2);
s_4v = M_area_s(1)/M_area_s(3);

%% Variation in d
d = [1 2];
t = 1;
s = 1;

unit = s + d;
n_unit = L./unit;

M_area_d = t*L-floor(n_unit)*s*t;

d_2v = M_area_d(2)/M_area_d(1);


% Save norm coeffcients
save('norm_cof','d_2v',"s_2v","s_4v","t_2v","t_4v")

%% 3d linear regression comparison
for i = 1:5
    load = test_3d(i).data(:,1);
    extension = test_3d(i).data(:,3);

    [M,I] = max(load);

    y = load(I-30:I-5);
    x = extension(I-30:I-5);
    

    % Store linear regression coefficients
    alpha_test1(i,[1 2]) = polyfit(x,y,1);

end

% Determine the mean linear regression of the 5 identical tests:
mean_linereg1a = mean(alpha_test1(:,1));
mean_linereg1b = mean(alpha_test1(:,2));


for i = 6:10
    load = test_3d(i).data(:,1);
    extension = test_3d(i).data(:,3);

    [M,I] = max(load);

    y = load(I-30:I-5);
    x = extension(I-30:I-5);
    

    % Store linear regression coefficients
    alpha_test1(i-5,[1 2]) = polyfit(x,y,1);

end

% Determine the mean linear regression of the 5 identical tests:
mean_linereg2a = mean(alpha_test1(:,1))*t_2v;
mean_linereg2b = mean(alpha_test1(:,2));

for i = 11:15
    load = test_3d(i).data(:,1);
    extension = test_3d(i).data(:,3);

    [M,I] = max(load);

    y = load(I-30:I-5);
    x = extension(I-30:I-5);
    

    % Store linear regression coefficients
    alpha_test1(i-10,[1 2]) = polyfit(x,y,1);

end

% Determine the mean linear regression of the 5 identical tests:
mean_linereg3a = mean(alpha_test1(:,1))*t_4v;
mean_linereg3b = mean(alpha_test1(:,2));

% Plot the mean linear regressions for the tests of varying height
plot(extension_vec,mean_linereg1a*extension_vec+mean_linereg1b)
hold on
plot(extension_vec,mean_linereg2a*extension_vec+mean_linereg2b)
plot(extension_vec,mean_linereg3a*extension_vec+mean_linereg3b)
hold off
grid on
title('3D linear regression of the elastic region','Varying pillar height | d=1 [mm] s=1 [mm]')
legend('t = 1[mm] | k = 527.76[N/mm]','t = 2[mm] | k = 486.90[N/mm]','t = 4[mm] | k = 677.36[N/mm]',Location='southeast')
xlabel('Extension [mm]')
ylabel('Load [N]')

%% Test d1 linear regression comparison - Varying height - Spacing = 1
for i = 1:5
    load = test_d1(i).data(:,1);
    extension = test_d1(i).data(:,3);

    [M,I] = max(load);

    y = load(I-30:I-5);
    x = extension(I-30:I-5);
    

    % Store linear regression coefficients
    alpha_test1(i,[1 2]) = polyfit(x,y,1);

end

% Determine the mean linear regression of the 5 identical tests:
mean_linereg1a = mean(alpha_test1(:,1));
mean_linereg1b = mean(alpha_test1(:,2));

for i = 6:10
    load = test_d1(i).data(:,1);
    extension = test_d1(i).data(:,3);

    [M,I] = max(load);

    y = load(I-30:I-5);
    x = extension(I-30:I-5);
    

    % Store linear regression coefficients
    alpha_test1(i-5,[1 2]) = polyfit(x,y,1);

end

% Determine the mean linear regression of the 5 identical tests:
mean_linereg2a = mean(alpha_test1(:,1))*t_2v;
mean_linereg2b = mean(alpha_test1(:,2));

for i = 11:15
    load = test_d1(i).data(:,1);
    extension = test_d1(i).data(:,3);

    [M,I] = max(load);

    y = load(I-30:I-5);
    x = extension(I-30:I-5);
    

    % Store linear regression coefficients
    alpha_test1(i-10,[1 2]) = polyfit(x,y,1);

end

% Determine the mean linear regression of the 5 identical tests:
mean_linereg3a = mean(alpha_test1(:,1))*t_4v;
mean_linereg3b = mean(alpha_test1(:,2));

% Plot the mean linear regressions for the tests of varying height
plot(extension_vec,mean_linereg1a*extension_vec+mean_linereg1b)
hold on
plot(extension_vec,mean_linereg2a*extension_vec+mean_linereg2b)
plot(extension_vec,mean_linereg3a*extension_vec+mean_linereg3b)
hold off
grid on
title('2D linear regression of the elastic region with fixed spacing','Varying pillar height | d=1 [mm] s=1 [mm]')
legend('t = 1[mm] | k = 643.29[N/mm]','t = 2[mm] | k = 559.44[N/mm]','t = 4[mm] | k = 425.06[N/mm]',Location='southeast')
xlabel('Extension [mm]')
ylabel('Load [N]')

%% Test d1 linear regression comparison - Varying height - Spacing = 2
for i = 16:20
    load = test_d1(i).data(:,1);
    extension = test_d1(i).data(:,3);

    [M,I] = max(load);

    y = load(I-30:I-5);
    x = extension(I-30:I-5);
    

    % Store linear regression coefficients
    alpha_test1(i-15,[1 2]) = polyfit(x,y,1);

end

% Determine the mean linear regression of the 5 identical tests:
mean_linereg1a = mean(alpha_test1(:,1));
mean_linereg1b = mean(alpha_test1(:,2));

for i = 21:25
    load = test_d1(i).data(:,1);
    extension = test_d1(i).data(:,3);

    [M,I] = max(load);

    y = load(I-30:I-5);
    x = extension(I-30:I-5);
    

    % Store linear regression coefficients
    alpha_test1(i-20,[1 2]) = polyfit(x,y,1);

end

% Determine the mean linear regression of the 5 identical tests:
mean_linereg2a = mean(alpha_test1(:,1))*t_2v;
mean_linereg2b = mean(alpha_test1(:,2));

for i = 26:30
    load = test_d1(i).data(:,1);
    extension = test_d1(i).data(:,3);

    [M,I] = max(load);

    y = load(I-30:I-5);
    x = extension(I-30:I-5);
    

    % Store linear regression coefficients
    alpha_test1(i-25,[1 2]) = polyfit(x,y,1);

end

% Determine the mean linear regression of the 5 identical tests:
mean_linereg3a = mean(alpha_test1(:,1))*t_2v;
mean_linereg3b = mean(alpha_test1(:,2));

% Plot the mean linear regressions for the tests of varying height
plot(extension_vec,mean_linereg1a*extension_vec+mean_linereg1b)
hold on
plot(extension_vec,mean_linereg2a*extension_vec+mean_linereg2b)
plot(extension_vec,mean_linereg3a*extension_vec+mean_linereg3b)
hold off
grid on
title('2D linear regression of the elastic region','Varying pillar height | d=1 [mm] s=2 [mm]')
legend('t = 1[mm] | k = 266.3[N/mm]','t = 2[mm] | k = 315.1[N/mm]','t = 4[mm] | k = 187.02[N/mm]',Location='southeast')
xlabel('Extension [mm]')
ylabel('Load [N]')

%% Test d1 linear regression comparison - Varying height - Spacing = 4
for i = 31:35
    load = test_d1(i).data(:,1);
    extension = test_d1(i).data(:,3);

    [M,I] = max(load);

    y = load(I-30:I-5);
    x = extension(I-30:I-5);
    

    % Store linear regression coefficients
    alpha_test1(i-30,[1 2]) = polyfit(x,y,1);

end

% Determine the mean linear regression of the 5 identical tests:
mean_linereg1a = mean(alpha_test1(:,1))*t_2v;
mean_linereg1b = mean(alpha_test1(:,2));

for i = 36:40
    load = test_d1(i).data(:,1);
    extension = test_d1(i).data(:,3);

    [M,I] = max(load);

    y = load(I-30:I-5);
    x = extension(I-30:I-5);
    

    % Store linear regression coefficients
    alpha_test1(i-35,[1 2]) = polyfit(x,y,1);

end

% Determine the mean linear regression of the 5 identical tests:
mean_linereg2a = mean(alpha_test1(:,1))*t_4v;
mean_linereg2b = mean(alpha_test1(:,2));

for i = 41:45
    load = test_d1(i).data(:,1);
    extension = test_d1(i).data(:,3);

    [M,I] = max(load);

    y = load(I-30:I-5);
    x = extension(I-30:I-5);
    

    % Store linear regression coefficients
    alpha_test1(i-40,[1 2]) = polyfit(x,y,1);

end

% Determine the mean linear regression of the 5 identical tests:
mean_linereg3a = mean(alpha_test1(:,1));
mean_linereg3b = mean(alpha_test1(:,2));

% Plot the mean linear regressions for the tests of varying height
plot(extension_vec,mean_linereg1a*extension_vec+mean_linereg1b)
hold on
plot(extension_vec,mean_linereg2a*extension_vec+mean_linereg2b)
plot(extension_vec,mean_linereg3a*extension_vec+mean_linereg3b)
hold off
grid on
title('2D linear regression of the elastic region with fixed spacing','Varying pillar height | d=1 [mm] s=4 [mm]')
legend('t = 1[mm] | k = 112.42[N/mm]','t = 2[mm] | k = 112.57[N/mm]','t = 4[mm] | k = 104.41[N/mm]',Location='southeast')
xlabel('Extension [mm]')
ylabel('Load [N]')

%% Test d1 linear regression comparison - Varying spacing
for i = 1:5
    load = test_d1(i).data(:,1);
    extension = test_d1(i).data(:,3);

    [M,I] = max(load);

    y = load(I-30:I-5);
    x = extension(I-30:I-5);
    

    % Store linear regression coefficients
    alpha_test1(i,[1 2]) = polyfit(x,y,1);

end

% Determine the mean linear regression of the 5 identical tests:
mean_linereg1a = mean(alpha_test1(:,1));
mean_linereg1b = mean(alpha_test1(:,2));

for i = 16:20
    load = test_d1(i).data(:,1);
    extension = test_d1(i).data(:,3);

    [M,I] = max(load);

    y = load(I-30:I-5);
    x = extension(I-30:I-5);
    

    % Store linear regression coefficients
    alpha_test1(i-15,[1 2]) = polyfit(x,y,1);

end

% Determine the mean linear regression of the 5 identical tests:
mean_linereg2a = mean(alpha_test1(:,1))*s_2v;
mean_linereg2b = mean(alpha_test1(:,2));

for i = 31:35
    load = test_d1(i).data(:,1);
    extension = test_d1(i).data(:,3);

    [M,I] = max(load);

    y = load(I-30:I-5);
    x = extension(I-30:I-5);
    

    % Store linear regression coefficients
    alpha_test1(i-30,[1 2]) = polyfit(x,y,1);

end

% Determine the mean linear regression of the 5 identical tests:
mean_linereg3a = mean(alpha_test1(:,1))*s_4v;
mean_linereg3b = mean(alpha_test1(:,2));

% Plot the mean linear regressions for the tests of varying height
plot(extension_vec,mean_linereg1a*extension_vec+mean_linereg1b)
hold on
plot(extension_vec,mean_linereg2a*extension_vec+mean_linereg2b)
plot(extension_vec,mean_linereg3a*extension_vec+mean_linereg3b)
hold off
grid on
title('2D linear regression of the elastic region','Varying pillar spacing | d=1 [mm] t=1 [mm]')
legend('s = 1[mm] | k = 326.86[N/mm]','s = 2[mm] | k = 266.29[N/mm]','s = 4[mm] | k = 179.52[N/mm]',Location='southeast')
xlabel('Extension [mm]')
ylabel('Load [N]')

%% Test linear regression comparison - Varying pillar width
for i = 1:5
    load = test_d1(i).data(:,1);
    extension = test_d1(i).data(:,3);

    [M,I] = max(load);

    y = load(I-30:I-5);
    x = extension(I-30:I-5);
    

    % Store linear regression coefficients
    alpha_test1(i,[1 2]) = polyfit(x,y,1);

end

% Determine the mean linear regression of the 5 identical tests:
mean_linereg1a = mean(alpha_test1(:,1))*d_2v;
mean_linereg1b = mean(alpha_test1(:,2));

for i = 1:5
    load = test_d2(i).data(:,1);
    extension = test_d2(i).data(:,3);

    [M,I] = max(load);

    y = load(I-30:I-5);
    x = extension(I-30:I-5);
    

    % Store linear regression coefficients
    alpha_test1(i,[1 2]) = polyfit(x,y,1);

end

% Determine the mean linear regression of the 5 identical tests:
mean_linereg2a = mean(alpha_test1(:,1));
mean_linereg2b = mean(alpha_test1(:,2));


% Plot the mean linear regressions for the tests of varying height
plot(extension_vec,mean_linereg1a*extension_vec+mean_linereg1b)
hold on
plot(extension_vec,mean_linereg2a*extension_vec+mean_linereg2b)
hold off
grid on
title('2D linear regression of the elastic region','Varying pillar spacing | d=1 [mm] t=1 [mm]')
legend('s = 1[mm] | k = 326.86[N/mm]','s = 2[mm] | k = 266.29[N/mm]',Location='southeast')
xlabel('Extension [mm]')
ylabel('Load [N]')