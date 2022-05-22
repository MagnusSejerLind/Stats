%%
clc; clear variables; close all

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

M_area = t_max*L-floor(n_unit)*s*t;

t_2v = M_area(1)/M_area(2);
t_4v = M_area(1)/M_area(3);


%% Variation in s