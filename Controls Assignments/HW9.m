%HW 9
%Stefan Lütschg
%% Problem 1
clear,clc,close all
G = tf(100,[1 11 10]);
t = 0:0.001:10;
u = sin(t);
lsim(G,u,t);
title('Linear Simulation Results Problem 1d');
%% Problem 2
clear,clc,close all
G1 = tf([1 1],conv([1 0],[1 10]));
bode(G1);
figure;
G2 = tf(conv([1 0.1],[1 10]),conv([1 0 0],conv([1 1],[1 100])));
bode(G2);
figure;
G3 = tf(1000*conv([1 1],[1 1]),conv([1 0.1 100],[1 0.1]));
bode(G3);

%% Problem 4
clear,clc,close all
K = 1;
H = tf(0.1*K,[1 1 1 0.1*K]);
L = tf(0.1,[1 1 1 0]);
margin(H);
figure;
rlocus(L);

%% Problem 5
clear,clc,close all
bode(tf(1,conv([1 10],conv([1 1],[1 1]))));
figure;
rlocus(tf(1,conv([1 10],conv([1 1],[1 1]))));