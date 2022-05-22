clc; clear variables; close all

mean_linereg1a_s1 = 326.8;
mean_linereg2a_s1 = 433.55;
mean_linereg3a_s1 = 366.505;

mean_linereg1a_s2 = 266.29;
mean_linereg2a_s2 = 315.11;
mean_linereg3a_s2 = 187.0151;

mean_linereg1a_s4 = 207.7;
mean_linereg2a_s4 = 304.63;
mean_linereg3a_s4 = 123.44;


t = [1 2 4];

plot(t,[mean_linereg1a_s1 mean_linereg2a_s1 mean_linereg3a_s1],'go--')
hold on 
plot(t,[mean_linereg1a_s2 mean_linereg2a_s2 mean_linereg3a_s2],'bo--')
plot(t,[mean_linereg1a_s4 mean_linereg2a_s4 mean_linereg3a_s4],'ko--')
grid on
xlabel('Height t [mm]')
ylabel('k')
legend('s = 1','s = 2','s = 4','Location','best')
hold off
