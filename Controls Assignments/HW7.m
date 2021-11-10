%HW 7
%Stefan Lutschg
%% Problem 1
clear,clc,close all
Kd = logspace(-1,1);
figure;
H = tf([Kd(1) 0],[1 1+Kd(1) 1]);
pzmap(H);
hold on;
for i = 2:length(Kd)
    H = tf([Kd(i) 0],[1 1+Kd(i) 1]);
    pzmap(H);
end
ax = gca;
ax.FontSize = 20;
%% Problem 2
clear,clc,close all
L = tf(1,[1 10 0]);
rlocus(L);
title('Problem 2 Part a');
figure;
L = tf([1 3],[1 15 50]);
rlocus(L);
title('Problem 2 Part b');
%% Problem 5
clear,clc,close all
K = 0.54;
H = tf([0.415 0.14193 0.009545],[1 0.214 0.001449 0]);
rlocus(H);
title('Problem 5 Part b');