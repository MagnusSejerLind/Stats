clc,clear,close all

corexp = importdata("cordata.mat");

b = 15;  % [mm]
w = 45;  % [mm]
a = 22;  % [mm]
f = -4.5680;  % f(a/w)
E = 1.54*1E3; % [Mpa]


F = zeros(length(corexp),1);
K_1 = F;
for i = 1:105
    F(i) = max(corexp(i).data(:,1));

    K_1(i) = ( (F(i)) / (b * sqrt(w)) ) * f; 

end
K_1 = K_1';


% Fracture energy
G = ((K_1.^2) ./ E) * 1000; % [J/mm]

% plot(G,'.')
% bar(G)


%% Fracture energy mean
% Determine mean fracture energy for each geometery

inx = 1;
G_iSum = 0;
G_mean = zeros(1,length(G)/5);
for i = 1:length(G)
    G_iSum = G_iSum + G(i);
    if rem(i,5) == 0
        G_mean(inx) = G_iSum/5;
        inx = inx + 1;
        G_iSum = 0;
    end

end


%% Bar plot of fracture energy
% Relates geometery to fracture energy
% close
% 
% figure(1)
% bar(G_mean)
% 
% title('Fracture Energy vs Geometery')
% ylabel('Fracture energy')
% xlabel('Geometery')
% grid
% ylim([0 max(G_mean+2E2)])
% % Set ticks
% xticks([-3*pi -2*pi -pi 0 pi 2*pi 3*pi])
% xticklabels({'','3d_d1s1t1','-2\pi','-\pi','0','\pi','2\pi','3\pi'})

%% Bar plot of fracture energy to height

% Subplot fracture energy of geometery
figure(2)
sgtitle('Fracture energy vs Height')

% Titles
tph = ('3Dd1s1 d1s1 d1s2 d1s4 d2s1 d2s2 d2s4');
tph = split(tph);

G_sub = 0;
for k = 1:length(G_mean)

    if rem(k,3) == 0       
        subplot(2,4,k/3)
        G_sub = [G_mean(k-2),G_mean(k-1),G_mean(k)];
        bar(G_sub)
        xticklabels({'t=1','t=2','t=4'})
        ylabel('Fracture energy')
%         ylim([0 max(G_mean+1E3)])
        title(tph(k/3))
        grid
    end
end



%% Bar plot of fracture energy to Spacing

% Exclude 3D
G_mean_mod = G_mean(4:end);


figure(3)
sgtitle('Fracture energy vs Spacing')

% Titles
tph = ('d1t1 d1t2 d1t4 d2t1 d2t2 d2t4');
tph = split(tph);

for i = 1:length(G_mean_mod)/3
    subplot(2,3,i)
    G_subn = [G_mean_mod(i),G_mean_mod(i+3),G_mean_mod(i+6)];
    bar(G_subn)
    xticklabels({'s=1','s=2','s=4'})
    ylabel('Fracture energy')
    title(tph(i))
    grid
end


%% Confidence interval

% Example
% load examgrades
% x = grades(:,1);
% 
% 
% pd = fitdist(x,'Normal')
% ci = paramci(pd,'Alpha',.01)






