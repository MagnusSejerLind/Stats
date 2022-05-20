clc, clear, close all
% maximum force

load cordata.mat

% Five of each type of test

% d -> pillar width
% s -> pillar spacing
% t -> pillar height

% 3D tests with different heights of the pillar.
% All 3D test have d = 1 and s = 1
max_f_3Dt1 = zeros(); 
max_f_3Dt2 = zeros();
max_f_3Dt4 = zeros();

for i = 1:15

    if i <= 5

        max_f_3Dt1(i) = max(exp(i).data(:,1)); % max load

    elseif i >= 6 && i <= 10

        max_f_3Dt2(i-5) = max(exp(i).data(:,1)); % max load

    else

        max_f_3Dt4(i-10) = max(exp(i).data(:,1)); % max load

    end

end

% 2D tests with different heights of the pillar and different spacings
% between them

max_f_d1s1t1 = zeros();
max_f_d1s1t2 = zeros();
max_f_d1s1t4 = zeros();
max_f_d1s2t1 = zeros();
max_f_d1s2t2 = zeros();
max_f_d1s2t4 = zeros();
max_f_d1s4t1 = zeros();
max_f_d1s4t2 = zeros();
max_f_d1s4t4 = zeros();
max_f_d2s1t1 = zeros();
max_f_d2s1t2 = zeros();
max_f_d2s1t4 = zeros();
max_f_d2s2t1 = zeros();
max_f_d2s2t2 = zeros();
max_f_d2s2t4 = zeros();
max_f_d2s4t1 = zeros();
max_f_d2s4t2 = zeros();
max_f_d2s4t4 = zeros();

for i = 16:105

    if i <= 20

        max_f_d1s1t1(i-15) = max(exp(i).data(:,1)); % max load

    elseif i >= 21 && i <= 25

        max_f_d1s1t2(i-20) = max(exp(i).data(:,1)); % max load
    
    elseif i >= 26 && i <= 30

        max_f_d1s1t4(i-25) = max(exp(i).data(:,1)); % max load
    
    elseif i >= 31 && i <= 35

        max_f_d1s2t1(i-30) = max(exp(i).data(:,1)); % max load

    elseif i >= 36 && i <= 40

        max_f_d1s2t2(i-35) = max(exp(i).data(:,1)); % max load
 
    elseif i >= 41 && i <= 45

        max_f_d1s2t4(i-40) = max(exp(i).data(:,1)); % max load
 
    elseif i >= 46 && i <= 50

        max_f_d1s4t1(i-45) = max(exp(i).data(:,1)); % max load
    
    elseif i >= 51 && i <= 55

        max_f_d1s4t2(i-50) = max(exp(i).data(:,1)); % max load
 
    elseif i >= 56 && i <= 60

        max_f_d1s4t4(i-55) = max(exp(i).data(:,1)); % max load

    elseif i >= 61 && i <= 65

        max_f_d2s1t1(i-60) = max(exp(i).data(:,1)); % max load
    
    elseif i >= 66 && i <= 70

        max_f_d2s1t2(i-65) = max(exp(i).data(:,1)); % max load
    
    elseif i >= 71 && i <= 75

        max_f_d2s1t4(i-70) = max(exp(i).data(:,1)); % max load
    
    elseif i >= 76 && i <= 80

        max_f_d2s2t1(i-75) = max(exp(i).data(:,1)); % max load

    elseif i >= 81 && i <= 85

        max_f_d2s2t2(i-80) = max(exp(i).data(:,1)); % max load

    elseif i >= 86 && i <= 90

        max_f_d2s2t4(i-85) = max(exp(i).data(:,1)); % max load

    elseif i >= 91 && i <= 95

        max_f_d2s4t1(i-90) = max(exp(i).data(:,1)); % max load

    elseif i >= 96 && i <= 100

        max_f_d2s4t2(i-95) = max(exp(i).data(:,1)); % max load

    else

         max_f_d2s4t4(i-100) = max(exp(i).data(:,1)); % max load

    end

end

%% box plot 2D - vs spacing    

% d1
    % t1

t1d1 = zeros(1,15);
for i = 1:15

    if i <= 5
        
        t1d1(i) = max_f_d1s1t1(i);
        
    elseif i >= 6 && i <= 10

        t1d1(i) = max_f_d1s2t1(i-5);

    else
        t1d1(i) = max_f_d1s4t1(i-10);

    end
end
    
    % t2
t2d1 = zeros(1,15);
for i = 1:15

    if i <= 5
        
        t2d1(i) = max_f_d1s1t2(i);
        
    elseif i >= 6 && i <= 10

        t2d1(i) = max_f_d1s2t2(i-5);

    else
        t2d1(i) = max_f_d1s4t2(i-10);

    end
end

    % t4
t4d1 = zeros(1,15);
for i = 1:15

    if i <= 5
        
        t4d1(i) = max_f_d1s1t4(i);
        
    elseif i >= 6 && i <= 10

        t4d1(i) = max_f_d1s2t4(i-5);

    else
        t4d1(i) = max_f_d1s4t4(i-10);

    end
end

% d2
    % t1
t1d2 = zeros(1,15);
for i = 1:15

    if i <= 5
        
        t1d2(i) = max_f_d2s1t1(i);
        
    elseif i >= 6 && i <= 10

        t1d2(i) = max_f_d2s2t1(i-5);

    else
        t1d2(i) = max_f_d2s4t1(i-10);

    end
end
    
    % t2
t2d2 = zeros(1,15);
for i = 1:15

    if i <= 5
        
        t2d2(i) = max_f_d2s1t2(i);
        
    elseif i >= 6 && i <= 10

        t2d2(i) = max_f_d2s2t2(i-5);

    else
        t2d2(i) = max_f_d2s4t2(i-10);

    end
end

    % t4
t4d2 = zeros(1,15);
for i = 1:15

    if i <= 5
        
        t4d2(i) = max_f_d2s1t4(i);
        
    elseif i >= 6 && i <= 10

        t4d2(i) = max_f_d2s2t4(i-5);

    else
        t4d2(i) = max_f_d2s4t4(i-10);

    end
end

%% box plot of 2D samples
s = ['1 1 1 1 1 2 2 2 2 2 4 4 4 4 4'];
s = split(s);

figure(7)
sgtitle('Width = 1 [mm]')
subplot(1,3,1)
boxplot(t1d1,s)
title('height = 1 [mm]')
xlabel('spacing [mm]')
ylabel('max force [N]')

subplot(1,3,2)
boxplot(t2d1,s)
title('height = 2 [mm]')
xlabel('spacing [mm]')
ylabel('max force [N]')

subplot(1,3,3)
boxplot(t4d1,s)
title('height = 4 [mm]')
xlabel('spacing [mm]')
ylabel('max force [N]')
sgtitle('Width = 1 [mm]')

figure(8)
sgtitle('Width = 2 [mm]')
subplot(1,3,1)
boxplot(t1d2,s)
title('height = 1 [mm]')
xlabel('spacing [mm]')
ylabel('max force [N]')

subplot(1,3,2)
boxplot(t2d2,s)
title('height = 2 [mm]')
xlabel('spacing [mm]')
ylabel('max force [N]')

subplot(1,3,3)
boxplot(t4d2,s)
title('height = 4 [mm]')
xlabel('spacing [mm]')
ylabel('max force [N]')

%% box plot of 3D samples
figure(6)

max_f3D = zeros(1,15);
for i = 1:15
    if i <= 5
        max_f3D(i) = max_f_3Dt1(i);
    
    elseif i >= 6 && i <= 10
        max_f3D(i) = max_f_3Dt2(i-5);

    else
        max_f3D(i) = max_f_3Dt4(i-10);
    end

end

x6 = ('1 1 1 1 1 2 2 2 2 2 4 4 4 4 4');
x6 = split(x6);

boxplot(max_f3D,x6)
title('3D max force')
xlabel('height [mm]')
ylabel('max force applied [N]')
hold off

%% Means
% 3D
m_max_f_3Dt1= mean(max_f_3Dt1); 
m_max_f_3Dt2= mean(max_f_3Dt2);
m_max_f_3Dt4= mean(max_f_3Dt4);

% 2D

m_max_f_d1s1t1 = mean(max_f_d1s1t1); 
m_max_f_d1s1t2 = mean(max_f_d1s1t2);
m_max_f_d1s1t4 = mean(max_f_d1s1t4);
m_max_f_d1s2t1 = mean(max_f_d1s2t1);
m_max_f_d1s2t2 = mean(max_f_d1s2t2); 
m_max_f_d1s2t4 = mean(max_f_d1s2t4);
m_max_f_d1s4t1 = mean(max_f_d1s4t1);
m_max_f_d1s4t2 = mean(max_f_d1s4t2);
m_max_f_d1s4t4 = mean(max_f_d1s4t4);
m_max_f_d2s1t1 = mean(max_f_d2s1t1);
m_max_f_d2s1t2 = mean(max_f_d2s1t2);
m_max_f_d2s1t4 = mean(max_f_d2s1t4);
m_max_f_d2s2t1 = mean(max_f_d2s2t1);
m_max_f_d2s2t2 = mean(max_f_d2s2t2);
m_max_f_d2s2t4 = mean(max_f_d2s2t4);
m_max_f_d2s4t1 = mean(max_f_d2s4t1);
m_max_f_d2s4t2 = mean(max_f_d2s4t2);
m_max_f_d2s4t4 = mean(max_f_d2s4t4);

%% Plot

x = [1 2 4]; % height [t1,t2,t4]
y1 = [1 1 1]; % s1
y2 = [2 2 2]; % s2
y4 = [4 4 4]; % s4

% 3D
f3Dt1 = zeros(1,3);
f3Dt1(1)= m_max_f_3Dt1;
f3Dt1(f3Dt1==0) = nan;

f3Dt2 = zeros(1,3);
f3Dt2(2)= m_max_f_3Dt2;
f3Dt2(f3Dt2==0) = nan;

f3Dt4 = zeros(1,3);
f3Dt4(3)= m_max_f_3Dt4;
f3Dt4(f3Dt4==0) = nan;


figure(1)
title('3D max force')
stem(x,f3Dt1)
hold on
stem(x,f3Dt2)
stem(x,f3Dt4)
legend('3Dt1','3Dt2','3Dt4')
xlim([0 4])
xlabel('height')
ylabel('maximum load applied [N]')
grid on
hold off

% 2D - d1
d1s1t1 = zeros(1,3);
d1s1t1(1) = m_max_f_d1s1t1;
d1s1t1(d1s1t1==0)=nan;

d1s1t2 = zeros(1,3);
d1s1t2(2) = m_max_f_d1s1t2;
d1s1t2(d1s1t2==0)=nan;

d1s1t4 = zeros(1,3);
d1s1t4(3) = m_max_f_d1s1t4;
d1s1t4(d1s1t4==0)=nan;

d1s2t1 = zeros(1,3);
d1s2t1(1) = m_max_f_d1s2t1;
d1s2t1(d1s2t1==0)=nan;

d1s2t2 = zeros(1,3);
d1s2t2(2) = m_max_f_d1s2t2;
d1s2t2(d1s2t2==0)=nan;

d1s2t4 = zeros(1,3);
d1s2t4(3) = m_max_f_d1s2t4;
d1s2t4(d1s2t4==0)=nan;

d1s4t1 = zeros(1,3);
d1s4t1(1) = m_max_f_d1s4t1;
d1s4t1(d1s4t1==0)=nan;

d1s4t2 = zeros(1,3);
d1s4t2(2) = m_max_f_d1s4t2;
d1s4t2(d1s4t2==0)=nan;

d1s4t4 = zeros(1,3);
d1s4t4(3) = m_max_f_d1s4t4;
d1s4t4(d1s4t4==0)=nan;

figure(2)
stem3(x,y1,d1s1t1)
hold on
stem3(x,y1,d1s1t2)
stem3(x,y1,d1s1t4)
stem3(x,y2,d1s2t1)
stem3(x,y2,d1s2t2)
stem3(x,y2,d1s2t4)
stem3(x,y4,d1s4t1)
stem3(x,y4,d1s4t2)
stem3(x,y4,d1s4t4)
title('2D max force - d1 - Small pillar width')
xlabel('height')
ylabel('spacing')
hold off

% 2D - d2
d2s1t1 = zeros(1,3);
d2s1t1(1) = m_max_f_d2s1t1;
d2s1t1(d2s1t1==0)=nan;

d2s1t2 = zeros(1,3);
d2s1t2(2) = m_max_f_d2s1t2;
d2s1t2(d2s1t2==0)=nan;

d2s1t4 = zeros(1,3);
d2s1t4(3) = m_max_f_d2s1t4;
d2s1t4(d2s1t4==0)=nan;

d2s2t1 = zeros(1,3);
d2s2t1(1) = m_max_f_d2s2t1;
d2s2t1(d2s2t1==0)=nan;

d2s2t2 = zeros(1,3);
d2s2t2(2) = m_max_f_d2s2t2;
d2s2t2(d2s2t2==0)=nan;

d2s2t4 = zeros(1,3);
d2s2t4(3) = m_max_f_d2s2t4;
d2s2t4(d2s2t4==0)=nan;

d2s4t1 = zeros(1,3);
d2s4t1(1) = m_max_f_d2s4t1;
d2s4t1(d2s4t1==0)=nan;

d2s4t2 = zeros(1,3);
d2s4t2(2) = m_max_f_d2s4t2;
d2s4t2(d2s4t2==0)=nan;

d2s4t4 = zeros(1,3);
d2s4t4(3) = m_max_f_d2s4t4;
d2s4t4(d2s4t4==0)=nan;

figure(3)
stem3(x,y1,d2s1t1)
hold on
stem3(x,y1,d2s1t2)
stem3(x,y1,d2s1t4)

stem3(x,y2,d2s2t1)
stem3(x,y2,d2s2t2)
stem3(x,y2,d2s2t4)

stem3(x,y4,d2s4t1)
stem3(x,y4,d2s4t2)
stem3(x,y4,d2s4t4)

title('2D max force - d2 - Large pillar width')
xlabel('height')
ylabel('spacing')

hold off

%% Variance

v_max_f_d1s1t1 = var(max_f_d1s1t1); 
v_max_f_d1s1t2 = var(max_f_d1s1t2);
v_max_f_d1s1t4 = var(max_f_d1s1t4);
v_max_f_d1s2t1 = var(max_f_d1s2t1);
v_max_f_d1s2t2 = var(max_f_d1s2t2); 
v_max_f_d1s2t4 = var(max_f_d1s2t4);
v_max_f_d1s4t1 = var(max_f_d1s4t1);
v_max_f_d1s4t2 = var(max_f_d1s4t2);
v_max_f_d1s4t4 = var(max_f_d1s4t4);
v_max_f_d2s1t1 = var(max_f_d2s1t1);
v_max_f_d2s1t2 = var(max_f_d2s1t2);
v_max_f_d2s1t4 = var(max_f_d2s1t4);
v_max_f_d2s2t1 = var(max_f_d2s2t1);
v_max_f_d2s2t2 = var(max_f_d2s2t2);
v_max_f_d2s2t4 = var(max_f_d2s2t4);
v_max_f_d2s4t1 = var(max_f_d2s4t1);
v_max_f_d2s4t2 = var(max_f_d2s4t2);
v_max_f_d2s4t4 = var(max_f_d2s4t4);

variance(1) = v_max_f_d1s1t1;
variance(2) = v_max_f_d1s1t2;
variance(3) = v_max_f_d1s1t4;
variance(4) = v_max_f_d1s2t1;
variance(5) = v_max_f_d1s2t2;
variance(6) = v_max_f_d1s2t4;
variance(7) = v_max_f_d1s4t1;
variance(8) = v_max_f_d1s4t2;
variance(9) = v_max_f_d1s4t4;
variance(10) = v_max_f_d2s1t1;
variance(11) = v_max_f_d2s1t2;
variance(12) = v_max_f_d2s1t4;
variance(13) = v_max_f_d2s2t1;
variance(14) = v_max_f_d2s2t2;
variance(15) = v_max_f_d2s2t4;
variance(16) = v_max_f_d2s4t1;
variance(17) = v_max_f_d2s4t2;
variance(18) = v_max_f_d2s4t4;

%% Plot variance

% d1
figure (4)
v1 = ('s1t1 s1t2 s1t4 s2t1 s2t2 s2t4 s4t1 s4t2 s4t4');
v1 = split(v1);
%x4 = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18];
bar(variance(1:9))
xticklabels(v1)
title('Variance of max force - d1 - Width [1 mm] ')
hold off

% d2
figure(5)
v2 = ('s1t1 s1t2 s1t4 s2t1 s2t2 s2t4 s4t1 s4t2 s4t4');
v2 = split(v2);
bar(variance(10:18))
xticklabels(v2)
title('Variance of max force - d2 - Width [2 mm]')
hold off