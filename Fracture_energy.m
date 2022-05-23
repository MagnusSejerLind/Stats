%% Determine Fracture energy 
clc,clear,close all

corexp = importdata("cordata.mat");

tnb = 15;  % [mm]
w = 45;  % [mm]
a = 22;  % [mm]
f = -4.5680;  % f(a/w)
E = 1.54*1E3; % [Mpa]


F = zeros(length(corexp),1);
K_1 = F;
for i = 1:105
    F(i) = max(corexp(i).data(:,1));

    K_1(i) = ( (F(i)) / (tnb * sqrt(w)) ) * f; 

end
K_1 = K_1';


% Fracture energy
G = ((K_1.^2) ./ E) * 1000; % [J/mm]

% plot(G,'.')
% bar(G)
clearvars b w a f E

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

figure(1)
bar(G_mean)

title('Fracture Energy vs Geometery')
ylabel('Fracture energy')
xlabel('Geometery')
grid
ylim([0 max(G_mean+2E2)])
% Set ticks
% xticks([-3*pi -2*pi -pi 0 pi 2*pi 3*pi])
% xticklabels({'','3d_d1s1t1','-2\pi','-\pi','0','\pi','2\pi','3\pi'})

%% Bar plot of fracture energy to height
% 
% % Subplot fracture energy of geometery
figure(2)
sgtitle('Fracture energy vs Height')

% Titles
tph = ('3Dd1s1 d1s1 d1s2 d1s4 d2s1 d2s2 d2s4');
tph = split(tph);

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
sgtitle('Fracture energy vs Spacing******NOT CORRECT******')

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
%%%%%%%%%%%%%%%%%%%%%%%% NOT CORRECT  %%%%%%%%%%%%%%%%%%%%%%%

%% Confidence interval

    % Example
% load examgrades
% x = grades(:,1);
% pd = fitdist(x,'Normal')
% ci = paramci(pd,'Alpha',.01)

% First experiment (3d_d1s1t1)
G3111 = G(1:5);
% Assuming normal distrubition for each experiments
NormD = fitdist(G3111','Normal');
% fprintf(' mu = %.3f\n sigma = %.3f\n',NormD.mu,NormD.sigma)

% Confidence interval for 95%
ci = paramci(NormD,'alpha',0.5);

G3111_m = mean(G3111);
figure(4) 
hold on
bar(G3111_m)
plot(ci(1,1),'*')
plot(ci(2,1),'*')
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Box plot %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Replacates the bar plots as box plots
% %% Box G vs height
% 
% tna = ones(1,5);  
% nob = repmat(2,1,5);
% tnc = repmat(4,1,5);
% 
% tn = cat(2,tna,nob,tnc);
% 
% 
% figure(5)
% % sgtitle('Fracture Energy vs Height')
% 
% 
% % Titles
% tph = ('3Dd1s1 d1s1 d1s2 d1s4 d2s1 d2s2 d2s4');
% tph = split(tph);
% 
% G_sub = 0;
% for i = 1:length(G)
%     if rem(i,15)==0
%         G_sub = G(i-14:i);
%         subplot(2,4,i/15)
%         boxplot(G_sub,tn)
%         title(tph(i/15))
%         xlabel('Height [mm]')
%         grid
%     end
% end
% 
% sgtitle('Fracture Energy vs Height')


%% Box G vs height - tile
tna = ones(1,5);  
tnb = repmat(2,1,5);
tnc= repmat(4,1,5);
tn = cat(2,tna,tnb,tnc);

figure(6)
% Titles
tph = ('3Dd1s1 d1s1 d1s2 d1s4 d2s1 d2s2 d2s4');
tph = split(tph);

t = tiledlayout(2,4);
title(t,'Fracture Energy vs Height')
for i = 1:length(G)
    if rem(i,15)==0
        G_sub = G(i-14:i);
        nexttile
        boxchart(tn,G_sub,'MarkerStyle','x')
%         boxplot(G_sub,no)
        title(tph(i/15))
        xlabel('Height [mm]')
        xticks([1 2 3 4 5])
        grid
    end
end

print('Fracture_energy_boxplot_vs_Height', '-depsc');  

%% box G vs Spacing - tile


figure(7)
% Exclude 3D
G_mod = G(16:end);

sn = tn;


% Titles
tph = ('d1t1 d1t2 d1t4 d2t1 d2t2 d2t4');
tph = split(tph);

t = tiledlayout(2,3);
title(t,'Fracture Energy vs Spacing')

for i = 1:length(G_mod)/3
    if i < 18
        if rem(i,5)==0
            nexttile
            G_subn = [G_mod(i-4:i),G_mod(i+15-4:i+15),G_mod(i+30-4:i+30)];
            boxchart(sn,G_subn,'MarkerStyle','x')
            title(tph(i/5))
            xlabel('Spacing [mm]')
            ylabel('Fracture energy')
            xticks([1 2 3 4 5])
            grid
        end

    elseif i > 19

        if rem(i,5)==0
            nexttile
            G_subn = [G_mod(i-4+30:i+30),G_mod(i+15-4+30:i+15+30),G_mod(i+30-4+30:i+30+30)];
            boxchart(sn,G_subn,'MarkerStyle','x')
            title(tph(i/5))
            xlabel('Spacing [mm]')
            ylabel('Fracture energy')
            xticks([1 2 3 4 5])
            grid
        end
    end
end

print('Fracture_energy_boxplot_vs_Spacing', '-depsc');  



%% box normalized vs height

% Load norm coeffcients (Determined in 'Linear_regerssion.m')
norm_cof = load('norm_cof');


figure(8)
% Titles
tph = ('3Dd1s1 d1s1 d1s2 d1s4 d2s1 d2s2 d2s4');
tph = split(tph);

t = tiledlayout(2,4);
title(t,'Fracture Energy vs Normalized Height')
for i = 1:length(G)
    if rem(i,15)==0
        G_sub = G(i-14:i);
        % Apply norm coefficients
        G_sub(6:10) = G_sub(6:10) * norm_cof.t_2v;
        G_sub(11:14) = G_sub(11:14) * norm_cof.t_4v;
        nexttile
        boxchart(tn,G_sub,'MarkerStyle','x')
        title(tph(i/15))
        xlabel('Height [mm]')
        xticks([1 2 3 4 5])
        grid
    end
end

print('Fracture_energy_boxplot_vs_Norm_Height', '-depsc');  



%% box normalized vs spacing
figure(9)

tph = ('d1t1 d1t2 d1t4 d2t1 d2t2 d2t4');
tph = split(tph);

t = tiledlayout(2,3);
title(t,'Fracture Energy vs Normalized Spacing')

for i = 1:length(G_mod)/3
    if i < 18
        if rem(i,5)==0
            nexttile
            G_subn = [G_mod(i-4:i),G_mod(i+15-4:i+15)*norm_cof.s_2v,G_mod(i+30-4:i+30)*norm_cof.s_4v];
            boxchart(sn,G_subn,'MarkerStyle','x')
            title(tph(i/5))
            xlabel('Spacing [mm]')
            ylabel('Fracture energy')
            xticks([1 2 3 4 5])
            grid
        end

    elseif i > 19

        if rem(i,5)==0
            nexttile
            G_subn = [G_mod(i-4+30:i+30),G_mod(i+15-4+30:i+15+30)...
                *norm_cof.s_2v,G_mod(i+30-4+30:i+30+30)*norm_cof.s_4v];
            boxchart(sn,G_subn,'MarkerStyle','x')
            title(tph(i/5))
            xlabel('Spacing [mm]')
            ylabel('Fracture energy')
            xticks([1 2 3 4 5])
            grid
        end
    end
end

print('Fracture_energy_boxplot_vs_Norm_Spacing', '-depsc'); 


%% Width normalized vs normalized height 

figure(10)

% Titles
tph = ('3Dd1s1 d1s1 d1s2 d1s4 d2s1 d2s2 d2s4');
tph = split(tph);

t = tiledlayout(2,4);
title(t,'Normalized Width Fracture Energy vs Height')
G_sub = 0;
for i = 1:length(G)
    if rem(i,15)==0
        G_sub = G(i-14:i);
        % Apply norm coefficients height
        G_sub(6:10) = G_sub(6:10) * norm_cof.t_2v;
        G_sub(11:14) = G_sub(11:14) * norm_cof.t_4v;
        if i < 46
            % Apply norm coefficients width
            G_sub = G_sub * norm_cof.d_2v;
        end
        nexttile
        boxchart(tn,G_sub,'MarkerStyle','x')
        title(tph(i/15))
        xlabel('Height [mm]')
        xticks([1 2 3 4 5])
        grid
    end
end

print('Fracture_energy_boxplot_vs_Height_Norm_Width', '-depsc'); 



%% Width normalized vs normalized Spacing

figure(11)

% Titles
tph = ('d1t1 d1t2 d1t4 d2t1 d2t2 d2t4');
tph = split(tph);

t = tiledlayout(2,3);
title(t,'Normalized width Fracture Energy vs Spacing')

for i = 1:length(G_mod)/3
    if i < 18
        if rem(i,5)==0
            nexttile
            G_subn = [G_mod(i-4:i),G_mod(i+15-4:i+15)*norm_cof.s_2v,G_mod(i+30-4:i+30)*norm_cof.s_4v];
            G_subn = G_subn * norm_cof.d_2v;
            boxchart(sn,G_subn,'MarkerStyle','x')
            title(tph(i/5))
            xlabel('Spacing [mm]')
            ylabel('Fracture energy')
            xticks([1 2 3 4 5])
            grid
        end

    elseif i > 19

        if rem(i,5)==0
            nexttile
            G_subn = [G_mod(i-4+30:i+30),G_mod(i+15-4+30:i+15+30)...
                *norm_cof.s_2v,G_mod(i+30-4+30:i+30+30)*norm_cof.s_4v];
            boxchart(sn,G_subn,'MarkerStyle','x')
            title(tph(i/5))
            xlabel('Spacing [mm]')
            ylabel('Fracture energy')
            xticks([1 2 3 4 5])
            grid
        end
    end
end



print('Fracture_energy_boxplot_vs_Spacing_Norm_Width', '-depsc'); 


