%Homework 6
% Stefan Lütschg
%% Problem 1
%part a
clear, close all;

H = tf(1,[1 6]);
Y = impulse(H);
t = 0:0.01:length(Y);
r = dirac(t);
plot(t,r,'LineWidth',1);
hold on;
plot(1:length(Y),Y,'LineWidth',1);
legend('r(t)','y(t)'); title('Problem 1 part a');
grid on;
%part b
clear, close all
H = tf(1,[1 6]);
Y = step(H);
t = 0:0.01:length(Y);
r = ones(1,length(t));
plot(t,r,'LineWidth',1);
hold on;
plot(1:length(Y),Y,'LineWidth',1);
legend('r(t)','y(t)'); title('Problem 1 part b');
grid on;
%part c
clear,close all
H = tf(1,[1 6]);
Y = 3*step(H);
t = 0:0.01:5;
r = 3*ones(1,length(t));
plot(t,r,'LineWidth',1);
hold on;
plot(1:length(Y),Y,'LineWidth',1);
legend('r(t)','y(t)'); title('Problem 1 part c');
grid on;
%part d
clear,close all
H = tf(1,[1 6]);
t = 0:0.01:5;
r = t;
F = lsim(H,r,t);
plot(t,r,'LineWidth',1);
hold on;
plot(t,F,'LineWidth',1);
legend('r(t)','y(t)'); title('Problem 1 part d');
%% Problem 3
clear,clc,close all
P = tf(1,[1 5 1]);
Kd = 5;
Kp = 5;
Ki = 5;
C = tf([Kd Kp Ki],1);
H = (P*C)/(1+(P*C));
pzplot(H);
figure;
step(H);