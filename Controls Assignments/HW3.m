%BE 404 HW 3
%% Problem 2
H1 = tf(1,[1 0 -1]);
impulse(H1);
figure;
H2 = tf(1,[1 4 5 0]);
impulse(H2);
figure;
H3 = tf(2,[1 1 1 1]);
impulse(H3)

%% Problem 3
clear,close all, clc;
G = tf(16,[1 1 16]);
step(G);

%% Problem 4
clear,close all, clc
H = tf(6.76e-4,[1 0.019 6.76e-4]);
step(H);