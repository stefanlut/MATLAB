%HW 8 
%Stefan Lütschg
%% Problem 2
clear,clc,close all
L = tf(1,[1 38 255 450]);
rlocus(L);
gain = 661;
G = tf(gain,[1 38 255 450]);
H = G/(1 + G);
figure;
step(H);

%% Problem 3
clear,clc,close all
L = tf([1 22.2],[1 11.001 11.011 10.011 0.01]);
rlocus(L);